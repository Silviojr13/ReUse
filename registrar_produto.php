<?php
// Inclua o arquivo de conexão com o banco de dados
include_once 'conexao.php';

// Verifique se a conexão com o banco de dados foi estabelecida no arquivo 'conexao.php'
if (!$conn) {
    die("Conexão falhou: " . mysqli_connect_error());
}

// Resto do código para processar o formulário e inserir os dados na tabela "produto"
$nome_produto = $_POST['nome_produto'];
$descricao = $_POST['descricao'];
$preco = $_POST['preco'];

$sql = "INSERT INTO produto (nome_produto, descricao, preco) VALUES ('$nome_produto', '$descricao', '$preco')";

if (mysqli_query($conn, $sql)) {
    echo "Produto registrado com sucesso!";
} else {
    echo "Erro ao registrar o produto: " . mysqli_error($conn);
}

// Feche a conexão com o banco de dados
mysqli_close($conn);
?>