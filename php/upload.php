<?php
if(isset($_POST["submit"])) {
    $targetDirectory = "../img/"; // Diretório onde a imagem será armazenada
    $targetFile = $targetDirectory . basename($_FILES["imagem"]["name"]);
    $uploadOk = 1;
    $imageFileType = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION));

    // Verifica se o arquivo é uma imagem
    if(isset($_POST["submit"])) {
        $check = getimagesize($_FILES["imagem"]["tmp_name"]);
        if($check !== false) {
            $uploadOk = 1;
        } else {
            echo "O arquivo não é uma imagem.";
            $uploadOk = 0;
        }
    }

    // Verifica se o arquivo já existe
    if (file_exists($targetFile)) {
        echo "Desculpe, a imagem já existe.";
        $uploadOk = 0;
    }

    // Verifica o tamanho do arquivo (opcional)
    if ($_FILES["imagem"]["size"] > 5000000) {
        echo "Desculpe, o tamanho do arquivo é muito grande.";
        $uploadOk = 0;
    }

    // Permite apenas alguns tipos de arquivo (você pode personalizar esta lista)
    if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg") {
        echo "Desculpe, apenas arquivos JPG, JPEG e PNG são permitidos.";
        $uploadOk = 0;
    }

    // Verifica se $uploadOk é definido como 0 por um erro
    if ($uploadOk == 0) {
        echo "Desculpe, seu arquivo não foi enviado.";
    } else {
        if (move_uploaded_file($_FILES["imagem"]["tmp_name"], $targetFile)) {
            echo "A imagem ". basename( $_FILES["imagem"]["name"]). " foi enviada com sucesso.";
        } else {
            echo "Ocorreu um erro ao enviar a imagem.";
        }
    }
}
?>