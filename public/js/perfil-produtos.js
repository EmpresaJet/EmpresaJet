var prateleira_validacao = false;
var produto_validacao = false;
function validar_prateleira_produto(){
    var prateleira = input_prateleira.value;
    if(prateleira.length > 0){
        input_prateleira.classList.remove("red");
        input_prateleira.classList.add("green");
        prateleira_validacao = true;
    } else{
        input_prateleira.classList.add("red")
        input_prateleira.classList.remove("green");
        prateleira_validacao = false;
    }

    var produto = input_produto.value;
    if(produto.length >= 3){
        input_produto.classList.remove("red");
        input_produto.classList.add("green")
        produto_validacao = true;
    } else{
        input_produto.classList.add("remove");
        input_produto.classList.remove("green");
        produto_validacao = false
    }
}

function adicionar_product(){
    if(prateleira_validacao && produto_validacao){
        insertTable();
    } else if(prateleira_validacao == false){
        alert("O campo da prateleira está vazio")
    } else {
        alert("O campo do produto precisa conter no mínimo 3 letras")
    }
}
var contador_linha_tabela = 0;
function insertTable(){
    var produto = input_produto.value.toUpperCase();
    var prateleira = input_prateleira.value.toUpperCase();
    contador_linha_tabela += 1;
    tbody_table.innerHTML += `
    <tr id="${contador_linha_tabela}" class="tr_table">
        <td class="td_table">${prateleira}</td>
        <td class="td_table">${produto}</td>
        <td class="td_table_btn"><button class="btn_remover_produto" onclick="removerLinhaTabela(${contador_linha_tabela})">remover</button></td>
    </tr>
    `
}

function removerLinhaTabela(idLinhaTabela){
    var linhaTabela = document.getElementById(idLinhaTabela);
    linhaTabela.remove();
}

function mudarSetor(){
    var setor = select_setor.value;

    if(setor == 1){
        nomeSetor.innerHTML = "Frios e Congelados"
    } else if(setor == 2){
        nomeSetor.innerHTML = "Mercearia"
    } else if(setor == 3){
        nomeSetor.innerHTML = "Hortifruti"
    } else if(setor == 4){
        nomeSetor.innerHTML = "Cuidados pessoais"
    } else {
        nomeSetor.innerHTML = "Bebidas"
    }
}