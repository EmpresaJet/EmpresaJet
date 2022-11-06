var database = require("../../../FUNCIONARIO/src/database/config")

async function buscar(idEmpresa) {
    const instrucao = `SELECT * FROM Empresa WHERE idEmpresa = ${idEmpresa}`;
    return database.executar(instrucao);
  }

function listarFuncionario() {
    console.log("ACESSEI O Perfil MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucao = `
        SELECT * FROM Perfil;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

// Coloque os mesmos parâmetros aqui. Vá para a var instrucao
async function cadastrarFuncionario(idEmpresa, idPerfil, user, senha, nome, email, contato, funcao) {
    console.log("ACESSEI O Perfil MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", user,senha,nome,email,contato,funcao);
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucao = `
        INSERT INTO Perfil (username, senha, nome ,email, telefone, funcao) 
        VALUES ('${user}', '${senha}', '${nome}', '${email}', '${contato}', '${funcao}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);

    var linhaInserida = await database.executar(instrucao);
var fkEmpresa = `select Perfil.fkEmpresa from Perfil where idPerfil = ${idPerfil}`
var execFk = await database.executar(fkEmpresa);
console.log(execFk);
  instrucao = `
    UPDATE Perfil
    SET Perfil.fkEmpresa = ${execFk}
    WHERE idPerfil = ${idPerfil};
  `
  console.log("Executando a instrução SQL: \n" + instrucao); 
  database.executar(instrucao);

  return linhaInserida.insertId;

}

module.exports = {
    cadastrarFuncionario,
    listarFuncionario,
    buscar
};