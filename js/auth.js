import { supabase } from "./supabase.js";

const loading = document.getElementById("loading");
const app = document.getElementById("app");
const isLoginPage = window.location.pathname.includes("login");

/**
 * Inicializa Autenticação na página de Login
 */
async function initAuth() {
    try {
        const { data } = await supabase.auth.getSession();

        if (data.session) {
            // Se estiver na tela de login e já logado, redireciona
            if (isLoginPage) {
                window.location.href = "dashboard.html";
                return;
            }

            // Auto-preenchimento universal do cabeçalho admin (em qualquer página que tenha os IDs)
            const user = data.session.user;
            const userNameEl = document.getElementById('user-name');
            const userEmailEl = document.getElementById('user-email');

            if (userNameEl) userNameEl.innerText = user.user_metadata?.full_name || 'Usuário';
            if (userEmailEl) userEmailEl.innerText = user.email;
        } else {
            // Se não houver sessão e estiver no login, apenas garante que os componentes de tela apareçam
            // (O auth-guard.js já se encarrega de expulsar o usuário de páginas privadas)
        }
    } catch (e) {
        console.warn("Erro na verificação de sessão.");
    }

    // Lógica específica para exibir o formulário de login (apenas na página de login)
    if (isLoginPage) {
        if (loading) loading.style.display = "none";
        if (app) app.style.display = "block";
    }
}

// Executa a verificação inicial
initAuth();

/**
 * Lógica do Formulário de Login
 */
const loginForm = document.getElementById('login-form');
if (loginForm) {
    loginForm.addEventListener('submit', async (e) => {
        e.preventDefault();

        const email = document.getElementById('email').value;
        const password = document.getElementById('password').value;
        const errorDiv = document.getElementById('error-message');
        const btnLogin = document.getElementById('btn-login');

        if (errorDiv) errorDiv.classList.add('hidden');
        if (btnLogin) {
            btnLogin.innerText = 'Entrando...';
            btnLogin.disabled = true;
        }

        try {
            const { error } = await supabase.auth.signInWithPassword({ email, password });
            if (error) throw error;
            window.location.href = 'dashboard.html';
        } catch (error) {
            if (errorDiv) {
                errorDiv.innerText = error.message === 'Invalid login credentials'
                    ? 'E-mail ou senha inválidos.'
                    : error.message;
                errorDiv.classList.remove('hidden');
            }
            if (btnLogin) {
                btnLogin.innerText = 'Entrar';
                btnLogin.disabled = false;
            }
        }
    });
}

/**
 * Lógica de Logout (Global para o painel)
 */
document.addEventListener('click', async (e) => {
    if (e.target && e.target.id === 'btn-logout') {
        e.preventDefault();
        if (confirm('Deseja sair do painel?')) {
            await supabase.auth.signOut();
            window.location.href = 'login.html';
        }
    }
});