// JavaScript para lidar com o formulário de login
document.addEventListener("DOMContentLoaded", function() {
    const loginForm = document.getElementById("login-form");
    
    loginForm.addEventListener("submit", function(event) {
        event.preventDefault(); // Impede o envio do formulário padrão
        
        const formData = new FormData(loginForm);
        fetch('../php/login.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                // Redirecione o usuário para a página de login bem-sucedida
                window.location.href = `..php/index.php?nome_usuario=${data.nome_usuario}`;
            } else {
                // Exiba uma mensagem de erro ao usuário
                alert("Credenciais inválidas");
            }
        })
        .catch(error => {
            console.error('Erro na solicitação: ', error);
        });
    });
});