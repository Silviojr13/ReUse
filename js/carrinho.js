/* Cards no carrinho do cliente respectivo */

window.onload = async function () {
    var card = await fetch ("card_carrinho.php", {
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
                <br>
                <div class="card-prod-titulo">
                    ${dados[i].nome}
                </div>
                <!--<div class="card-prod-periodo">${dados[i].periodo}</div>-->
                <div class="card-prod-valor">R$${dados[i].preco}</div>
                <div class="card-prod-add">
                    <button onclick="adicionarProduto(${dados[i].id_produto})" data-id-cards="${dados[i].id_produto}">Adicionar
                        <i class="fa-solid fa-cart-shopping"></i>
                    </button>
                </div>
            </div>

        </section>`;

        document.getElementById('cards').innerHTML += conteudo; // atualiza no html

    }
}  


// REMOVE OS PRODUTOS DO CARRINHO

async function removerProduto(idCarrinho) {
    // Define o idEstudante com o valor desejado, por exemplo, 1.
    var idCliente = 1;

    // Envia uma solicitação para o servidor para remover o item do carrinho com base no id_carrinho.
    var response = await fetch("remover_do_carrinho.php", {
        method: "POST",
        body: JSON.stringify({ id_carrinho: idCarrinho, id_cliente: idCliente }),
        headers: {
            "Content-Type": "application/json"
        }
    });

    if (response.status === 200) {
        // Remoção bem-sucedida, recarrega a página.
        location.reload();
    } else {
        alert("Falha ao remover o item do carrinho.");
    }
}

//---------------------------------------------------------------------------------------------------------------
// mostra a quantidade de itens no carrinho

function obterQuantidadeNoCarrinho() {
    fetch('qnt_carrinho.php')
        .then(response => response.json())
        .then(data => {
            document.getElementById('qtn').textContent = data.quantidade;
        })
        .catch(error => {
            console.error('Erro ao obter a quantidade no carrinho:', error);
        });
}

// Chama a função para obter a quantidade
obterQuantidadeNoCarrinho();

function obterTotalCarrinho() {
    fetch('total.php')
        .then(response => response.json())
        .then(data => {
            document.getElementById('total').textContent = data.total;
        })
        .catch(error => {
            console.error('Erro ao obter a total do carrinho:', error);
        });
}

// Chama a função para obter o valor total
obterTotalCarrinho();   