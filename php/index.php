<?php
$nome_usuario = isset($_GET['nome_usuario']) ? htmlspecialchars($_GET['nome_usuario']) : 'Fazer login';
header("Location: /ReUse/index.html?nome_usuario=" . urlencode($nome_usuario));
?>