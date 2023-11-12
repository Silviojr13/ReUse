<?php
    // arquivo de conexão
    include 'conexao.php';

    // Recupera o ID do estudante desejado
    $id_cliente = 1; 

    // Execute a consulta para contar os itens no carrinho do estudante
    $sql = "SELECT COUNT(*) AS quantidade FROM carrinho WHERE id_cliente = $id_cliente";
    $result = $conexao->query($sql);

    if ($result && $result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $quantidade = $row['quantidade'];
    } else {
        $quantidade = 0;
    }
    $response = array('quantidade' => $quantidade);

    echo json_encode($response);

    $conexao->close();
?>
