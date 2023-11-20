<?php
    session_start();
    // arquivo de conexão
    include 'conexao.php';

    // Recupera o ID do usuario desejado
    $id_usuario = $_SESSION['id_usuario'];

    // Execute a consulta para contar os itens no carrinho do usuario
    $sql = "SELECT COUNT(*) AS quantidade FROM carrinho WHERE id_usuario = $id_usuario";
    $result = $conn->query($sql);

    if ($result && $result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $quantidade = $row['quantidade'];
    } else {
        $quantidade = 0;
    }
    $response = array('quantidade' => $quantidade);

    echo json_encode($response);

    $conn->close();
?>
