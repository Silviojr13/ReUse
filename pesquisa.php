<?php
// Inclua o arquivo de conexão com o banco de dados
include_once 'conexao.php';

// Verifique se a conexão com o banco de dados foi estabelecida no arquivo 'conexao.php'
if (!$conn) {
    die("Conexão falhou: " . mysqli_connect_error());
}

// Obtenha o nome do produto da query string
$nomeProduto = isset($_GET['nome']) ? $_GET['nome'] : '';

// Consulta SQL para obter os dados filtrados pelo nome do produto
$sql = "SELECT id_produto, nome, caminhoimagem, preco, datafabricacao FROM produto WHERE nome LIKE '%$nomeProduto%'";
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
