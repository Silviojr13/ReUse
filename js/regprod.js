document.querySelector('input[name="imagem"]').addEventListener('change', function (event) {
    const preview = document.querySelector('.imagem-preview');
    const file = event.target.files[0];
    const reader = new FileReader();

    reader.onload = function () {
        preview.innerHTML = `<img src="${reader.result}" alt="Imagem Preview">`;
    };

    if (file) {
        reader.readAsDataURL(file);
    } else {
        preview.innerHTML = '';
    }
});



