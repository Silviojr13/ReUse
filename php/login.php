<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    include_once '../php/conexao.php';

    $email = $_POST['email'];
    $senha = md5($_POST['senha']);

    $sql = "SELECT nome_usuario FROM tb_login WHERE email_usuario = '$email' AND senha_usuario = '$senha'";
    $result = mysqli_query($conn, $sql);

    if ($result && mysqli_num_rows($result) == 1) {
        $row = mysqli_fetch_assoc($result);
        $nome_usuario = $row['nome_usuario'];
        // Redirecione para index.php com o nome_usuario na URL
        header("Location: ../php/index.php?nome_usuario=" . urlencode($nome_usuario));
        exit();
    } else {
        echo "Credenciais inválidas";
    }
    echo json_encode(['success' => false]);
}
?>