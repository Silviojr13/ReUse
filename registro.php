<?php
// Incluir seu arquivo de conexão aqui (conexao.php)
include('conexao.php');

// Verificar se o formulário foi enviado
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nome = $_POST['nome_usuario'];
    $email = $_POST['email_usuario'];
    $senha = $_POST['senha_usuario']; // Não é mais necessário usar md5

    // Hash da senha usando password_hash
    $hash_senha = password_hash($senha, PASSWORD_DEFAULT);

    // Inserir os dados na tabela usando prepared statements
    $sql = "INSERT INTO usuario (id_perfil, nome_usuario, email_usuario, senha_usuario) VALUES (4, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    
    // Bind dos parâmetros
    $stmt->bind_param("sss", $nome, $email, $hash_senha);

    // Executar a query
    if ($stmt->execute()) {
        echo "<p style='color: white;'>Registro realizado com sucesso!</p>";
        header("Location: login.php");
    } else {
        echo "Erro ao registrar: " . $stmt->error;
    }

    // Fechar a instrução preparada
    $stmt->close();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ReUse - Registrar</title>
    <link rel="icon" type="image/svg+xml" href="svg/LogoReUse1.svg" sizes="16x16">
    <link rel="stylesheet" type="text/css" href="css/styleregistro.css">
    <style>
        body::before {
            content: "";
            background-image: url('svg/image 3.svg');
            background-size: cover;
            background-repeat: no-repeat;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
        }
        body {
            background-color: transparent; 
        }

    </style>
</head>
<body>
    <div class="container">
        <div class="box">
            <div class="box2">
                <div class="line1">
                    <a href="index.php"><img src="svg/ep_arrow-up.svg" alt=""></a>
                    <img src="svg/Logo1.svg" alt="">
                </div>

                <div class="line2">
                    <p class="text_line2">Registrar conta</p>
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
                    <form  method="post">
                        <div class="campo_email">
                            <p class="text_email">Primeiro nome</p>
                            <input type="text" name="nome_usuario" class="email">
                        </div>
                        <div class="campo_senha">
                            <p class="text_senha">Email</p>
                            <input type="text" name="email_usuario" class="senha">
                        </div>
                        <div class="campo_senha">
                            <p class="text_senha">Senha</p>
                            <input type="password" name="senha_usuario" class="senha">
                        </div>
                        <div class="line4">
                            <button type="submit" class="entrar">REGISTRAR</button>
                            <div class="ntc">
                                <p class="naotc">Já tem uma conta?</p>
                                <a href="login.php"><p class="rga">Realizar login</p></a>
                            </div>
                            <a href="index.php"><p class="voltar">Voltar para a página inicial</p></a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
