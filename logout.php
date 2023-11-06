<?php
// Inicie a sessão
session_start();

// Destrua todas as variáveis de sessão
session_destroy();

// Redirecione o usuário para a página de login (ou outra página)
header("Location: login.php");
exit();
?>