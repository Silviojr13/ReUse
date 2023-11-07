

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ReUse - Login</title>
    <link rel="icon" type="image/svg+xml" href="svg/LogoReUse1.svg" sizes="16x16">
    <link rel="stylesheet" type="text/css" href="css/stylelogin.css">
    <style>
        body {
            background-image: url('svg/image 3.svg');
            background-size: cover;
            background-repeat: no-repeat;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="box">
             <div class="box2">

                <div class="line1">
                    <a href="index.html"><img src="svg/ep_arrow-up.svg" alt=""></a>
                    <img src="svg/Logo1.svg" alt="">
                </div>

                <div class="line2">
                    <p class="text_line2">Realizar Login</p>
                    <div class="box_buttons">
                        <a href="login.php" class="Login">
                            <p class="text_buttons">Login</p>
                        </a>

                        <a href="registro.php" class="Registro">
                            <p class="text_buttons">Registro</p>
                        </a>
                    </div>
                </div>

                <div class="line3">
                    <form id="login-form">
                        <div class="campo_email">
                            <p class="text_email">Email</p>
                            <input type="text" name="email" class="email">
                        </div>
                        
                        <div class="campo_senha">
                            <p class="text_senha">Senha</p>
                            <input type="password" name="senha" class="senha">
                        </div>
                        
                        <button class="entrar" type="submit">ENTRAR</button>
                    </form>
                </div>

                <div class="line4">
                    <div class="ntc">
                        <p class="naotc">Não tem conta?</p>
                        <a href="registro.php"><p class="rga">Registre agora</p></a>
                    </div>

                    <a href="index.html"><p class="voltar">Voltar para página inicial</p></a>
                </div>
             </div>
        </div>
    </div>

    <script>
        // JavaScript para lidar com o formulário de login
        document.addEventListener("DOMContentLoaded", function() {
            const loginForm = document.getElementById("login-form");
            
            loginForm.addEventListener("submit", function(event) {
                event.preventDefault(); // Impede o envio do formulário padrão
                
                const formData = new FormData(loginForm);
                fetch('processa_login.php', {
                    method: 'POST',
                    body: formData
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        // Redirecione o usuário para a página de login bem-sucedida
                        window.location.href = `php/index.php?nome_usuario=${data.nome_usuario}`;
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
    </script>
</body>
</html>
