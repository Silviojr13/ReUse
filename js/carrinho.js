/* Cards no carrinho do cliente respectivo */

async function buscarProdutosPorNome() {
    const card = await fetch(`card_carrinho.php`, { method: "GET" });
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
                    
                    <div class="card-prod-titulo">${dado.nome}</div><br>
                    <div class="card-prod-valor"><p>R$ ${dado.preco}</p></div>
                    <div class="card-prod-add">
                        <button onclick="removerProduto(${dado.id_carrinho})" data-id-cards="${dado.id_carrinho}">
                            Excluir 
                        </button>
                    </div>
                </div>
            </section>`;

        cardsContainer.innerHTML += conteudo;
    }
}


// REMOVE OS PRODUTOS DO CARRINHO

async function removerProduto(idCarrinho) {

    // Envia uma solicitação para o servidor para remover o item do carrinho com base no id_carrinho.
    var response = await fetch("remover_do_carrinho.php", {
        method: "POST",
        body: JSON.stringify({ id_carrinho: idCarrinho}),
        headers: {
            "Content-Type": "application/json"
        }
    });

    if (response.status === 200) {
        // Remoção bem-sucedida, recarrega a página.
        alert("removido com sucesso.");
        location.reload();
    } else {
        alert("Falha ao remover o item do carrinho.");
    }
}

//---------------------------------------------------------------------------------------------------------------
// mostra a quantidade de itens no carrinho
/*  
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
obterTotalCarrinho();  */ 

buscarProdutosPorNome();