<?php
// Inclua o arquivo de conexão com o banco de dados
include_once 'conexao.php';

// Verifique se a conexão com o banco de dados foi estabelecida no arquivo 'conexao.php'
if (!$conn) {
    die("Conexão falhou: " . mysqli_connect_error());
}

// Consulta SQL para obter os dados da tabela "produto"
$sql = "SELECT id_produto, caminhoimagem, descricao, preco, datafabricacao FROM produto";
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
