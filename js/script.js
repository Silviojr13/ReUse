//- - - - - - - - - - - - - - -  - -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// código responsavel por conduzir o carrocel em index.html

const manualButtons = document.querySelectorAll(".manual-btn"); // Selecione os botões usando a classe correspondente
const delayBetweenClicks = 5000; // Tempo em milissegundos entre os cliques (1 segundo neste exemplo)
const delayBeforeLooping = 1000; // Tempo em milissegundos antes de retornar ao primeiro botão (5 segundos neste exemplo)
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



document.getElementById('carrinho').addEventListener('click', function() {
    var sidebar = document.createElement('div');
    sidebar.style.position = 'fixed';
    sidebar.style.width = '300px';
    sidebar.style.height = '100%';
    sidebar.style.top = '0';
    sidebar.style.right = '0';
    sidebar.style.backgroundColor = 'grey';
    sidebar.style.padding = '20px';
    sidebar.style.boxShadow = '0 0 10px rgba(0, 0, 0, 0.1)';

    var header = document.createElement('h2');
    header.textContent = 'Seu Carrinho';
    header.style.marginBottom = '20px';

    var closeButton = document.createElement('button');
    closeButton.textContent = 'Fechar';
    closeButton.style.position = 'absolute';
    closeButton.style.top = '20px';
    closeButton.style.right = '20px';
    closeButton.style.backgroundColor = '#f44336';
    closeButton.style.color = '#fff';
    closeButton.style.border = 'none';
    closeButton.style.padding = '5px 10px';
    closeButton.style.borderRadius = '50%';
    closeButton.style.cursor = 'pointer';
    closeButton.addEventListener('click', function() {
        document.body.removeChild(sidebar);
    });

    sidebar.appendChild(header);
    sidebar.appendChild(closeButton);
    document.body.appendChild(sidebar);
});

//- - - - - - - - - - - - - - -  - -- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
// chama o get do usuario de index.php para index.html

document.addEventListener("DOMContentLoaded", function() {
    // Seleciona o elemento onde deseja inserir os dados do usuário
    var userInfoDiv = document.getElementById("user-info");

    // Obtém o nome do usuário da URL
    var urlParams = new URLSearchParams(window.location.search); 
    var nomeUsuario = urlParams.get("nome_usuario");

    if (nomeUsuario) {
        // Exibe o nome do usuário com estilos inline
        userInfoDiv.innerHTML = '<img src="svg/mdi_user.svg" alt="" class="user"><p class="log_text" style="color: inherit; text-decoration: none;">' + nomeUsuario + '</p>';
    } else {
        // Caso não haja nome de usuário na URL, exibe "Fazer login"
        userInfoDiv.innerHTML = '<a href="login.php"><img src="svg/mdi_user.svg" alt="" class="user"><p class="log_text" style="color: inherit; text-decoration: none;">Fazer login</p></a>';
    }
});




//--------------------------------------------------------------------------------------------------------------------------------------------------
//script para logout

// Obtenha referências aos elementos do botão e do dropdown
var dropdownButton = document.getElementById('dropdownButton');
var dropdown = document.getElementById('myDropdown');

// Adicione um ouvinte de evento ao botão para alternar a exibição do dropdown
dropdownButton.addEventListener('click', function() {
    if (dropdown.style.display === 'block') {
        dropdown.style.display = 'none';
    } else {
        dropdown.style.display = 'block';
    }
});

// Feche o dropdown se o usuário clicar fora dele
window.addEventListener('click', function(event) {
    if (event.target !== dropdownButton) {
        dropdown.style.display = 'none';
    }
});

/* Cards dos produtos registrados */



window.onload = async function () {
    var card = await fetch ("card.php", {
        method: "GET"
    });

    var dados = await card.json();

    for (var i = 0; i < dados.length; i++){
        var conteudo =
        `<section class="container-cards">

            <div class="card-produto">
                <div class="card-prod-imagem">
                    <img src="${dados[i].caminhoimagem}">
                </div>
                <div class="card-prod-titulo">
                    ${dados[i].descricao}
                </div>
                <!--<div class="card-prod-periodo">${dados[i].periodo}</div>-->
                <div class="card-prod-valor">R$${dados[i].preco}</div>
                <div class="card-prod-add">
                    <button onclick="adicionarProduto(${dados[i].id_cards})" data-id-cards="${dados[i].id_cards}">Adicionar
                        <i class="fa-solid fa-cart-shopping"></i>
                    </button>
                </div>
            </div>

        </section>`;

        document.getElementById('cards').innerHTML += conteudo; // atualiza no html

    }
}  



/* Carrinho a baixo */

// ADICIONA OS PRODUTOS NO CARRINHO

async function adicionarProduto(idCards) {
    // Define o idEstudante com o valor desejado, por exemplo, 1.
    var idCliente = 1;

    // Envia uma solicitação para o servidor para inserir o card no carrinho.
    var response = await fetch("adicionar_ao_carrinho.php", {
        method: "POST",
        body: JSON.stringify({ id_cards: idCards, id_cliente: idCliente }),
        headers: {
            "Content-Type": "application/json"
        }
    });

    if (response.status === 200) {
        // Atualize a interface do usuário para refletir a adição ao carrinho, se necessário.
        alert("Card adicionado ao carrinho com sucesso!");
    } else {
        alert("Falha ao adicionar o card ao carrinho.");
    }
}

