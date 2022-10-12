
function alterar_nome(){
    btn_edit_user.remove();

    div_user.innerHTML += `
    <div id="div_change_user" class="div_input">
        <label for="change_user"></label>
        <input class="input_user_pass" id="change_user" type="text">
        <button onclick="confirmar_user()" class="btn_user_pass">Confirmar</button>
    </div>
    `
}
function confirmar_user(){
    var user = change_user.value;
    span_user.innerHTML = user

    div_change_user.remove();

    div_user.innerHTML += `
    <button onclick="alterar_nome()" id="btn_edit_user" class="btn_edit">
        Editar
    </button>
    `
}
function alterar_senha(){
    btn_edit_pass.remove();

    div_content_pass.innerHTML += `
    <div id="div_change_pass" class="div_input">
        <label for="change_pass"></label>
        <input class="input_user_pass" id="change_pass" type="text">
        <button onclick="confirmar_senha()" class="btn_user_pass">Confirmar</button>
    </div>
    `
}
function confirmar_senha(){
    var senha = change_pass.value;
    span_senha.innerHTML = senha;

    div_change_pass.remove();

    div_content_pass.innerHTML += `
    <button onclick="alterar_senha()" id="btn_edit_pass" class="btn_edit">
        Editar
    </button>
    `
}
var cliques = 1; 
function add_telefone(){
        var nmr_tel = input_telefone.value;
        if(cliques == 1){
            div_telefones.innerHTML += `
            <div id="id1" class="div-content-telefone">
                <h4 id="tel" class="info">${nmr_tel}</h4>
                <img class="icon-close" src="./assets/icones/close.png" alt="" onclick="remover1()">
            </div>
        `
        } else if(cliques == 2){
            div_telefones.innerHTML += `
            <div id="id2" class="div-content-telefone">
                <h4 id="tel" class="info">${nmr_tel}</h4>
                <img class="icon-close" src="./assets/icones/close.png" alt="" onclick="remover2()">
            </div>
            `
        } else if(cliques == 3){
            div_telefones.innerHTML += `
            <div id="id3" class="div-content-telefone">
                <h4 id="tel" class="info">${nmr_tel}</h4>
                <img class="icon-close" src="./assets/icones/close.png" alt="" onclick="remover3()">
            </div>
            `
        }
        cliques += 1;
     
        input_telefone.value = null;
    }

function remover1(){
    id1.remove();
    cliques = 1;
}
function remover2(){
    id2.remove();
    cliques = 2;
}
function remover3(){
    id3.remove();
    cliques = 3;
}
