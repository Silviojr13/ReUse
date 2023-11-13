<?php
session_start();

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
    <title>Produo</title>
    <link rel="icon" type="image/svg+xml" href="svg/LogoReUse1.svg" sizes="16x16">
    <!-- Adicione aqui seus links para folhas de estilo (CSS) ou scripts (JavaScript) -->
    <link rel="stylesheet" href="css/styleproduto.css">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
</head>
<body>

    <header class="header">
        <nav class="hed">
            <a href="index.php" class="voltar"><i class="uil uil-angle-left voltar"></i></a>
            <img class="logo" src="svg/Group.svg" alt="">
            <h1 class="textum">Produto</h1>
        </nav>
    </header>

    <section class="container-cards">
                <div class="card-produto">
                    <div class="card-prod-imagem">
                        <img src="${dado.caminhoimagem}">
                    </div>
                    
                    <div class="card-prod-titulo"></div><br>
                    <div class="card-prod-valor"><p>R$</p></div>
                    <div class="card-prod-add">
                        <button onclick="adicionarProduto(${dado.id_produto})" data-id-cards="${dado.id_produto}">
                            Adicionar <img class="car" src="svg/mdi_cart-outline.svg" alt="">
                        </button>
                    </div>
                </div>
            </section>

    <!-- scripts -->
</body>
</html>
