<?php
    include_once 'conexao.php';

    session_start();

    $id_usuario = $_SESSION['id_usuario'];
    // Recupera os dados da solicitação POST em JSON.
    $data = json_decode(file_get_contents("php://input"));

    if ($data) {
        $id_produto = $data->id_produto;
        // Conexão já está estabelecida no arquivo de conexão.

        // Executa a inserção na tabela carrinho.
        $sql = "INSERT INTO carrinho (id_produto, id_usuario) VALUES ($id_produto, $id_usuario)";

        if ($conn->query($sql) === TRUE) {
            // Inserção bem-sucedida.
            http_response_code(200);
            echo json_encode(array("message" => "Card adicionado ao carrinho com sucesso!"));
        } else {
            // Falha na inserção.
            http_response_code(500);
            echo json_encode(array("message" => "Falha ao adicionar o card ao carrinho: " . $conn->error));
        }

        $conn->close();
    } else {
        // Dados inválidos na solicitação.
        http_response_code(400);
        echo json_encode(array("message" => "Dados de solicitação inválidos."));
    }
?>

