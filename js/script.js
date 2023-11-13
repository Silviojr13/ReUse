// Código responsável por conduzir o carrossel em index.html
const manualButtons = document.querySelectorAll(".manual-btn");
const delayBetweenClicks = 5000;
const delayBeforeLooping = 1000;
let currentIndex = 0;

function clickSequentially() {
    if (currentIndex < manualButtons.length) {
        manualButtons[currentIndex].click();
        currentIndex++;
    } else {
        currentIndex = 0;
        setTimeout(clickSequentially, delayBeforeLooping);
        return;
    }
    setTimeout(clickSequentially, delayBetweenClicks);
}

// Chame a função para iniciar os cliques sequenciais em loop
clickSequentially();

document.getElementById("searchInput").addEventListener("keyup", function (event) {
    // Verifica se a tecla pressionada é a tecla Enter (código 13)
    if (event.keyCode === 13) {
        realizarPesquisa();
    }
});

document.querySelector('.search').addEventListener('click', realizarPesquisa);

// ...

async function realizarPesquisa() {
    const searchInputContainer = document.getElementById("searchInputContainer");
    const slider = document.querySelector('.slider');

    // Verifica se a pesquisa já está em andamento
    if (searchInputContainer.classList.contains('searching')) {
        return;
    }

    // Adiciona uma classe para indicar que a pesquisa está em andamento
    searchInputContainer.classList.add('searching');

    // Toggle a visibilidade do campo de pesquisa e do carrossel
    if (searchInputContainer.style.display === "block") {
        // Se o campo de pesquisa estiver visível, execute a pesquisa
        const nomeProduto = document.getElementById("searchInput").value;
        await buscarProdutosPorNome(nomeProduto);

        // Agora, remova a classe de pesquisa em andamento
        searchInputContainer.classList.remove('searching');

        // Em seguida, esconda o carrossel
        slider.style.display = "none";
    } else {
        // Se o campo de pesquisa estiver oculto, mostre-o e o carrossel
        searchInputContainer.style.display = "block";
        slider.style.display = "block";

        // Agora, remova a classe de pesquisa em andamento
        searchInputContainer.classList.remove('searching');
    }

    // Limpe o valor de pesquisa
    document.getElementById("searchInput").value = "";
}

// ...


async function buscarProdutosPorNome(nomeProduto) {
    const card = await fetch(`pesquisa.php?nome=${nomeProduto}`, { method: "GET" });
    const dados = await card.json();

    // Adicione os novos cards com base nos resultados da pesquisa
    const cardsContainer = document.getElementById('cards');
    cardsContainer.innerHTML = ""; // Limpar cards existentes

    for (const dado of dados) {
        const conteudo = `
            <section class="container-cards">
                <div class="card-produto">
                    <div class="card-prod-imagem">
                        <img src="${dado.caminhoimagem}">
                    </div>
                    <br>
                    <div class="card-prod-titulo">${dado.nome}</div>
                    <div class="card-prod-valor">R$${dado.preco}</div>
                    <div class="card-prod-add">
                        <button onclick="adicionarProduto(${dado.id_produto})" data-id-cards="${dado.id_produto}">
                            Adicionar <i class="fa-solid fa-cart-shopping"></i>
                        </button>
                    </div>
                </div>
            </section>`;

        cardsContainer.innerHTML += conteudo;
    }
}

// Carregar todos os produtos inicialmente
window.onload = async function () {
    await buscarProdutosPorNome("");
}

// Script para logout
var dropdownButton = document.getElementById('dropdownButton');
var dropdown = document.getElementById('myDropdown');

dropdownButton.addEventListener('click', function() {
    if (dropdown.style.display === 'block') {
        dropdown.style.display = 'none';
    } else {
        dropdown.style.display = 'block';
    }
});

window.addEventListener('click', function(event) {
    if (event.target !== dropdownButton) {
        dropdown.style.display = 'none';
    }
});

// Adiciona os produtos no carrinho
async function adicionarProduto(idCards) {
    var response = await fetch("adicionar_ao_carrinho.php", {
        method: "POST",
        body: JSON.stringify({ id_produto: idCards }),
        headers: {
            "Content-Type": "application/json"
        }
    });

    if (response.status === 200) {
        alert("Card adicionado ao carrinho com sucesso!");
    } else {
        alert("Falha ao adicionar o card ao carrinho.");
    }
}
