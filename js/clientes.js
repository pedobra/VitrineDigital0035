import { supabase } from './supabase.js';

let clientes = [];
let editingId = null;

document.addEventListener('DOMContentLoaded', () => {
    loadClientes();
    setupMasks();
    setupFilters();
    setupBulkActions();
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

    // Delegated Change Listeners
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

    // Delegated Input Masks (Generic for Dynamic Fields)
    document.addEventListener('input', (e) => {
        const target = e.target;

        // Celular / Telefone Mask
        if (target.id === 'f-celular' || target.classList.contains('rep-fone') || target.id === 'f-pj-telefone' || target.id === 'f-pj-telefone-for') {
            let v = target.value.replace(/\D/g, '');
            v = v.replace(/^(\d{2})(\d)/g, "($1) $2");
            v = v.replace(/(\d{5})(\d)/, "$1-$2");
            target.value = v.slice(0, 15);
        }

        // CPF Only Mask (for representatives and spouse)
        if (target.classList.contains('rep-cpf') || target.id === 'f-c-cpf') {
            let v = target.value.replace(/\D/g, '');
            v = v.replace(/(\d{3})(\d{3})(\d{3})(\d{2})/g, '$1.$2.$3-$4');
            target.value = v.slice(0, 14);
        }

        // CEP Mask
        if (target.id === 'f-cep' || target.id === 'f-pj-cep') {
            let v = target.value.replace(/\D/g, '');
            v = v.replace(/^(\d{5})(\d)/, "$1-$2");
            target.value = v.slice(0, 9);
        }
    });
}

// PJ Representantes Logic
function addRepresentanteField(data = {}) {
    const container = document.getElementById('container-representantes');
    const index = container.children.length + 1;
    const div = document.createElement('div');
    div.className = "bg-white p-8 rounded-3xl border border-slate-100 shadow-sm space-y-6 relative";
    div.innerHTML = `
        <button type="button" class="absolute top-6 right-6 text-red-400 hover:text-red-600 remove-rep">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path></svg>
        </button>
        <div class="grid grid-cols-1 md:grid-cols-4 gap-6">
            <div class="md:col-span-3">
                <label class="block text-xs font-black text-slate-400 uppercase tracking-widest mb-2">Representante ${index} - Nome Completo</label>
                <input type="text" class="rep-nome w-full p-4 bg-slate-50 border border-slate-100 rounded-xl outline-none font-bold" value="${data.nome || ''}">
            </div>
            <div>
                <label class="block text-xs font-black text-slate-400 uppercase tracking-widest mb-2">CPF</label>
                <input type="text" class="rep-cpf w-full p-4 bg-slate-50 border border-slate-100 rounded-xl outline-none" value="${data.cpf || ''}">
            </div>
            <div>
                <label class="block text-xs font-black text-slate-400 uppercase tracking-widest mb-2">Identidade (RG)</label>
                <input type="text" class="rep-rg w-full p-4 bg-slate-50 border border-slate-100 rounded-xl outline-none" value="${data.rg || ''}">
            </div>
            <div>
                <label class="block text-xs font-black text-slate-400 uppercase tracking-widest mb-2">Data Nasc.</label>
                <input type="date" class="rep-nasc w-full p-4 bg-slate-50 border border-slate-100 rounded-xl outline-none" value="${data.nascimento || ''}">
            </div>
            <div class="md:col-span-2">
                <label class="block text-xs font-black text-slate-400 uppercase tracking-widest mb-2">Ligação com Empresa</label>
                <div class="flex gap-4 mt-2">
                    <label class="flex items-center gap-2 text-sm font-bold"><input type="radio" name="rep_lig_${index}" value="Sócio" ${data.ligacao === 'Sócio' ? 'checked' : ''}> Sócio</label>
                    <label class="flex items-center gap-2 text-sm font-bold"><input type="radio" name="rep_lig_${index}" value="Procurador" ${data.ligacao === 'Procurador' ? 'checked' : ''}> Procurador</label>
                </div>
            </div>
        </div>
    `;

    div.querySelector('.remove-rep').onclick = () => div.remove();
    container.appendChild(div);
}

document.getElementById('btn-add-representante').onclick = () => addRepresentanteField();

function setupFilters() {
    const search = document.getElementById('search-input');
    const type = document.getElementById('filter-type');
    const date = document.getElementById('filter-date');

    const triggerFilter = () => renderClientes();

    search.addEventListener('input', triggerFilter);
    type.addEventListener('change', triggerFilter);
    date.addEventListener('change', triggerFilter);
}

function setupBulkActions() {
    const selectAll = document.getElementById('select-all');
    selectAll.addEventListener('change', (e) => {
        const checks = document.querySelectorAll('.client-check');
        checks.forEach(c => c.checked = e.target.checked);
        toggleBulkActions();
    });

    document.getElementById('btn-delete-multiple').onclick = async () => {
        const selected = Array.from(document.querySelectorAll('.client-check:checked')).map(c => c.value);
        if (selected.length === 0) return;

        if (confirm(`Excluir ${selected.length} clientes selecionados?`)) {
            try {
                const { error } = await supabase.from('clientes').delete().in('id', selected);
                if (error) throw error;
                loadClientes();
            } catch (e) {
                alert('Erro ao excluir: ' + e.message);
            }
        }
    };
}

function toggleBulkActions() {
    const selected = document.querySelectorAll('.client-check:checked').length;
    const bar = document.getElementById('bulk-actions');
    bar.classList.toggle('hidden', selected === 0);
}

function liberarCampos(tipo) {
    const detalhados = document.getElementById('campos-detalhados');
    const sessaoPF = document.getElementById('sessao-pf');
    const sessaoPJ = document.getElementById('sessao-pj');
    const sessaoProf = document.getElementById('sessao-profissional');
    const sessaoPJRep = document.getElementById('sessao-pj-representantes');
    const sessaoRef = document.getElementById('sessao-referencias');
    const sessaoBens = document.getElementById('sessao-bens');

    detalhados.classList.remove('hidden');

    if (tipo === 'PF') {
        sessaoPF.classList.remove('hidden');
        sessaoProf.classList.remove('hidden');
        sessaoPJ.classList.add('hidden');
        sessaoPJRep.classList.add('hidden');
        sessaoRef.classList.remove('hidden'); // PF também tem referências e bens na ficha completa
        sessaoBens.classList.remove('hidden');
    } else {
        sessaoPF.classList.add('hidden');
        sessaoProf.classList.add('hidden');
        sessaoPJ.classList.remove('hidden');
        sessaoPJRep.classList.remove('hidden');
        sessaoRef.classList.remove('hidden');
        sessaoBens.classList.remove('hidden');
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

    const searchTerm = document.getElementById('search-input').value.toLowerCase();
    const typeFilter = document.getElementById('filter-type').value;
    const dateFilter = document.getElementById('filter-date').value;

    const filtered = clientes.filter(c => {
        const matchesSearch = !searchTerm ||
            c.nome_razao_social?.toLowerCase().includes(searchTerm) ||
            c.documento?.includes(searchTerm) ||
            c.email?.toLowerCase().includes(searchTerm);

        const matchesType = !typeFilter || c.tipo_pessoa === typeFilter;

        const matchesDate = !dateFilter || (c.created_at && c.created_at.startsWith(dateFilter));

        return matchesSearch && matchesType && matchesDate;
    });

    body.innerHTML = filtered.map(c => `
        <tr class="group hover:bg-blue-50/30 transition-all cursor-pointer border-b border-slate-50">
            <td class="px-6 py-4" onclick="event.stopPropagation()">
                <input type="checkbox" value="${c.id}" class="client-check w-4 h-4 rounded border-slate-300 text-blue-600 focus:ring-blue-500" onchange="toggleBulkActions()">
            </td>
            <td class="px-6 py-4 font-mono text-xs text-blue-600 font-bold" onclick="editCliente('${c.id}')">${c.documento}</td>
            <td class="px-6 py-4" onclick="editCliente('${c.id}')">
                <div class="text-sm font-black text-slate-900 group-hover:text-blue-700 transition-colors uppercase">${c.nome_razao_social}</div>
                <div class="text-[10px] text-slate-400 font-bold uppercase tracking-wider mt-0.5">${c.email || ''}</div>
            </td>
            <td class="px-6 py-4" onclick="editCliente('${c.id}')">
                <span class="px-3 py-1.5 rounded-lg text-[9px] font-black uppercase tracking-widest ${c.tipo_pessoa === 'PF' ? 'bg-amber-50 text-amber-600 border border-amber-100' : 'bg-indigo-50 text-indigo-600 border border-indigo-100'}">
                    ${c.tipo_pessoa === 'PF' ? 'PF' : 'PJ'}
                </span>
            </td>
            <td class="px-6 py-4 text-xs text-slate-500 font-bold hidden md:table-cell" onclick="editCliente('${c.id}')">${c.telefone_celular || '--'}</td>
            <td class="px-6 py-4 text-right" onclick="event.stopPropagation()">
                <div class="flex items-center justify-end gap-2 opacity-0 group-hover:opacity-100 transition-opacity">
                    <button onclick="editCliente('${c.id}')" class="p-2.5 text-slate-400 hover:text-blue-600 hover:bg-blue-50 rounded-xl transition-all" title="Editar">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z"></path></svg>
                    </button>
                    <button onclick="deleteCliente('${c.id}')" class="p-2.5 text-slate-400 hover:text-red-600 hover:bg-red-50 rounded-xl transition-all" title="Excluir">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path></svg>
                    </button>
                </div>
            </td>
        </tr>
    `).join('');
}

window.deleteCliente = async (id) => {
    if (confirm('Deseja realmente excluir este cliente?')) {
        try {
            const { error } = await supabase.from('clientes').delete().eq('id', id);
            if (error) throw error;
            loadClientes();
        } catch (e) {
            alert('Erro ao excluir: ' + e.message);
        }
    }
};

window.toggleBulkActions = toggleBulkActions;

// Modal Toggle
document.getElementById('btn-novo-cliente').onclick = () => {
    editingId = null;
    document.getElementById('form-cliente').reset();
    document.getElementById('container-representantes').innerHTML = '';
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

    // Referências e Bens (Geral para ambos ou PJ conforme solicitado)
    payload.referencias = {
        pessoais: [
            { nome: document.getElementById('ref-p1-nome').value, relacao: document.getElementById('ref-p1-relacao').value, fone: document.getElementById('ref-p1-fone').value },
            { nome: document.getElementById('ref-p2-nome').value, relacao: document.getElementById('ref-p2-relacao').value, fone: document.getElementById('ref-p2-fone').value }
        ],
        bancarias: {
            tipo: getRadioValue('ref_banco_tipo'),
            banco: document.getElementById('ref-b-banco').value,
            agencia: document.getElementById('ref-b-agencia').value,
            conta: document.getElementById('ref-b-conta').value,
            gerente: document.getElementById('ref-b-gerente').value
        }
    };

    payload.bens = {
        imovel1: { endereco: document.getElementById('ben-i1-end').value, valor: document.getElementById('ben-i1-val').value, detalhes: document.getElementById('ben-i1-mat').value },
        veiculo1: { marca: document.getElementById('ben-v1-marca').value, ano: document.getElementById('ben-v1-ano').value, placa: document.getElementById('ben-v1-placa').value, financiado: getRadioValue('v1_fin') }
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
        payload.prof_atividade = document.getElementById('f-p-profissao').value;
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

        // Print 1 Extras
        payload.logradouro = document.getElementById('f-pj-logradouro').value;
        payload.bairro = document.getElementById('f-pj-bairro').value;
        payload.cidade = document.getElementById('f-pj-cidade-uf').value;
        payload.cep = document.getElementById('f-pj-cep').value;
        payload.pj_contato = document.getElementById('f-pj-contato').value;
        payload.pj_telefone = document.getElementById('f-pj-telefone').value;
        payload.pj_fax = document.getElementById('f-pj-fax').value;
        payload.pj_contato_fortaleza = document.getElementById('f-pj-contato-for').value;
        payload.pj_telefone_fortaleza = document.getElementById('f-pj-telefone-for').value;
        payload.pj_fax_fortaleza = document.getElementById('f-pj-fax-for').value;
        payload.email = document.getElementById('f-pj-email').value;
        payload.pj_outras_rendas = document.getElementById('f-pj-outras-rendas').value || 0;
        payload.pj_origem_rendas = document.getElementById('f-pj-origem').value;
        payload.pj_predio_tipo = getRadioValue('pj_predio');
        payload.pj_predio_valor = document.getElementById('f-pj-predio-valor').value || 0;

        // Representantes
        const reps = [];
        document.querySelectorAll('#container-representantes [class*="bg-white"]').forEach((div) => {
            const ligRadio = div.querySelector('input[type="radio"]:checked');
            reps.push({
                nome: div.querySelector('.rep-nome').value,
                cpf: div.querySelector('.rep-cpf').value,
                rg: div.querySelector('.rep-rg').value,
                nascimento: div.querySelector('.rep-nasc').value,
                ligacao: ligRadio ? ligRadio.value : null
            });
        });
        payload.pj_representantes = reps;
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
    document.getElementById('container-representantes').innerHTML = '';
    document.getElementById('modal-title').innerText = "Editar Cliente";
    document.getElementById('f-documento').value = c.documento;

    liberarCampos(c.tipo_pessoa);

    // Populate Refs/Bens
    if (c.referencias) {
        if (c.referencias.pessoais[0]) {
            document.getElementById('ref-p1-nome').value = c.referencias.pessoais[0].nome || '';
            document.getElementById('ref-p1-relacao').value = c.referencias.pessoais[0].relacao || '';
            document.getElementById('ref-p1-fone').value = c.referencias.pessoais[0].fone || '';
        }
        if (c.referencias.pessoais[1]) {
            document.getElementById('ref-p2-nome').value = c.referencias.pessoais[1].nome || '';
            document.getElementById('ref-p2-relacao').value = c.referencias.pessoais[1].relacao || '';
            document.getElementById('ref-p2-fone').value = c.referencias.pessoais[1].fone || '';
        }
        if (c.referencias.bancarias) {
            setRadioValue('ref_banco_tipo', c.referencias.bancarias.tipo);
            document.getElementById('ref-b-banco').value = c.referencias.bancarias.banco || '';
            document.getElementById('ref-b-agencia').value = c.referencias.bancarias.agencia || '';
            document.getElementById('ref-b-conta').value = c.referencias.bancarias.conta || '';
            document.getElementById('ref-b-gerente').value = c.referencias.bancarias.gerente || '';
        }
    }

    if (c.bens) {
        if (c.bens.imovel1) {
            document.getElementById('ben-i1-end').value = c.bens.imovel1.endereco || '';
            document.getElementById('ben-i1-val').value = c.bens.imovel1.valor || '';
            document.getElementById('ben-i1-mat').value = c.bens.imovel1.detalhes || '';
        }
        if (c.bens.veiculo1) {
            document.getElementById('ben-v1-marca').value = c.bens.veiculo1.marca || '';
            document.getElementById('ben-v1-ano').value = c.bens.veiculo1.ano || '';
            document.getElementById('ben-v1-placa').value = c.bens.veiculo1.placa || '';
            setRadioValue('v1_fin', c.bens.veiculo1.financiado);
        }
    }

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

        document.getElementById('f-pj-logradouro').value = c.logradouro || '';
        document.getElementById('f-pj-bairro').value = c.bairro || '';
        document.getElementById('f-pj-cidade-uf').value = c.cidade || '';
        document.getElementById('f-pj-cep').value = c.cep || '';
        document.getElementById('f-pj-contato').value = c.pj_contato || '';
        document.getElementById('f-pj-telefone').value = c.pj_telefone || '';
        document.getElementById('f-pj-fax').value = c.pj_fax || '';
        document.getElementById('f-pj-contato-for').value = c.pj_contato_fortaleza || '';
        document.getElementById('f-pj-telefone-for').value = c.pj_telefone_fortaleza || '';
        document.getElementById('f-pj-fax-for').value = c.pj_fax_fortaleza || '';
        document.getElementById('f-pj-email').value = c.email || '';
        document.getElementById('f-pj-outras-rendas').value = c.pj_outras_rendas || '';
        document.getElementById('f-pj-origem').value = c.pj_origem_rendas || '';
        setRadioValue('pj_predio', c.pj_predio_tipo);
        document.getElementById('f-pj-predio-valor').value = c.pj_predio_valor || '';

        if (c.pj_representantes && Array.isArray(c.pj_representantes)) {
            c.pj_representantes.forEach(rep => addRepresentanteField(rep));
        }
    }

    document.getElementById('modal-cliente').classList.remove('hidden');
};
