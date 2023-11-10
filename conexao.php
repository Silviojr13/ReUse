<?php
$servername = "localhost"; // Endereço do servidor de banco de dados
$username = "root"; // Nome de usuário do banco de dados
$password = "Brother25525&"; // Senha do banco de dados
$database = "reuse"; // Nome do banco de dados

// Cria uma conexão com o banco de dados
$conn = new mysqli($servername, $username, $password, $database);

// Verifica a conexão
if ($conn->connect_error) {
    die("Erro na conexão com o banco de dados: " . $conn->connect_error);
}/*else {
    echo "+";
}*/

?>
