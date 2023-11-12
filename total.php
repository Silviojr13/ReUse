<?php
    // arquivo de conexão
    include 'conexao.php';

    // Recupera o ID do estudante desejado
    $id_cliente = 1; 

    // Execute a consulta para contar os itens no carrinho do estudante
    $sql = 
    "SELECT SUM(valor) AS total 
    FROM cards C
    INNER JOIN carrinho K ON C.id_cards = K.id_cards
    WHERE K.id_cliente = 1;
    ";
    
    $result = $conexao->query($sql);

    if ($result && $result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $total = $row['total'];
    } else {
        $total = 0;
    }
    $response = array('total' => $total);

    echo json_encode($response);

    $conexao->close();
?>
