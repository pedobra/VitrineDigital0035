import { supabase } from './supabase.js';

let allSoldProperties = [];

async function loadFinanceData() {
    try {
        const { data: properties, error } = await supabase
            .from('imoveis')
            .select('*')
            .eq('status_imovel', 'Vendido')
            .order('updated_at', { ascending: false });

        if (error) throw error;

        allSoldProperties = properties || [];
        renderFinance(allSoldProperties);
        updateTotals(allSoldProperties);
    } catch (err) {
        console.error('Erro ao carregar dados financeiros:', err.message);
        const feedback = `<p class="p-10 text-center text-red-500 font-medium">Erro ao carregar dados: ${err.message}</p>`;
        const tableBody = document.getElementById('finance-table-body');
        if (tableBody) tableBody.innerHTML = `<tr><td colspan="5">${feedback}</td></tr>`;
    }
}

function filterProperties() {
    const start = document.getElementById('filter-start-date').value;
    const end = document.getElementById('filter-end-date').value;

    let filtered = [...allSoldProperties];

    if (start) {
        const startDate = new Date(start);
        startDate.setHours(0, 0, 0, 0);
        filtered = filtered.filter(p => new Date(p.updated_at) >= startDate);
    }

    if (end) {
        const endDate = new Date(end);
        endDate.setHours(23, 59, 59, 999);
        filtered = filtered.filter(p => new Date(p.updated_at) <= endDate);
    }

    renderFinance(filtered);
    updateTotals(filtered);
}

function updateTotals(properties) {
    let totalVendas = 0;
    let totalComissoes = 0;

    properties.forEach(p => {
        const valor = p.valor_venda || 0;
        const comissaoPercent = p.comissao || 0;
        const valorComissao = (valor * comissaoPercent) / 100;

        totalVendas += valor;
        totalComissoes += valorComissao;
    });

    const fmt = new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' });

    const elVendas = document.getElementById('total-vendas');
    const elComissoes = document.getElementById('total-comissoes');

    if (elVendas) elVendas.innerText = fmt.format(totalVendas);
    if (elComissoes) elComissoes.innerText = fmt.format(totalComissoes);
}

function renderFinance(properties) {
    const tableBody = document.getElementById('finance-table-body');
    const cardsContainer = document.getElementById('view-cards-container');
    if (!tableBody || !cardsContainer) return;

    if (properties.length === 0) {
        const emptyState = `
            <div class="p-20 text-center text-slate-400">
                Nenhuma venda registrada ainda.
            </div>
        `;
        tableBody.innerHTML = `<tr><td colspan="5">${emptyState}</td></tr>`;
        cardsContainer.innerHTML = emptyState;
        return;
    }

    const fmt = new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' });

    // Render Tabela
    tableBody.innerHTML = properties.map(p => {
        const valor = p.valor_venda || 0;
        const comissaoPercent = p.comissao || 0;
        const valorComissao = (valor * comissaoPercent) / 100;
        const refText = p.referencia || `#${p.id.toString().slice(-4)}`;

        return `
            <tr class="border-b border-slate-50 hover:bg-slate-50/50 transition-colors">
                <td class="p-5 text-sm font-mono text-slate-400">${refText}</td>
                <td class="p-5">
                    <p class="font-bold text-slate-900">${p.titulo}</p>
                </td>
                <td class="p-5 text-sm font-semibold text-slate-700">${fmt.format(valor)}</td>
                <td class="p-5 text-sm text-slate-500 text-center">${comissaoPercent}%</td>
                <td class="p-5 text-right font-bold text-blue-600">${fmt.format(valorComissao)}</td>
            </tr>
        `;
    }).join('');

    // Render Cards (Mobile)
    cardsContainer.innerHTML = properties.map(p => {
        const valor = p.valor_venda || 0;
        const comissaoPercent = p.comissao || 0;
        const valorComissao = (valor * comissaoPercent) / 100;
        const refText = p.referencia || `#${p.id.toString().slice(-4)}`;

        return `
            <div class="bg-white p-5 rounded-2xl shadow-sm border border-slate-100 space-y-4">
                <div class="flex justify-between items-start">
                    <span class="text-xs font-mono text-slate-400 bg-slate-50 px-2 py-1 rounded">${refText}</span>
                    <span class="text-xs font-bold text-blue-600 bg-blue-50 px-2 py-1 rounded">Comissão: ${comissaoPercent}%</span>
                </div>
                <h3 class="font-bold text-slate-900 leading-tight">${p.titulo}</h3>
                <div class="grid grid-cols-2 gap-4 pt-2 border-t border-slate-50">
                    <div>
                        <p class="text-[10px] font-bold text-slate-400 uppercase tracking-widest">Valor Venda</p>
                        <p class="font-bold text-slate-700">${fmt.format(valor)}</p>
                    </div>
                    <div class="text-right">
                        <p class="text-[10px] font-bold text-blue-400 uppercase tracking-widest">Valor Comissão</p>
                        <p class="font-black text-blue-600">${fmt.format(valorComissao)}</p>
                    </div>
                </div>
            </div>
        `;
    }).join('');
}

document.addEventListener('DOMContentLoaded', () => {
    loadFinanceData();

    // Toggle View
    const btnViewCards = document.getElementById('btn-view-cards');
    const btnViewTable = document.getElementById('btn-view-table');
    const tableContainer = document.getElementById('view-table-container');
    const cardsContainer = document.getElementById('view-cards-container');

    if (btnViewCards && btnViewTable && tableContainer && cardsContainer) {
        btnViewCards.addEventListener('click', () => {
            btnViewCards.classList.replace('text-slate-400', 'text-blue-600');
            btnViewCards.classList.replace('hover:text-slate-600', 'bg-white');
            btnViewCards.classList.add('shadow-sm');

            btnViewTable.classList.replace('text-blue-600', 'text-slate-400');
            btnViewTable.classList.replace('bg-white', 'hover:text-slate-600');
            btnViewTable.classList.remove('shadow-sm');

            tableContainer.classList.add('hidden');
            cardsContainer.classList.replace('hidden', 'grid');
        });

        btnViewTable.addEventListener('click', () => {
            btnViewTable.classList.replace('text-slate-400', 'text-blue-600');
            btnViewTable.classList.replace('hover:text-slate-600', 'bg-white');
            btnViewTable.classList.add('shadow-sm');

            btnViewCards.classList.replace('text-blue-600', 'text-slate-400');
            btnViewCards.classList.replace('bg-white', 'hover:text-slate-600');
            btnViewCards.classList.remove('shadow-sm');

            tableContainer.classList.remove('hidden');
            cardsContainer.classList.add('hidden');
        });
    }

    // Filtros de Data
    const inputStart = document.getElementById('filter-start-date');
    const inputEnd = document.getElementById('filter-end-date');
    const btnClear = document.getElementById('btn-clear-filters');

    if (inputStart && inputEnd) {
        inputStart.addEventListener('input', filterProperties);
        inputEnd.addEventListener('input', filterProperties);
    }

    if (btnClear) {
        btnClear.addEventListener('click', () => {
            inputStart.value = '';
            inputEnd.value = '';
            renderFinance(allSoldProperties);
            updateTotals(allSoldProperties);
        });
    }
});
