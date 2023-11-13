<?php
// Inclua o arquivo de conexão com o banco de dados
include_once 'conexao.php';
session_start();

$id_usuario = $_SESSION['id_usuario'];

// Verifique se a conexão com o banco de dados foi estabelecida no arquivo 'conexao.php'
if (!$conn) {
    die("Conexão falhou: " . mysqli_connect_error());
}

// Consulta SQL para obter os dados da tabela "produto"
$sql = "SELECT P.*, C.*
        FROM produto P
        INNER JOIN carrinho C ON C.id_produto = P.id_produto
        WHERE id_usuario = $id_usuario";

$result = mysqli_query($conn, $sql);

if (!$result) {
    die("Erro na consulta: " . mysqli_error($conn));
}

// Crie um array para armazenar os dados
$dados = array();

// Percorra os resultados e adicione os dados ao array
while ($row = mysqli_fetch_assoc($result)) {
    $dados[] = $row;
}

// Feche a conexão com o banco de dados
mysqli_close($conn);

// Converta os dados para o formato JSON
echo json_encode($dados);
?>
