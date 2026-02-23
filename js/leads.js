
import { supabase } from './supabase.js';

let allLeads = [];
let filteredLeads = [];
let currentViewMode = 'cards'; // 'cards' ou 'table'

/**
 * Formata as labels de origem para exibição amigável
 */
function formatOriginLabel(origin) {
    if (!origin) return "N/A";
    const lower = origin.toLowerCase();

    // Fallbacks para termos comuns
    if (lower === 'whatsapp') return 'WhatsApp';
    if (lower === 'pagina') return 'Página Principal';

    // Formatação amigável para outros termos (ex: FOOTER - IMÓVEL DESEJADO -> Footer - Imóvel Desejado)
    return origin.split(' ').map(word => {
        if (word === '-' || word === '–') return word;
        return word.charAt(0).toUpperCase() + word.slice(1).toLowerCase();
    }).join(' ');
}

/**
 * Popula o select de origens com opções fixas e controladas
 */
function populateOriginFilter(leads) {
    const originFilter = document.getElementById('filter-origin');
    if (!originFilter) return;

    // As 4 opções fixas determinadas pelo negócio
    const strictOrigins = [
        "Popup pela 1ª vez",
        "Popup pela 2ª vez",
        "Footer Buscar Imóvel",
        "Footer Vender Imóvel"
    ];

    let html = '<option value="">Todas as Origens</option>';

    strictOrigins.forEach(origin => {
        html += `<option value="${origin}">${origin}</option>`;
    });

    originFilter.innerHTML = html;
}

/**
 * Carrega os leads do banco de dados
 */
async function loadLeads() {
    try {
        const { data: leads, error } = await supabase
            .from('leads')
            .select('*')
            .order('created_at', { ascending: false });

        if (error) throw error;

        allLeads = leads || [];
        filteredLeads = [...allLeads];

        // Popula os filtros dinamicamente antes de renderizar
        populateOriginFilter(allLeads);
        renderLeads(filteredLeads);
        setupFilters();
    } catch (err) {
        console.error('Erro ao carregar leads:', err.message);
        const feedback = `<div class="col-span-full p-10 text-center text-red-500 font-bold">Erro ao acessar o banco de dados.</div>`;
        document.getElementById('leads-container').innerHTML = feedback;
    }
}

/**
 * Configura os listeners dos filtros
 */
function setupFilters() {
    const originFilter = document.getElementById('filter-origin');
    const interestFilter = document.getElementById('filter-interest');
    const dateStartFilter = document.getElementById('filter-date-start');
    const dateEndFilter = document.getElementById('filter-date-end');
    const clearBtn = document.getElementById('btn-clear-filters');
    const exportBtn = document.getElementById('btn-export-csv');

    const apply = () => {
        const origin = originFilter.value;
        const interest = interestFilter.value.toLowerCase();
        const start = dateStartFilter.value;
        const end = dateEndFilter.value;

        filteredLeads = allLeads.filter(l => {
            const matchesOrigin = !origin || l.origem === origin;
            const matchesInterest = !interest || (l.imovel_interesse || '').toLowerCase().includes(interest);

            // Lógica de Data
            let matchesDate = true;
            if (start || end) {
                const leadDate = new Date(l.created_at).toISOString().split('T')[0];
                if (start && leadDate < start) matchesDate = false;
                if (end && leadDate > end) matchesDate = false;
            }

            return matchesOrigin && matchesInterest && matchesDate;
        });

        renderLeads(filteredLeads);
    };

    originFilter.addEventListener('change', apply);
    interestFilter.addEventListener('input', apply);
    dateStartFilter.addEventListener('change', apply);
    dateEndFilter.addEventListener('change', apply);

    clearBtn.addEventListener('click', () => {
        originFilter.value = '';
        interestFilter.value = '';
        dateStartFilter.value = '';
        dateEndFilter.value = '';
        filteredLeads = [...allLeads];
        renderLeads(filteredLeads);
    });

    exportBtn.addEventListener('click', () => {
        if (filteredLeads.length === 0) {
            alert('Não há leads para exportar com os filtros atuais.');
            return;
        }
        exportLeadsToCSV(filteredLeads);
    });

    const btnViewCards = document.getElementById('btn-view-cards');
    const btnViewTable = document.getElementById('btn-view-table');

    if (btnViewCards && btnViewTable) {
        btnViewCards.addEventListener('click', () => {
            currentViewMode = 'cards';
            btnViewCards.classList.replace('text-slate-400', 'text-blue-600');
            btnViewCards.classList.replace('hover:text-slate-600', 'bg-white');
            btnViewCards.classList.add('shadow-sm');

            btnViewTable.classList.replace('text-blue-600', 'text-slate-400');
            btnViewTable.classList.replace('bg-white', 'hover:text-slate-600');
            btnViewTable.classList.remove('shadow-sm');

            renderLeads(filteredLeads);
        });

        btnViewTable.addEventListener('click', () => {
            currentViewMode = 'table';
            btnViewTable.classList.replace('text-slate-400', 'text-blue-600');
            btnViewTable.classList.replace('hover:text-slate-600', 'bg-white');
            btnViewTable.classList.add('shadow-sm');

            btnViewCards.classList.replace('text-blue-600', 'text-slate-400');
            btnViewCards.classList.replace('bg-white', 'hover:text-slate-600');
            btnViewCards.classList.remove('shadow-sm');

            renderLeads(filteredLeads);
        });
    }
}

/**
 * Renderiza os leads em formato de cards responsivos
 */
function renderLeads(leads) {
    const container = document.getElementById('leads-container');
    if (!container) return;

    if (leads.length === 0) {
        container.className = 'grid grid-cols-1';
        container.innerHTML = `<div class="col-span-full p-20 text-center text-slate-400 font-medium">Nenhum lead encontrado para os filtros aplicados.</div>`;
        return;
    }

    if (currentViewMode === 'cards') {
        container.className = 'grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6';
        container.innerHTML = leads.map(l => {
            const date = new Date(l.created_at).toLocaleDateString('pt-BR', {
                day: '2-digit',
                month: '2-digit',
                hour: '2-digit',
                minute: '2-digit'
            });

            const cleanPhone = (l.telefone || '').replace(/\D/g, '');
            const nomeCliente = l.nome ? l.nome.split(' ')[0] : 'cliente';
            const imovel = l.imovel_interesse || 'interesse geral';
            const message = `Olá ${nomeCliente}! Recebemos seu contato pelo site sobre o imóvel "${imovel}" e gostaria de te ajudar.`;
            const waLink = `https://wa.me/55${cleanPhone}?text=${encodeURIComponent(message)}`;

            const lowerOrigin = (l.origem || '').toLowerCase();
            let originClass = 'bg-slate-100 text-slate-700';

            if (lowerOrigin === 'whatsapp') {
                originClass = 'bg-emerald-100 text-emerald-700';
            } else if (lowerOrigin === 'pagina') {
                originClass = 'bg-blue-100 text-blue-700';
            } else if (lowerOrigin.includes('footer')) {
                originClass = 'bg-indigo-100 text-indigo-700';
            }

            return `
            <div class="bg-[#f8fafc] p-2 rounded-[2rem] border-2 border-slate-100 hover:border-slate-200 transition-all flex flex-col gap-2 animate-in fade-in slide-in-from-bottom-2 duration-300" id="lead-card-${l.id}">
                
                <div class="bg-white p-5 rounded-[1.5rem] shadow-sm flex justify-between items-center">
                    <div class="flex items-center gap-3">
                        <div class="w-10 h-10 bg-slate-900 rounded-full text-white flex items-center justify-center font-bold">
                            ${l.nome ? l.nome.charAt(0).toUpperCase() : '?'}
                        </div>
                        <div>
                            <h3 class="font-bold text-slate-800 text-md leading-none mb-1">${l.nome || 'Cliente não identificado'}</h3>
                            <p class="text-[10px] font-bold text-slate-400">${date}</p>
                        </div>
                    </div>
                    <div class="px-2 py-1 rounded text-[10px] font-bold uppercase tracking-wider ${originClass}">
                        ${formatOriginLabel(l.origem)}
                    </div>
                </div>

                <div class="bg-white p-5 rounded-[1.5rem] shadow-sm space-y-2">
                    <p class="text-sm font-bold text-slate-600 flex justify-between items-center">
                        <span class="text-slate-400 text-[10px] font-black uppercase tracking-widest">Telefone</span> 
                        <span>${l.telefone || 'Não informado'}</span>
                    </p>
                    ${lowerOrigin.includes('footer') && l.email ? `
                    <div class="h-px bg-slate-50 w-full my-1"></div>
                    <p class="text-sm font-bold text-slate-600 flex justify-between items-center">
                        <span class="text-slate-400 text-[10px] font-black uppercase tracking-widest">E-mail</span> 
                        <span class="truncate max-w-[150px]" title="${l.email}">${l.email}</span>
                    </p>
                    ` : ''}
                    <div class="h-px bg-slate-50 w-full my-1"></div>
                    <p class="text-sm font-bold text-slate-600 flex justify-between items-center">
                        <span class="text-slate-400 text-[10px] font-black uppercase tracking-widest">Interesse</span> 
                        <span class="truncate max-w-[130px]" title="${l.imovel_interesse || 'Geral'}">${l.imovel_interesse || 'Geral'}</span>
                    </p>
                </div>

                <div class="flex gap-2">
                    <button onclick="deleteLead('${l.id}')" class="w-16 bg-white rounded-[1.5rem] flex items-center justify-center text-red-400 hover:text-red-500 hover:bg-red-50 shadow-sm border border-transparent hover:border-red-100 transition-all focus:scale-95" title="Excluir Lead">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"/></svg>
                    </button>
                    
                    <a href="${waLink}" target="_blank" class="flex-1 bg-emerald-500 text-white rounded-[1.5rem] py-3 font-bold text-sm hover:bg-emerald-600 shadow-sm transition-all active:scale-95 flex items-center justify-center gap-2">
                        WhatsApp
                    </a>
                </div>
            </div>
        `;
        }).join('');
    } else {
        container.className = 'block';

        let rows = leads.map(l => {
            const date = new Date(l.created_at).toLocaleDateString('pt-BR', {
                day: '2-digit', month: '2-digit', hour: '2-digit', minute: '2-digit'
            });
            const cleanPhone = (l.telefone || '').replace(/\D/g, '');
            const nomeCliente = l.nome ? l.nome.split(' ')[0] : 'cliente';
            const imovel = l.imovel_interesse || 'interesse geral';
            const message = `Olá ${nomeCliente}! Recebemos seu contato pelo site sobre o imóvel "${imovel}" e gostaria de te ajudar.`;
            const waLink = `https://wa.me/55${cleanPhone}?text=${encodeURIComponent(message)}`;
            const lowerOrigin = (l.origem || '').toLowerCase();
            let originClass = 'bg-slate-100 text-slate-700';
            if (lowerOrigin === 'whatsapp') originClass = 'bg-emerald-100 text-emerald-700';
            else if (lowerOrigin === 'pagina') originClass = 'bg-blue-100 text-blue-700';
            else if (lowerOrigin.includes('footer')) originClass = 'bg-indigo-100 text-indigo-700';

            return `
                <tr class="hover:bg-slate-50 transition-colors border-b border-slate-100">
                    <td class="py-4 px-6">
                        <div class="flex items-center gap-3">
                            <div class="w-8 h-8 rounded-full bg-slate-900 text-white flex items-center justify-center font-bold text-xs">
                                ${l.nome ? l.nome.charAt(0).toUpperCase() : '?'}
                            </div>
                            <div class="flex flex-col">
                                <span class="font-bold text-slate-800 text-sm">${l.nome || 'Cliente não identificado'}</span>
                                <span class="text-[10px] text-slate-400 font-bold">${date}</span>
                            </div>
                        </div>
                    </td>
                    <td class="py-4 px-6">
                        <span class="px-2.5 py-1 rounded-lg text-[10px] font-bold uppercase tracking-widest ${originClass} whitespace-nowrap">
                            ${formatOriginLabel(l.origem)}
                        </span>
                    </td>
                    <td class="py-4 px-6 text-sm font-bold text-slate-600 space-y-1">
                        <div class="flex items-center gap-2"><span class="opacity-50">📞</span><span>${l.telefone || '-'}</span></div>
                        ${lowerOrigin.includes('footer') && l.email ? `<div class="flex items-center gap-2"><span class="opacity-50">✉️</span><span class="truncate max-w-[150px]" title="${l.email}">${l.email}</span></div>` : ''}
                    </td>
                    <td class="py-4 px-6">
                        <span class="text-xs font-bold text-slate-700 block truncate max-w-[180px]" title="${l.imovel_interesse || 'Geral'}">
                            ${l.imovel_interesse || 'Geral'}
                        </span>
                    </td>
                    <td class="py-4 px-6">
                        <div class="flex items-center justify-end gap-3">
                            <button onclick="deleteLead('${l.id}')" class="text-red-400 hover:text-red-600 hover:bg-red-50 p-2 rounded-lg transition-all" title="Excluir Lead">
                                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"/></svg>
                            </button>
                            <a href="${waLink}" target="_blank" class="bg-emerald-500 text-white px-4 py-2 rounded-xl font-bold text-xs hover:bg-emerald-600 transition-all active:scale-95 flex items-center justify-center">
                                WhatsApp
                            </a>
                        </div>
                    </td>
                </tr>
            `;
        }).join('');

        container.innerHTML = `
            <div class="bg-white rounded-2xl shadow-sm border border-slate-100 overflow-hidden animate-in fade-in slide-in-from-bottom-2 duration-300">
                <div class="overflow-x-auto">
                    <table class="w-full text-left border-collapse min-w-[800px]">
                        <thead>
                            <tr class="bg-slate-50 border-b border-slate-100 text-[10px] uppercase tracking-widest text-slate-400">
                                <th class="py-4 px-6 font-black">Cliente & Data</th>
                                <th class="py-4 px-6 font-black">Origem</th>
                                <th class="py-4 px-6 font-black">Contato</th>
                                <th class="py-4 px-6 font-black">Interesse</th>
                                <th class="py-4 px-6 font-black text-right">Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            ${rows}
                        </tbody>
                    </table>
                </div>
            </div>
        `;
    }
}

/**
 * Função de Exportação para CSV
 */
function exportLeadsToCSV(leads) {
    const headers = ['Nome', 'Telefone', 'Origem', 'Imóvel / Interesse', 'Data'];

    const rows = leads.map(l => {
        const date = new Date(l.created_at).toLocaleDateString('pt-BR', {
            day: '2-digit', month: '2-digit', year: 'numeric', hour: '2-digit', minute: '2-digit'
        });

        // Escape de aspas e ponto e vírgula para evitar quebra do CSV
        const escape = (text) => `"${(text || '').toString().replace(/"/g, '""')}"`;

        return [
            escape(l.nome),
            escape(l.telefone),
            escape(l.origem),
            escape(l.imovel_interesse),
            escape(date)
        ].join(';');
    });

    const csvContent = [headers.join(';'), ...rows].join('\n');

    // Blob com UTF-8 BOM para garantir acentos no Excel
    const blob = new Blob(['\uFEFF' + csvContent], { type: 'text/csv;charset=utf-8;' });
    const url = URL.createObjectURL(blob);

    const link = document.createElement('a');
    link.setAttribute('href', url);
    link.setAttribute('download', 'Leads_data.csv');
    link.style.visibility = 'hidden';

    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}

/**
 * Exclui um lead do banco de dados e remove o card da tela
 */
window.deleteLead = async (id) => {
    if (!confirm('Deseja excluir este lead permanentemente?')) return;

    try {
        const { error } = await supabase
            .from('leads')
            .delete()
            .eq('id', id);

        if (error) throw error;

        const card = document.getElementById(`lead-card-${id}`);
        if (card) {
            card.style.opacity = '0';
            card.style.transform = 'scale(0.9)';
            setTimeout(() => card.remove(), 300);
        }

        // Atualiza a lista em memória
        allLeads = allLeads.filter(l => l.id !== id);
    } catch (err) {
        console.error('Erro ao excluir lead:', err.message);
        alert('Não foi possível excluir o lead no momento.');
    }
};

document.addEventListener('DOMContentLoaded', loadLeads);
