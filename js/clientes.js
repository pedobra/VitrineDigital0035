let clientes = [];
let editingId = null;

document.addEventListener('DOMContentLoaded', () => {
    loadClientes();
    setupMasks();
});

// Mascaramento Automático CPF/CNPJ
function setupMasks() {
    const docInput = document.getElementById('f-documento');
    const detalhados = document.getElementById('campos-detalhados');

    docInput.addEventListener('input', (e) => {
        let val = e.target.value.replace(/\D/g, '');

        // Aplica Máscara Dinâmica
        if (val.length <= 11) {
            val = val.replace(/(\d{3})(\d{3})(\d{3})(\d{2})/g, '$1.$2.$3-$4');
        } else {
            val = val.replace(/(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})/g, '$1.$2.$3/$4-$5');
        }
        e.target.value = val;

        // Limpa formatação para validar comprimento
        const cleanVal = val.replace(/\D/g, '');

        if (cleanVal.length === 11 || cleanVal.length === 14) {
            liberarCampos(cleanVal.length === 11 ? 'PF' : 'PJ');
        } else {
            detalhados.classList.add('hidden');
        }
    });

    // Mascara simples para celular
    document.getElementById('f-celular').addEventListener('input', (e) => {
        let v = e.target.value.replace(/\D/g, '');
        v = v.replace(/^(\d{2})(\d)/g, "($1) $2");
        v = v.replace(/(\d{5})(\d)/, "$1-$2");
        e.target.value = v.slice(0, 15);
    });
}

function liberarCampos(tipo) {
    const detalhados = document.getElementById('campos-detalhados');
    const sessaoPF = document.getElementById('sessao-pf');
    const sessaoPJ = document.getElementById('sessao-pj');
    const divFantasia = document.getElementById('div-fantasia');
    const labelNome = document.getElementById('label-nome');

    detalhados.classList.remove('hidden');

    if (tipo === 'PF') {
        sessaoPF.classList.remove('hidden');
        sessaoPJ.classList.add('hidden');
        divFantasia.classList.add('hidden');
        labelNome.innerText = "Nome Completo";
    } else {
        sessaoPF.classList.add('hidden');
        sessaoPJ.classList.remove('hidden');
        divFantasia.classList.remove('hidden');
        labelNome.innerText = "Razão Social";
    }
}

async function loadClientes() {
    try {
        const { data, error } = await supabase.from('clientes').select('*').order('created_at', { ascending: false });
        if (error) throw error;
        clientes = data;
        renderClientes();
    } catch (e) {
        console.error(e);
    }
}

function renderClientes() {
    const body = document.getElementById('lista-clientes-body');
    if (!body) return;

    body.innerHTML = clientes.map(c => `
        <tr class="border-b border-slate-50 hover:bg-slate-50/50 transition">
            <td class="px-6 py-4 font-mono text-xs text-blue-600 font-bold">${c.documento}</td>
            <td class="px-6 py-4">
                <div class="text-sm font-bold text-slate-900">${c.nome_razao_social}</div>
                <div class="text-xs text-slate-400 font-medium">${c.email || ''}</div>
            </td>
            <td class="px-6 py-4">
                <span class="px-3 py-1 rounded-full text-[9px] font-black uppercase tracking-widest ${c.tipo_pessoa === 'PF' ? 'bg-amber-100 text-amber-700' : 'bg-blue-100 text-blue-700'}">
                    ${c.tipo_pessoa === 'PF' ? 'Pessoa Física' : 'Pessoa Jurídica'}
                </span>
            </td>
            <td class="px-6 py-4 text-sm text-slate-600 font-medium">${c.telefone_celular || '--'}</td>
            <td class="px-6 py-4 text-right">
                <button onclick="editCliente('${c.id}')" class="text-blue-600 hover:text-blue-800 font-bold text-xs uppercase p-2">Editar</button>
            </td>
        </tr>
    `).join('');
}

// Modal Toggle
document.getElementById('btn-novo-cliente').onclick = () => {
    editingId = null;
    document.getElementById('form-cliente').reset();
    document.getElementById('campos-detalhados').classList.add('hidden');
    document.getElementById('modal-title').innerText = "Novo Cadastro";
    document.getElementById('modal-cliente').classList.remove('hidden');
};

document.getElementById('btn-close-modal').onclick = () => {
    document.getElementById('modal-cliente').classList.add('hidden');
};

// Salvamento
document.getElementById('form-cliente').onsubmit = async (e) => {
    e.preventDefault();
    const docInput = document.getElementById('f-documento');
    const docValue = docInput.value.replace(/\D/g, '');
    const tipo = docValue.length === 11 ? 'PF' : 'PJ';

    const payload = {
        tipo_pessoa: tipo,
        documento: docInput.value,
        nome_razao_social: document.getElementById('f-nome').value,
        email: document.getElementById('f-email').value,
        telefone_celular: document.getElementById('f-celular').value,
        updated_at: new Date().toISOString()
    };

    if (tipo === 'PF') {
        payload.rg = document.getElementById('f-rg').value;
        payload.data_nascimento = document.getElementById('f-nascimento').value || null;
        payload.estado_civil = document.getElementById('f-civil').value;
    } else {
        payload.nome_fantasia = document.getElementById('f-fantasia').value;
        payload.representante_1_nome = document.getElementById('f-rep1-nome').value;
        payload.representante_1_cpf = document.getElementById('f-rep1-cpf').value;
    }

    try {
        let error;
        if (editingId) {
            ({ error } = await supabase.from('clientes').update(payload).eq('id', editingId));
        } else {
            ({ error } = await supabase.from('clientes').insert([payload]));
        }

        if (error) throw error;

        document.getElementById('modal-cliente').classList.add('hidden');
        loadClientes();
        alert('Cliente salvo com sucesso!');
    } catch (err) {
        console.error(err);
        alert('Erro ao salvar cliente: ' + err.message);
    }
};

window.editCliente = (id) => {
    const c = clientes.find(item => item.id === id);
    if (!c) return;

    editingId = id;
    document.getElementById('modal-title').innerText = "Editar Cliente";
    document.getElementById('f-documento').value = c.documento;
    document.getElementById('f-nome').value = c.nome_razao_social;
    document.getElementById('f-email').value = c.email || '';
    document.getElementById('f-celular').value = c.telefone_celular || '';

    liberarCampos(c.tipo_pessoa);

    if (c.tipo_pessoa === 'PF') {
        document.getElementById('f-rg').value = c.rg || '';
        document.getElementById('f-nascimento').value = c.data_nascimento || '';
        document.getElementById('f-civil').value = c.estado_civil || 'solteiro';
    } else {
        document.getElementById('f-fantasia').value = c.nome_fantasia || '';
        document.getElementById('f-rep1-nome').value = c.representante_1_nome || '';
        document.getElementById('f-rep1-cpf').value = c.representante_1_cpf || '';
    }

    document.getElementById('modal-cliente').classList.remove('hidden');
};
