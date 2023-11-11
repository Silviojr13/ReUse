<?php
    // arquivo de conexão.
    include 'conexao.php';

    // Recupera os dados da solicitação POST em JSON.
    $data = json_decode(file_get_contents("php://input"));

    if ($data) {
        $id_carrinho = $data->id_carrinho;
        $id_cliente = $data->id_cliente;

        // Executa a remoção do card da tabela 'carrinho'.
        $sql = "DELETE FROM carrinho WHERE id_carrinho = $id_carrinho AND id_cliente = 1";

        if ($conexao->query($sql) === TRUE) {
            // Remoção bem-sucedida.
            http_response_code(200);
            echo json_encode(array("message" => "Card removido do carrinho com sucesso!"));
        } else {
            // Falha na remoção.
            http_response_code(500);
            echo json_encode(array("message" => "Falha ao remover o card do carrinho: " . $conexao->error));
        }

        $conexao->close();
    } else {
        // Dados inválidos na solicitação.
        http_response_code(400);
        echo json_encode(array("message" => "Dados de solicitação inválidos."));
    }
?>
