import { supabase } from './supabase.js';

/**
 * Carrega todos os dados necessários para o dashboard administrativo
 */
/**
 * Carrega todos os dados necessários para o dashboard administrativo
 */
async function loadDashboardData() {
    try {
        // 1. Identificar usuário autenticado para exibição
        const { data: { user } } = await supabase.auth.getUser();
        if (user) {
            const userDisplay = document.getElementById('user-display');
            if (userDisplay) userDisplay.innerText = user.email;
        }

        // 2. Buscar Contagens de Imóveis (Ativos vs Inativos)
        const { count: activeCount } = await supabase
            .from('imoveis')
            .select('*', { count: 'exact', head: true })
            .eq('ativo', true);

        const { count: inactiveCount } = await supabase
            .from('imoveis')
            .select('*', { count: 'exact', head: true })
            .eq('ativo', false);

        // 3. Buscar Total de Leads
        const { count: totalLeads } = await supabase
            .from('leads')
            .select('*', { count: 'exact', head: true });

        // 4. Buscar Total de Imóveis Vendidos
        const { count: soldCount } = await supabase
            .from('imoveis')
            .select('*', { count: 'exact', head: true })
            .eq('status_imovel', 'Vendido');

        // 5. Buscar os 5 Leads mais recentes para a lista de atividades
        const { data: recentLeads, error: recentError } = await supabase
            .from('leads')
            .select('*')
            .order('created_at', { ascending: false })
            .limit(5);

        if (recentError) throw recentError;

        // 6. Dados para Gráficos de Evolução (Últimos 7 dias)
        const last7Days = [];
        for (let i = 6; i >= 0; i--) {
            const date = new Date();
            date.setDate(date.getDate() - i);
            last7Days.push(date.toISOString().split('T')[0]);
        }

        // Busca leads dos últimos 7 dias
        const sevenDaysAgo = last7Days[0];
        const { data: leadsEvolution } = await supabase
            .from('leads')
            .select('created_at')
            .gte('created_at', sevenDaysAgo);

        // Busca imóveis vendidos (considerando updated_at como data da venda)
        const { data: salesEvolution } = await supabase
            .from('imoveis')
            .select('updated_at')
            .eq('status_imovel', 'Vendido')
            .gte('updated_at', sevenDaysAgo);

        // 7. Atualizar Elementos da Interface (Métricas)
        updateElementText('stat-active', activeCount || 0);
        updateElementText('stat-inactive', inactiveCount || 0);
        updateElementText('stat-leads', totalLeads || 0);
        updateElementText('stat-sold', soldCount || 0);

        // 8. Renderizar a lista de leads recentes
        renderRecentLeads(recentLeads || []);

        // 9. Renderizar Gráficos
        renderEvolutionCharts(last7Days, leadsEvolution || [], salesEvolution || []);

    } catch (err) {
        console.error('Erro ao carregar dados do dashboard:', err.message);
    }
}

/**
 * Renderiza os gráficos de evolução usando Chart.js
 */
function renderEvolutionCharts(days, leadsData, salesData) {
    const leadsCountByDay = days.map(day =>
        leadsData.filter(l => l.created_at.startsWith(day)).length
    );

    const salesCountByDay = days.map(day =>
        salesData.filter(s => s.updated_at.startsWith(day)).length
    );

    const chartConfig = (label, data, color) => ({
        type: 'line',
        data: {
            labels: days.map(d => new Date(d).toLocaleDateString('pt-BR', { day: '2-digit', month: '2-digit' })),
            datasets: [{
                label: label,
                data: data,
                borderColor: color,
                backgroundColor: color + '20',
                fill: true,
                tension: 0.4,
                pointRadius: 4,
                pointBackgroundColor: color
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: { display: false }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: { stepSize: 1, color: '#94a3b8' },
                    grid: { color: '#f1f5f9' }
                },
                x: {
                    grid: { display: false },
                    ticks: { color: '#94a3b8' }
                }
            }
        }
    });

    const ctxLeads = document.getElementById('chart-leads');
    const ctxSold = document.getElementById('chart-sold');

    if (ctxLeads) new Chart(ctxLeads, chartConfig('Novos Leads', leadsCountByDay, '#2563eb'));
    if (ctxSold) new Chart(ctxSold, chartConfig('Imóveis Vendidos', salesCountByDay, '#10b981'));
}

/**
 * Helper para atualizar texto de elementos com segurança
 */
function updateElementText(id, text) {
    const el = document.getElementById(id);
    if (el) el.innerText = text;
}

/**
 * Renderiza os leads na seção de "Leads Recentes"
 */
function renderRecentLeads(leads) {
    const list = document.getElementById('dashboard-leads-list');
    if (!list) return;

    if (leads.length === 0) {
        list.innerHTML = `
            <div class="text-center py-12">
                <p class="text-slate-400 text-sm">Nenhum lead encontrado no momento.</p>
            </div>
        `;
        return;
    }

    list.innerHTML = leads.map(l => {
        const date = new Date(l.created_at).toLocaleDateString('pt-BR', {
            day: '2-digit',
            month: '2-digit',
            hour: '2-digit',
            minute: '2-digit'
        });

        const initial = l.nome ? l.nome.charAt(0).toUpperCase() : '?';

        return `
            <div class="flex flex-col sm:flex-row sm:items-center justify-between p-4 hover:bg-slate-50 rounded-xl transition border border-transparent hover:border-slate-100 group gap-4 sm:gap-0">
                <div class="flex items-center gap-4 min-w-0">
                    <div class="w-10 h-10 bg-blue-100 text-blue-600 rounded-full flex-shrink-0 flex items-center justify-center font-bold text-sm">
                        ${initial}
                    </div>
                    <div class="min-w-0">
                        <p class="font-bold text-slate-900 text-sm truncate" title="${l.nome || 'Cliente sem nome'}">${l.nome || 'Cliente sem nome'}</p>
                        <p class="text-xs text-slate-500 truncate" title="${l.imovel_interesse || 'Interesse Geral'}">${l.imovel_interesse || 'Interesse Geral'}</p>
                    </div>
                </div>
                <div class="text-left sm:text-right flex-shrink-0">
                    <span class="inline-block text-[10px] font-bold uppercase tracking-wider px-2 py-0.5 rounded bg-slate-100 text-slate-500 mb-1">
                        ${l.origem || 'N/A'}
                    </span>
                    <p class="text-xs text-slate-400 font-medium">${date}</p>
                </div>
            </div>
        `;
    }).join('');
}

// Inicia o processo de carregamento quando o DOM estiver pronto
document.addEventListener('DOMContentLoaded', loadDashboardData);