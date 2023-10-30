document.addEventListener("DOMContentLoaded", function() {
    const radioButtons = document.querySelectorAll("input[type='radio']");
    let currentSlide = 0; // Acompanha o slide atual

    // Função para avançar o slide automaticamente
    function nextSlide() {
        currentSlide = (currentSlide + 1) % radioButtons.length;
        radioButtons[currentSlide].click();
    }

    // Configurar um temporizador para avançar os slides automaticamente
    const slideInterval = setInterval(nextSlide, 5000); // Muda a cada 3 segundos (ajuste conforme necessário)

    // Parar o temporizador quando o mouse estiver sobre o carrossel
    const slider = document.querySelector(".slider");
    slider.addEventListener("mouseenter", function() {
        clearInterval(slideInterval);
    });

    // Retomar o temporizador quando o mouse sair do carrossel
    slider.addEventListener("mouseleave", function() {
        slideInterval = setInterval(nextSlide, 5000); // Muda a cada 3 segundos (ajuste conforme necessário)
    });
});
