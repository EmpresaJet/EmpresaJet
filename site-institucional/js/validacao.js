/* Validando os campos */

function validarUsuario() {
  var usuario = inputUsuario.value;
  /* Verifica se o usuario tem mais de 6 caractéres */
  if (usuario.length < 6) {
    spanErrorUser.classList.add("active");
    spanErrorUser.innerHTML = "Nome Inválido";
  } else {
    spanErrorUser.classList.remove("active");
  }
}

function validarSenha() {
  var senha = inputSenha.value;
  var fortificador =
    /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[$*&@#])([0-9a-zA-Z$*&@#]){8,}$/;
  /*
    
  (?=.*\d)         // deve conter ao menos um dígito
  (?=.*[a-z])      // deve conter ao menos uma letra minúscula
  (?=.*[A-Z])      // deve conter ao menos uma letra maiúscula
  (?=.*[$*&@#!])    // deve conter ao menos um caractere especial

  ([0-9a-zA-Z$*&@#]): é uma classe de caracteres contendo números, 
  letras e os caracteres especiais que você está considerando. 
  Eles estão dentro de parênteses para formar um grupo de captura

*/
  /* Verifica se a senha está com as requisições acima */
  if (fortificador.test(senha)) {
    spanErrorPassword.classList.add("active");
    spanErrorPassword.innerHTML = "Senha inválida";
  } else {
    spanErrorPassword.classList.remove("active");
  }
}
function validarNome() {
  var nome = inputNome.value;
  /* Devolve a quantidade de nomes em numeros Ex: Sherlock Homes -> vai retornar 2 */
  const nomeCompleto = nome.split(" ");
  /* Verifica se a quantidade de nomes é menor que 1, pois ninguém tem um nome completo de um nome apenas */
  if (nomeCompleto.length <= 1) {
    spanErrorName.classList.add("active");
    spanErrorName.innerHTML = "Nome Inválido";
  } else {
    spanErrorName.classList.remove("active");
  }
  /* Faz a substituição das primeiras letras dos nomes caso o usuário coloque a primeira leta do nome minuscula */
  for (let i = 0; i < nomeCompleto.length; i++) {
    nomeCompleto[i] =
      nomeCompleto[i][0].toUpperCase() + nomeCompleto[i].substr(1);
  }
  /* Junta os nomes novamente */
  nomeCompleto.join(" ");
}
function validarEmail() {
  var email = inputEmail.value;
  var validacao = /\S+@\S+\.\S+/;
  /* Qualquer tipo de texto:
  Seguida por um caractere @ (que é obrigatório em e-mails);
  Seguido por algum outro texto, o domínio/provedor;
  E então temos a presença de um ponto, que também é obrigatório;
  E por fim mais um texto, validando tanto emails .com quanto .com.br, e outros que tenham terminologias diferentes */
  if (!validacao.test(email)){
    spanErrorEmail.classList.add("active");
    spanErrorEmail.innerHTML = "E-mail Inválido";
  } else {
    spanErrorEmail.classList.remove("active");
  }
}
function validarContato() {
  var contato = inputContato.value;
  if (contato.length > 11) {
    // Valida números telefones celulares para contato
    spanErrorContate.classList.add("active");
    spanErrorContate.innerHTML = "Contato Inválido";
  } else {
    spanErrorContate.classList.remove("active");
  }
}


// link para a dashboard

function link_perfil(){
  window.location.href = "perfil-dashboard-empresa.html"
} 
