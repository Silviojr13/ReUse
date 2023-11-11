<?php
// Obtém o nome do usuário da URL
$nomeUsuario = isset($_GET['nome_usuario']) ? $_GET['nome_usuario'] : null;


?>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ReUse</title>
    <link rel="icon" type="image/svg+xml" href="svg/LogoReUse1.svg" sizes="16x16">
    <link rel="stylesheet" href="css/styleindex.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
</head>
<body>
    <header class="header1">
        
        <div class="leftheader1">
            <img class="logo" src="svg/LogoReUse1.svg" alt="">
            <p class="option">Início</p>            
            <p class="option">inicio</p>            
            <p class="option">inicio</p>            
            <a href="registrar_prod.php?id_estoque=1" class="a opition"><p>registrar produto</p></a>            
        </div>
        <div class="rightheader1">
            <div class="search">
                <img class="lupa" src="svg/material-symbols_search.svg" alt="">
                <p class="pesquisar_text">Pesquisar</p>
            </div>
            <a id="carrinho"><img class="carrinho" src="svg/mdi_cart-outline.svg" alt=""></a>





            <!--icone de usuario-->
            <div class="log_user">
                    <?php
                        if ($nomeUsuario) {

                            echo '  <a href="javascript:void(0);" id="dropdownButton" class="log_text">
                                        <img src="svg/mdi_user.svg" alt="" class="user">' . htmlspecialchars($nomeUsuario) . '
                                    </a>';

                        } else {
                            // Caso não haja nome de usuário na URL, exibe "Fazer login"
                            echo '<a href="login.php" class="log_text">
                                      <img src="svg/mdi_user.svg" alt="" class="user">Fazer Login
                                  </a>';
                        }
                    ?>
                </a>
            </div>

            <!-- Adicione a estrutura do dropdown (inicialmente oculta) -->
            <div class="dropdown" id="myDropdown">
                <a href="logout.php">
                    <img src="svg/Vector.svg" alt="Icone de logout">
                    Fazer Logout
                </a>
            </div>

            
        </div>
    </header>

    <header class="header2">
        <div class="menu">
            <p class="opmenu">DECORAÇÃO</p>
            <p class="opmenu">MÓVEIS</p>
            <p class="opmenu">MODA</p>
            <p class="opmenu">COSMÉTICO</p>
            <p class="opmenu">UTILIZÁVEIS</p>
        </div>
    </header>

    <div class="slider">
        <div class="slides">
            <!-- Radio Buttons -->
            <input type="radio" name="radio-btn" id="radio1">
            <input type="radio" name="radio-btn" id="radio2">
            <input type="radio" name="radio-btn" id="radio3">
            <input type="radio" name="radio-btn" id="radio4">
            <!-- FIM Radio Buttons -->

            <!-- Imagens Carrossel -->
            
                <div class="slide first">
                    <img src="img/slider1.png" alt="">
                </div>
                <div class="slide">
                    <img src="img/slider2.png" alt="">
                </div>
                <div class="slide">
                    <img src="img/slider3.png" alt="">
                </div>
                <div class="slide">
                    <img src="img/slider4.png" alt="">
                </div>
            

            <!-- FIM Imagens Carrossel -->

            <!-- Navigation auto -->
            <div class="navigation-auto manual-navigation">
                <label for="radio1" class="autobtn autobtn1 manual-btn"></label>
                <label for="radio2" class="autobtn autobtn2 manual-btn"></label>
                <label for="radio3" class="autobtn autobtn3 manual-btn"></label>
                <label for="radio4" class="autobtn autobtn4 manual-btn"></label>
            </div>
        </div>


    </div>
<!--========================================================================================================-->
<!-- QUERO que tenha a baixo desta linha os produtos/cards-->







<!-- =======================================================================================================-->
    <footer class="footer">
        <img class="logo_footer" src="svg/Group.svg" alt="">
    </footer>

<!-- import script -->

    <script src="js/script.js"></script>
</body>
</html> 