<?php
// Inclua o arquivo de conexão
include("conexao.php");

// Inicializa a variável de erro
$erro = '';

// Verificar se o formulário foi enviado
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obter dados do formulário
    $email = $_POST["email"];
    $senha = $_POST["senha"];

    // Consultar o banco de dados para verificar o login usando prepared statements
    $sql = "SELECT * FROM usuario WHERE email_usuario = ? LIMIT 1";
    $stmt = $conn->prepare($sql);

    // Verificar se a preparação da consulta falhou
    if (!$stmt) {
        die("Erro na preparação da consulta: " . $conn->error);
    }

    $stmt->bind_param("s", $email);

    // Verificar se a vinculação dos parâmetros falhou
    if (!$stmt) {
        die("Erro na vinculação de parâmetros: " . $stmt->error);
    }

    $stmt->execute();

    // Verificar se a execução da consulta falhou
    if (!$stmt) {
        die("Erro na execução da consulta: " . $stmt->error);
    }

    $result = $stmt->get_result();

    // Verificar se encontrou um usuário correspondente
    if ($result->num_rows > 0) {
        $usuario = $result->fetch_assoc();

        // Verificar a senha usando password_verify
        if (password_verify($senha, $usuario['senha_usuario'])) {
            // Login bem-sucedido
            echo "Login bem-sucedido!";
            // Você pode redirecionar para outra página se desejar
            header("Location: index.php?nome_usuario=" . urlencode($usuario['nome_usuario']));
        } else {
            // Senha incorreta
            $erro = "Login falhou. Verifique suas credenciais.";
        }
    } else {
        // Usuário não encontrado
        $erro = "Login falhou. Verifique suas credenciais.";
    }

    // Fechar a instrução preparada
    $stmt->close();
}

// Fechar a conexão com o banco de dados
$conn->close();
?>

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
            position: relative;
            height:100vh;
            width:100%;
            background-image: url('img/selva.jpg');
            background-size: cover;
            background-position: center;
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
                    <form method="POST">
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

                    <?php
                        // Exibir mensagem de erro (se houver)
                        if (!empty($erro)) {
                            echo "<p style='color: red;'>$erro</p>";
                        }
                    ?>
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
</body>
</html>
