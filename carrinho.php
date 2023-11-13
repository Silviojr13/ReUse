<?php
session_start();
include_once 'verifica.php';




// Verifica se o id_usuario está na sessão
if (isset($_SESSION['id_usuario'])) {
$id_usuario = $_SESSION['id_usuario'];
$nome_usuario = $_SESSION['nome_usuario'];
}else {
    
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Título da Página</title>
    <!-- Adicione aqui seus links para folhas de estilo (CSS) ou scripts (JavaScript) -->
    <link rel="stylesheet" href="css/stylecarrinho.css">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
</head>
<body>

    <header class="header">
        <nav class="hed">
            <a href="index.php" class="voltar"><i class="uil uil-angle-left voltar"></i></a>
            <img class="logo" src="svg/Group.svg" alt="">
            <h1 class="textum">Seu carrinho</h1>
        </nav>
    </header>

    <div id="cards"></div>

    <!-- scripts -->

    <script src="js/carrinho.js"></script>
</body>
</html>
