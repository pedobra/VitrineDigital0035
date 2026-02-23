import { supabase } from './supabase.js';

let integracoes = [];

document.addEventListener('DOMContentLoaded', async () => {
    await loadIntegracoes();

    const form = document.getElementById('form-integracao');
    if (form) {
        form.addEventListener('submit', async (e) => {
            e.preventDefault();
            await saveIntegracao();
        });
    }
});

async function loadIntegracoes() {
    const list = document.getElementById('integracoes-list');
    const loading = document.getElementById('loading');
    const empty = document.getElementById('empty-state');

    if (!list || !loading || !empty) return;

    loading.classList.remove('hidden');
    list.classList.add('hidden');
    empty.classList.add('hidden');

    try {
        const { data, error } = await supabase
            .from('integracoes_pixels')
            .select('*')
            .order('created_at', { ascending: false });

        if (error) throw error;

        integracoes = data || [];
        renderIntegracoes();

    } catch (error) {
        console.error('Erro ao carregar integrações:', error);
        alert('Erro ao carregar integrações.');
    } finally {
        loading.classList.add('hidden');
    }
}

function renderIntegracoes() {
    const list = document.getElementById('integracoes-list');
    const empty = document.getElementById('empty-state');

    if (integracoes.length === 0) {
        list.classList.add('hidden');
        empty.classList.remove('hidden');
        return;
    }

    list.classList.remove('hidden');
    empty.classList.add('hidden');

    list.innerHTML = integracoes.map(item => {
        const logo = getProviderLogo(item.tipo);
        return `
            <div class="bg-white p-8 rounded-3xl shadow-sm border border-slate-100 hover:shadow-md transition-all group relative overflow-hidden">
                <div class="absolute top-0 right-0 p-4">
                    <div class="w-2 h-2 rounded-full ${item.ativo ? 'bg-emerald-500 shadow-[0_0_8px_rgba(16,185,129,0.5)]' : 'bg-slate-300'}"></div>
                </div>
                
                <div class="flex items-start gap-4">
                    <div class="w-14 h-14 rounded-2xl bg-slate-50 flex items-center justify-center text-2xl">
                        ${logo}
                    </div>
                    <div class="flex-1">
                        <div class="flex items-center gap-2">
                             <h3 class="font-bold text-slate-900">${item.nome || getProviderName(item.tipo)}</h3>
                             <span class="text-[9px] font-black uppercase tracking-widest px-2 py-1 rounded bg-slate-100 text-slate-500">${item.tipo}</span>
                        </div>
                        <p class="text-xs text-slate-400 font-mono mt-1">ID: ${item.pixel_id}</p>
                    </div>
                </div>

                <div class="mt-6 flex items-center justify-between pt-6 border-t border-slate-50">
                    <div class="text-[10px] text-slate-400 font-bold uppercase tracking-widest">
                        Status: <span class="${item.ativo ? 'text-emerald-600' : 'text-slate-400'}">${item.ativo ? 'Ativo' : 'Pausado'}</span>
                    </div>
                    <div class="flex items-center gap-2">
                        <button onclick="editIntegracao('${item.id}')" class="p-2 text-slate-400 hover:text-blue-600 hover:bg-blue-50 rounded-lg transition">
                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z"></path></svg>
                        </button>
                        <button onclick="deleteIntegracao('${item.id}')" class="p-2 text-slate-400 hover:text-red-600 hover:bg-red-50 rounded-lg transition">
                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path></svg>
                        </button>
                    </div>
                </div>
            </div>
        `;
    }).join('');
}

function getProviderLogo(tipo) {
    switch (tipo) {
        case 'meta': return '🔵';
        case 'tiktok': return '🎵';
        case 'google_tag': return '📊';
        default: return '⚙️';
    }
}

function getProviderName(tipo) {
    switch (tipo) {
        case 'meta': return 'Meta Ads';
        case 'tiktok': return 'TikTok Ads';
        case 'google_tag': return 'Google Tag';
        default: return 'Outros';
    }
}

async function saveIntegracao() {
    const id = document.getElementById('pixel-id-internal').value;
    const payload = {
        tipo: document.getElementById('tipo').value,
        nome: document.getElementById('nome').value,
        pixel_id: document.getElementById('pixel_id').value,
        ativo: document.getElementById('ativo').checked,
        access_token: document.getElementById('access_token').value,
        updated_at: new Date().toISOString()
    };

    try {
        if (id) {
            const { error } = await supabase
                .from('integracoes_pixels')
                .update(payload)
                .eq('id', id);
            if (error) throw error;
        } else {
            const { error } = await supabase
                .from('integracoes_pixels')
                .insert([payload]);
            if (error) throw error;
        }

        document.getElementById('modal-integracao').classList.add('hidden');
        await loadIntegracoes();

    } catch (error) {
        console.error('Erro ao salvar:', error);
        alert('Erro ao salvar integração.');
    }
}

window.editIntegracao = (id) => {
    const item = integracoes.find(i => i.id === id);
    if (!item) return;

    document.getElementById('pixel-id-internal').value = item.id;
    document.getElementById('tipo').value = item.tipo;
    document.getElementById('nome').value = item.nome || '';
    document.getElementById('pixel_id').value = item.pixel_id;
    document.getElementById('ativo').checked = item.ativo;
    document.getElementById('access_token').value = item.access_token || '';

    document.getElementById('modal-title').innerText = 'Editar Integração';
    document.getElementById('modal-integracao').classList.remove('hidden');
};

window.deleteIntegracao = async (id) => {
    if (!confirm('Deseja realmente excluir esta integração?')) return;

    try {
        const { error } = await supabase
            .from('integracoes_pixels')
            .delete()
            .eq('id', id);

        if (error) throw error;
        await loadIntegracoes();

    } catch (error) {
        console.error('Erro ao excluir:', error);
        alert('Erro ao excluir integração.');
    }
};
