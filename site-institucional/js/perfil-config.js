
function alterar_user(){
    btn_edit_user.remove();

    div_user.innerHTML += `
    <div id="div_change_user" class="div_input">
        <label for="change_user"></label>
        <input class="input_user_pass_telefone" id="change_user" type="text">
        <button onclick="confirmar_user()" class="btn_user_pass_telefone">Confirmar</button>
        <button onclick="cancelar_user()" class="btn_user_pass_telefone_remove">Cancelar</button>
    </div>
    `
}
function cancelar_user(){
    div_change_user.remove();

    div_user.innerHTML += `
    <button onclick="alterar_user()" id="btn_edit_user" class="btn_edit">
        Editar
    </button>
    `
}
function confirmar_user(){
    var user = change_user.value;
    span_user.innerHTML = user

    div_change_user.remove();

    div_user.innerHTML += `
    <button onclick="alterar_user()" id="btn_edit_user" class="btn_edit">
        Editar
    </button>
    `
}

function alterar_senha(){
    btn_edit_pass.remove();

    div_content_pass.innerHTML += `
    <div id="div_change_pass" class="div_input">
        <label for="change_pass"></label>
        <input class="input_user_pass_telefone" id="change_pass" type="text">
        <button onclick="confirmar_senha()" class="btn_user_pass_telefone">Confirmar</button>
        <button onclick="cancelar_senha()" class="btn_user_pass_telefone_remove">Cancelar</button>
    </div>
    `
}
function cancelar_senha(){
    div_change_pass.remove();

    div_content_pass.innerHTML += `
    <button onclick="alterar_senha()" id="btn_edit_pass" class="btn_edit">
        Editar
    </button>
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


function alterar_telefone(){
    btn_edit_telefone.remove();

    div_content_telefone.innerHTML += `
    <div id="div_change_telefone" class="div_input">
        <label for="change_telefone"></label>
        <input class="input_user_pass_telefone" id="change_telefone" type="number">
        <button onclick="confirmar_telefone()" class="btn_user_pass_telefone">Confirmar</button>
        <button onclick="cancelar_telefone()" class="btn_user_pass_telefone_remove">Cancelar</button>
    </div>
    `
}
function cancelar_telefone(){
    div_change_telefone.remove();

    div_content_telefone.innerHTML += `
    <button onclick="alterar_telefone()" id="btn_edit_telefone" class="btn_edit">
        Editar
    </button>
    `
}
function confirmar_telefone(){
    var telefone = Number(change_telefone.value);
    span_telefone.innerHTML = telefone;

    div_change_telefone.remove();

    div_content_telefone.innerHTML +=`
    <button onclick="alterar_telefone()" id="btn_edit_telefone" class="btn_edit">
        Editar
    </button>
    `
}