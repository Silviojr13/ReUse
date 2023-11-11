<?php
// Inclua o arquivo de conexão com o banco de dados
include_once 'conexao.php';
$id_estoque = $_GET['id_estoque'] ?? null;

// Verifique se a conexão com o banco de dados foi estabelecida no arquivo 'conexao.php'
if (!$conn) {
    die("Conexão falhou: " . mysqli_connect_error());
}

// Verifique se o formulário foi enviado
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtenha os dados do formulário
    $id_disponibilidade = '1';
    $nome_produto = htmlspecialchars($_POST['nome_produto']);
    $descricao = htmlspecialchars($_POST['descricao']);
    $preco = htmlspecialchars($_POST['preco']);
    $id_categoria = htmlspecialchars($_POST['id_categoria']);
    $quantidadeestoque = htmlspecialchars($_POST['quantidadeestoque']);
    $datafabricacao = htmlspecialchars($_POST['datafabricacao']);

    // Upload da imagem
    $caminhoImagem = "img_prod/" . basename($_FILES["imagem"]["name"]);
    $caminhoImagem = mysqli_real_escape_string($conn, $caminhoImagem); // Evitar SQL injection
    move_uploaded_file($_FILES["imagem"]["tmp_name"], $caminhoImagem);

    // Verifique se a imagem já existe
    $sqlVerificaImagem = "SELECT caminhoimagem FROM produto WHERE caminhoimagem = '$caminhoImagem'";
    $result = mysqli_query($conn, $sqlVerificaImagem);
    
    if(mysqli_num_rows($result) > 0) {
        echo "Erro: Esta imagem já foi enviada.";
    } else {
        // Insira no banco de dados
        $sql = "INSERT INTO produto (id_estoque, id_categoria, id_disponibilidade, nome, 
                                     descricao, preco, quantidadeestoque, datafabricacao, caminhoimagem) 
                VALUES ('$id_estoque','$id_categoria','$id_disponibilidade','$nome_produto', '$descricao', 
                        '$preco','$quantidadeestoque','$datafabricacao','$caminhoImagem')";

        if (mysqli_query($conn, $sql)) {
            echo "Produto registrado com sucesso!";
        } else {
            echo "Erro ao registrar o produto: " . mysqli_error($conn);
        }
    }
}

// Feche a conexão com o banco de dados
mysqli_close($conn);
?>

<!DOCTYPE html>

<!-- Começo da tela de registro de produtos -->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar Produto</title>
    <link rel="icon" type="image/svg+xml" href="svg/LogoReUse1.svg" sizes="16x16">
    <link rel="stylesheet" href="css/styleregprod.css">
    <!-- Unicons -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
</head>

<!-- Corpo da pagina -->
<body>
    
    <!-- Header -->
    
    <header class="header">
        <nav class="hed">
            <a href="index.php" class="voltar"><i class="uil uil-angle-left voltar"></i></a>
            <img class="logo" src="svg/Group.svg" alt="">
            <h1 class="textum">Adicionar Produto</h1>
        </nav>
    </header>
    
    <!-- Formulario para registrar os produtos -->

    
    <nav class="formulario">
        <form class="form" method="POST" enctype="multipart/form-data">
            <!-- Adicione o atributo enctype para permitir o envio de arquivos -->
            <label for="nome_produto" calss="lab_np">Nome do Produto:</label>
            <input type="text" id="nome_produto" name="nome_produto" required><br><br>
            
            <label for="descricao">Descrição:</label>
            <textarea id="descricao" name="descricao" required></textarea><br><br>
            
            <label for="preco">Preço:</label>
            <input type="number" id="preco" name="preco" step="0.01" required><br><br>

            <label for="quantidadeestoque">Quantidade:</label>
            <input type="number" id="quantidadeestoque" name="quantidadeestoque" step="0.01" required><br><br>

            <label for="datafabricacao">Data de Fabricação:</label>
            <input type="date" id="datafabricacao" name="datafabricacao" required><br><br>

            <label for="id_categoria">Categoria:</label>
            <select id="id_categoria" name="id_categoria" required>
                <option value="">escolha uma categoria</option>
                <option value="1">Eletrônicos</option>
                <option value="2">Roupas</option>
                <option value="3">Móveis</option>
                <option value="4">Alimentos</option>
                <option value="5">Esportes</option>
                <option value="6">Livros</option>
                <option value="7">Bebidas</option>
                <option value="8">Automóveis</option>
                <option value="9">Brinquedos</option>
                <option value="10">Jóias</option>
            </select><br><br>

            <label for="imagem">Imagem:</label>
            <input type="file" name="imagem" accept="image/*" required><br><br>
            <div class="imagem-preview"></div><br><br>

            <input class="button" type="submit" value="Registrar Produto">
        </form>
    </nav>

    <!-- importa o script js -->

    <script src="js/regprod.js"></script>

</body>
</html>
