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

        if (val.length <= 11) {
            val = val.replace(/(\d{3})(\d{3})(\d{3})(\d{2})/g, '$1.$2.$3-$4');
        } else {
            val = val.replace(/(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})/g, '$1.$2.$3/$4-$5');
        }
        e.target.value = val;

        const cleanVal = val.replace(/\D/g, '');

        if (cleanVal.length === 11 || cleanVal.length === 14) {
            liberarCampos(cleanVal.length === 11 ? 'PF' : 'PJ');
        } else {
            detalhados.classList.add('hidden');
        }
    });

    // Delegar mudança de Estado Civil para mostrar Cônjuge
    document.addEventListener('change', (e) => {
        if (e.target.name === 'estado_civil') {
            const val = e.target.value;
            const sessaoConjuge = document.getElementById('sessao-conjuge');
            if (val === 'Casado' || val === 'União Estável') {
                sessaoConjuge.classList.remove('hidden');
            } else {
                sessaoConjuge.classList.add('hidden');
            }
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
    const sessaoProf = document.getElementById('sessao-profissional');

    detalhados.classList.remove('hidden');

    if (tipo === 'PF') {
        sessaoPF.classList.remove('hidden');
        sessaoProf.classList.remove('hidden');
        sessaoPJ.classList.add('hidden');
    } else {
        sessaoPF.classList.add('hidden');
        sessaoProf.classList.add('hidden');
        sessaoPJ.classList.remove('hidden');
        document.getElementById('sessao-conjuge').classList.add('hidden');
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
    document.getElementById('sessao-conjuge').classList.add('hidden');
    document.getElementById('modal-title').innerText = "Novo Cadastro";
    document.getElementById('modal-cliente').classList.remove('hidden');
};

document.getElementById('btn-close-modal').onclick = () => {
    document.getElementById('modal-cliente').classList.add('hidden');
};

function getRadioValue(name) {
    const el = document.querySelector(`input[name="${name}"]:checked`);
    return el ? el.value : null;
}

function setRadioValue(name, value) {
    if (!value) return;
    const el = document.querySelector(`input[name="${name}"][value="${value}"]`);
    if (el) el.checked = true;
}

// Salvamento
document.getElementById('form-cliente').onsubmit = async (e) => {
    e.preventDefault();
    const docValue = document.getElementById('f-documento').value;
    const cleanDoc = docValue.replace(/\D/g, '');
    const tipo = cleanDoc.length === 11 ? 'PF' : 'PJ';

    const payload = {
        tipo_pessoa: tipo,
        documento: docValue,
        email: document.getElementById('f-email').value,
        telefone_celular: document.getElementById('f-celular').value,
        updated_at: new Date().toISOString()
    };

    if (tipo === 'PF') {
        payload.nome_razao_social = document.getElementById('f-nome').value;
        payload.data_nascimento = document.getElementById('f-nascimento').value || null;
        payload.sexo = getRadioValue('sexo');
        payload.rg = document.getElementById('f-rg').value;
        payload.orgao_expedidor = document.getElementById('f-orgao').value;
        payload.filiacao = document.getElementById('f-filiacao').value;
        payload.naturalidade_uf = document.getElementById('f-naturalidade').value;
        payload.nacionalidade = document.getElementById('f-nacionalidade').value;
        payload.estado_civil = getRadioValue('estado_civil');
        payload.grau_instrucao = getRadioValue('instrucao');
        payload.telefone_fixo = document.getElementById('f-fixo').value;
        payload.logradouro = document.getElementById('f-logradouro').value;
        payload.bairro = document.getElementById('f-bairro').value;
        payload.cidade = document.getElementById('f-cidade').value;
        payload.uf = document.getElementById('f-uf').value;
        payload.cep = document.getElementById('f-cep').value;
        payload.residenca_tipo = getRadioValue('residencia');
        payload.residenca_valor_aluguel = document.getElementById('f-res-aluguel').value || 0;
        payload.tempo_reside = document.getElementById('f-tempo-reside').value;
        payload.num_dependentes = document.getElementById('f-dependentes').value || 0;

        // Cônjuge
        const ec = payload.estado_civil;
        if (ec === 'Casado' || ec === 'União Estável') {
            payload.conjuge_nome = document.getElementById('f-c-nome').value;
            payload.conjuge_data_nascimento = document.getElementById('f-c-nascimento').value || null;
            payload.conjuge_identidade = document.getElementById('f-c-rg').value;
            payload.conjuge_orgao_expedidor = document.getElementById('f-c-orgao').value;
            payload.conjuge_cpf = document.getElementById('f-c-cpf').value;
            payload.conjuge_nacionalidade = document.getElementById('f-c-nacionalidade').value;
            payload.conjuge_profissao = document.getElementById('f-c-profissao').value;
            payload.conjuge_empresa = document.getElementById('f-c-empresa').value;
            payload.conjuge_renda = document.getElementById('f-c-renda').value || 0;
        }

        // Profissional
        payload.prof_atividade = document.getElementById('f-p-profissao').value; // Usando campo prof_atividade da migration
        payload.prof_empresa = document.getElementById('f-p-empresa').value;
        payload.prof_cnpj = document.getElementById('f-p-cnpj').value;
        payload.prof_cargo = document.getElementById('f-p-cargo').value;
        payload.prof_data_admissao = document.getElementById('f-p-admissao').value || null;
        payload.prof_renda = document.getElementById('f-p-renda').value || 0;

    } else {
        payload.nome_razao_social = document.getElementById('f-nome-pj').value;
        payload.nome_fantasia = document.getElementById('f-fantasia').value;
        payload.inscricao_estadual = document.getElementById('f-ie').value;
        payload.data_fundacao = document.getElementById('f-fundacao').value || null;
        payload.faturamento_mensal = document.getElementById('f-faturamento').value || 0;
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
    document.getElementById('form-cliente').reset();
    document.getElementById('modal-title').innerText = "Editar Cliente";
    document.getElementById('f-documento').value = c.documento;

    liberarCampos(c.tipo_pessoa);

    document.getElementById('f-email').value = c.email || '';
    document.getElementById('f-celular').value = c.telefone_celular || '';

    if (c.tipo_pessoa === 'PF') {
        document.getElementById('f-nome').value = c.nome_razao_social;
        document.getElementById('f-nascimento').value = c.data_nascimento || '';
        setRadioValue('sexo', c.sexo);
        document.getElementById('f-rg').value = c.rg || '';
        document.getElementById('f-orgao').value = c.orgao_expedidor || '';
        document.getElementById('f-filiacao').value = c.filiacao || '';
        document.getElementById('f-naturalidade').value = c.naturalidade_uf || '';
        document.getElementById('f-nacionalidade').value = c.nacionalidade || 'Brasileira';
        setRadioValue('estado_civil', c.estado_civil);
        setRadioValue('instrucao', c.grau_instrucao);
        document.getElementById('f-fixo').value = c.telefone_fixo || '';
        document.getElementById('f-logradouro').value = c.logradouro || '';
        document.getElementById('f-bairro').value = c.bairro || '';
        document.getElementById('f-cidade').value = c.cidade || '';
        document.getElementById('f-uf').value = c.uf || '';
        document.getElementById('f-cep').value = c.cep || '';
        setRadioValue('residencia', c.residenca_tipo);
        document.getElementById('f-res-aluguel').value = c.residenca_valor_aluguel || '';
        document.getElementById('f-tempo-reside').value = c.tempo_reside || '';
        document.getElementById('f-dependentes').value = c.num_dependentes || 0;

        if (c.estado_civil === 'Casado' || c.estado_civil === 'União Estável') {
            document.getElementById('sessao-conjuge').classList.remove('hidden');
            document.getElementById('f-c-nome').value = c.conjuge_nome || '';
            document.getElementById('f-c-nascimento').value = c.conjuge_data_nascimento || '';
            document.getElementById('f-c-rg').value = c.conjuge_identidade || '';
            document.getElementById('f-c-orgao').value = c.conjuge_orgao_expedidor || '';
            document.getElementById('f-c-cpf').value = c.conjuge_cpf || '';
            document.getElementById('f-c-nacionalidade').value = c.conjuge_nacionalidade || '';
            document.getElementById('f-c-profissao').value = c.conjuge_profissao || '';
            document.getElementById('f-c-empresa').value = c.conjuge_empresa || '';
            document.getElementById('f-c-renda').value = c.conjuge_renda || '';
        }

        document.getElementById('f-p-profissao').value = c.prof_atividade || '';
        document.getElementById('f-p-empresa').value = c.prof_empresa || '';
        document.getElementById('f-p-cnpj').value = c.prof_cnpj || '';
        document.getElementById('f-p-cargo').value = c.prof_cargo || '';
        document.getElementById('f-p-admissao').value = c.prof_data_admissao || '';
        document.getElementById('f-p-renda').value = c.prof_renda || '';
    } else {
        document.getElementById('f-nome-pj').value = c.nome_razao_social;
        document.getElementById('f-fantasia').value = c.nome_fantasia || '';
        document.getElementById('f-ie').value = c.inscricao_estadual || '';
        document.getElementById('f-fundacao').value = c.data_fundacao || '';
        document.getElementById('f-faturamento').value = c.faturamento_mensal || '';
    }

    document.getElementById('modal-cliente').classList.remove('hidden');
};
