<?php
session_start();
include_once 'conexao.php';
include_once 'verifica.php';


// Verifica se o id_usuario está na sessão
if (isset($_SESSION['id_usuario'])) {
$id_usuario = $_SESSION['id_usuario'];
$nome_usuario = $_SESSION['nome_usuario'];
$id_perfil = $_SESSION['id_perfil'];
} 
?>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ReUse</title>
    <link rel="icon" type="image/svg+xml" href="svg/LogoReUse1.svg" sizes="16x16">
    <link rel="stylesheet" href="css/styleindex.css">
    <link rel="stylesheet" href="css/styleregprod.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <script defer src="js/script.js"></script>
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
</head>
<body>
    <header class="header">
        <nav class="hed">
            <a href="index.php" class="voltar"><i class="uil uil-angle-left voltar"></i></a>
            <img class="logo" src="svg/Group.svg" alt="">
            <h1 class="textum">Adicionar Produto</h1>
        </nav>
    </header>
    <br>
    <br>
    <h2 class="sell">Selecione um Produto para editar: </h2>
 



<!--========================================================================================================-->
<!-- QUERO que tenha a baixo desta linha os produtos/cards-->



<div id="cards"></div>



<!-- =======================================================================================================-->
    <footer class="footer">
        <img class="logo_footer" src="svg/Group.svg" alt="">
    </footer>

<!-- import script -->

    <script defer src="js/edit.js"></script>
</body>
</html> 