async function buscarProdutosPorNome() {
    const card = await fetch(`card.php?id_categoria=2`, { method: "GET" });
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
                        <button onclick="adicionarProduto(${dado.id_produto})" data-id-cards="${dado.id_produto}">
                            Adicionar <img class="car" src="svg/mdi_cart-outline.svg" alt="">
                        </button>
                    </div>
                </div>
            </section>`;

        cardsContainer.innerHTML += conteudo;
    }
}
buscarProdutosPorNome();
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
