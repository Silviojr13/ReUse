<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    include_once 'php/conexao.php';

    $email = $_POST['email'];
    $senha = md5($_POST['senha']);

    $sql = "SELECT nome_usuario FROM tb_login WHERE email_usuario = '$email' AND senha_usuario = '$senha'";
    $result = mysqli_query($conn, $sql);

    if ($result && mysqli_num_rows($result) == 1) {
        $row = mysqli_fetch_assoc($result);
        $nome_usuario = $row['nome_usuario'];
        // Redirecione para index.php com o nome_usuario na URL
        header("Location: php/index.php?nome_usuario=" . urlencode($nome_usuario));
        exit();
    } else {
        echo "Credenciais inválidas";
    }
}
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
                    <a href="index.php"><img src="svg/ep_arrow-up.svg" alt=""></a>
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
                    <form method="post">
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

                    <a href="index.php"><p class="voltar">Voltar para página inicial</p></a>
                </div>
             </div>
        </div>
    </div>
</body>
</html>
