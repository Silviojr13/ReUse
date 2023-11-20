<?php


// Verifica se o id_usuario está na sessão
if (isset($_SESSION['id_usuario'])) {
    $id_usuario = $_SESSION['id_usuario'];
    $nome_usuario = $_SESSION['nome_usuario'];
} else {
    // Usuário não está logado, emite o alerta
    echo '<script>
            var resposta = confirm("Você precisa estar logado para acessar esta página.");
            if (resposta) {
                // Redireciona para a página de login
                window.location.href = "login.php";
            }
          </script>';
    exit(); // Termina a execução do script após o alerta
}


?>
