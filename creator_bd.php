<?php
$servername = "localhost"; // Endereço do servidor de banco de dados
$username = "root"; // Nome de usuário do banco de dados
$password = "PUC@1234"; // Senha do banco de dados

// Cria uma conexão com o MySQL (sem selecionar um banco de dados)
$conn = new mysqli($servername, $username, $password);

// Verifica a conexão
if ($conn->connect_error) {
    die("Erro na conexão com o servidor de banco de dados: " . $conn->connect_error);
}

// Nome do banco de dados a ser criado
$databaseName = "reuse";

// Cria o banco de dados se ele não existir
$createDbQuery = "CREATE DATABASE IF NOT EXISTS $databaseName";
if ($conn->query($createDbQuery) === TRUE) {
    echo "Banco de dados criado com sucesso!";
} else {
    echo "Erro ao criar o banco de dados: " . $conn->error;
}

// Fecha a conexão com o servidor de banco de dados
$conn->close();
?>