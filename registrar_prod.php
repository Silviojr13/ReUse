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


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar Produto</title>
</head>
<body>
    <h1>Registrar Produto</h1>
    <form action="registrar_produto.php" method="POST">
        <label for="nome_produto">Nome do Produto:</label>
        <input type="text" id="nome_produto" name="nome_produto" required><br><br>
        
        <label for="descricao">Descrição:</label>
        <textarea id="descricao" name="descricao" required></textarea><br><br>
        
        <label for="preco">Preço:</label>
        <input type="number" id="preco" name="preco" step="0.01" required><br><br>
        
        <input type="submit" value="Registrar Produto">
    </form>
</body>
</html>

