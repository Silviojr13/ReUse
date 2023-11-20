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
                    <a href="produto.php"><div class="card-prod-imagem">
                        <img src="${dado.caminhoimagem}">
                    </div></a>
                    
                    <div class="card-prod-titulo">${dado.nome}</div><br>
                    <div class="card-prod-valor"><p>R$ ${dado.preco}</p></div>
                    <div class="card-prod-add">
                        <a href="edit.php?id_produto=${dado.id_produto}"><button  data-id-cards="${dado.id_produto}">
                            Editar 
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

async function idprod(idprod) {
    var response = await fetch("edit.php", {
        method: "POST",
        body: JSON.stringify({ id_produto: idprod }),
        headers: {
            "Content-Type": "application/json"
        }
    });

    if (response.status === 200) {
        window.location.href = "edit.php"
    } else {
        alert("Falha ao ir para edição");
    }
}