<?php
session_start();
include_once 'conexao.php';
include_once 'verifica.php';

$id_produto = $_GET['id_produto'];
$id_estoque = 1;

// Consultar a tabela produto
$sql = "SELECT * FROM produto WHERE id_produto = $id_produto";
$result = $conn->query($sql);

// Verificar se a consulta retornou resultados
if ($result->num_rows > 0) {
    // Exibir os dados do produto
    while($row = $result->fetch_assoc()) {
        $nome = $row["nome"];
        $id_categoriaa = $row["id_categoria"];
        $descricao = $row["descricao"];
        $preco = $row["preco"];
        $qnt = $row["quantidadeestoque"];
        $datafabricacao = date('Y-m-d', strtotime($row["datafabricacao"]));
        $img = $row["caminhoimagem"];
    }
} else {
    echo "Nenhum resultado encontrado para o ID do produto: $id_produto";
}

$sqlcat = "SELECT c.* FROM categoria c WHERE c.id_categoria = $id_categoriaa";
$resultCategoria = $conn->query($sqlcat);

// Verificar se a consulta retornou resultados
if ($resultCategoria->num_rows > 0) {
    // Exibir os dados da categoria
    while($cat = $resultCategoria->fetch_assoc()) {
        $nomecat = $cat["nome"];
        $idcat = $cat["id_categoria"];
    }
} else {
    // Tratar o caso em que não há resultados para a categoria
}

$sqlCategorias = "SELECT id_categoria, nome FROM categoria";
$resultCategorias = mysqli_query($conn, $sqlCategorias);
$categorias = mysqli_fetch_all($resultCategorias, MYSQLI_ASSOC);


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtenha os dados do formulário
    $id_disponibilidade = '1';
    $nome_produto = htmlspecialchars($_POST['nome_produto']);
    $descricao = htmlspecialchars($_POST['descricao']);
    $preco = htmlspecialchars($_POST['preco']);
    $id_categoria = htmlspecialchars($_POST['id_categoria']);
    $quantidadeestoque = htmlspecialchars($_POST['quantidadeestoque']);
    $datafabricacao = htmlspecialchars($_POST['datafabricacao']);

    // Verifique se o campo de upload de imagem está vazio
    if (empty($_FILES["imagem"]["name"])) {
        // Se estiver vazio, use a imagem existente
        $caminhoImagem = $img;
    } else {
        // Se não estiver vazio, faça o upload da nova imagem
        $caminhoImagem = "img_prod/" . basename($_FILES["imagem"]["name"]);
        $caminhoImagem = mysqli_real_escape_string($conn, $caminhoImagem); // Evitar SQL injection
        move_uploaded_file($_FILES["imagem"]["tmp_name"], $caminhoImagem);
    }

    // Verifique se a imagem já existe
    $sqlVerificaImagem = "SELECT caminhoimagem FROM produto WHERE caminhoimagem = '$caminhoImagem'";
    $result = mysqli_query($conn, $sqlVerificaImagem);
   
    // Insira no banco de dados
    $sqll = "UPDATE produto 
             SET 
             id_estoque = '$id_estoque',
             id_categoria = '$id_categoria',
             id_disponibilidade = '$id_disponibilidade',
             nome = '$nome_produto',
             descricao = '$descricao',
             preco = '$preco',
             quantidadeestoque = '$quantidadeestoque',
             datafabricacao = '$datafabricacao',
             caminhoimagem = '$caminhoImagem'
             WHERE 
             id_produto = $id_produto";
    if (mysqli_query($conn, $sqll)) {
        echo "<script>alert('Produto registrado com sucesso!');</script>";
        header("Location: edit_prod.php");
    } else {
        echo "<script>alert(1Erro ao registrar o produto:" . mysqli_error($conn)."');</script>";
    }
}
// Fechar a conexão com o banco de dados
$conn->close();
?>
<!DOCTYPE html>
<!-- Começo da tela de registro de produtos -->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Produto</title>
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
            <h1 class="textum">Editar alterações</h1>
        </nav>
    </header>
    
    <!-- Formulario para registrar os produtos -->

    
    <nav class="formulario">
        <form class="form" method="POST" enctype="multipart/form-data">
            <!-- Adicione o atributo enctype para permitir o envio de arquivos -->
            <div class="box">
                <div class="box_left">
                    <div class="input_nome">
                        <label for="nome_produto" >Nome do Produto:</label>
                        <input type="text" calss="nome"  id="nome_produto" name="nome_produto" value="<?= htmlspecialchars($nome) ?>" required><br><br>
                    </div>

                    <div class="input_descricao">
                        <label for="descricao" class="descricao">Descrição:</label>
                        <textarea id="descricao" name="descricao" placeholder="Digite a descrição do seu produto" required><?= htmlspecialchars($descricao) ?></textarea><br><br>
                    </div>
                </div>

                <div class="box_center">
                    <div class="input_preco">
                        <label for="preco">Preço:</label>
                        <input type="number" id="preco" name="preco" step="0.01" placeholder="R$ 0" value="<?= htmlspecialchars($preco)?>" required><br><br>
                    </div>

                    <div class="input_date">
                        <label for="datafabricacao">Data de Fabricação:</label>
                        <input type="date" id="datafabricacao" name="datafabricacao" value="<?= htmlspecialchars($datafabricacao)?>" required><br><br>
                    </div>
                </div>

                <div class="box_right">
                    <div class="input_quanti">
                        <label for="quantidadeestoque">Quantidade:</label>
                        <input type="number" id="quantidadeestoque" name="quantidadeestoque" step="0.01" placeholder="0" value="<?= htmlspecialchars($qnt)?>" required><br><br>
                    </div>

                    <label for="id_categoria">Categoria:</label>
                    <select class="input_cat" id="id_categoria" name="id_categoria" required>
                        <option value="<?= htmlspecialchars($idcat) ?>"><?= htmlspecialchars($nomecat) ?></option>
                        <?php
                        // Iterar sobre as categorias e criar as opções
                        foreach ($categorias as $categoria) {
                            echo '<option value="' . $categoria['id_categoria'] . '">' . htmlspecialchars($categoria['nome']) . '</option>';
                        }
                        ?>
                    </select><br><br>
                    </div>
                </div>

        <div class="input_box">
            <label for="imagem">Imagem:</label>
            <input type="file" id="imagem" name="imagem" accept="image/*">
        </div>

        <div class="imagem-preview">
            <?php
            // Exibir a imagem do banco de dados
            if (!empty($img)) {
                echo '<img src="' . htmlspecialchars($img) . '" alt="Imagem do Produto">';
            }
            ?>
        </div><br><br>

            <button class="button" type="submit">Salvar alterações</button>
        </form>
    </nav>

    <!-- importa o script js -->
    <script src="js/regprod.js"></script>
</body>
</html>
