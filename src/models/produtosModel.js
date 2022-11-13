var database = require("../database/config");

function listarprodutos(idEmpresa) {


    console.log("ACESSEI O PRODUTOS MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n \n function ListarProdutosFrioseCongelados()");

    var instrucao = `SELECT Produto.idProduto, Produto.nomeProduto FROM Produto 
	JOIN Prateleira_Produto on fkProduto = idProduto
		JOIN Prateleira on fkPrateleira = idPrateleira 
			JOIN Empresa on Prateleira.fkEmpresa = idEmpresa
				JOIN Perfil on Perfil.fkEmpresa = idEmpresa
						WHERE Prateleira.setor = 'Frios e congelados' AND Empresa.idEmpresa = ${idEmpresa};
                        `;
                        console.log("Executando a instrução SQL: \n" + instrucao);
                        return database.executar(instrucao);
}

function confirmarProduto(idProduto, nome){

    console.log("ACESSEI O PRODUTOS MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n \n function ListarProdutosFrioseCongelados()");

    var instrucao = `
        update produto set nomeProduto = "${nome}" where idProduto = ${idProduto};
    `

    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function listarProdutosBebidas(idEmpresa) {
    var instrucao = `SELECT Produto.idProduto, Produto.nomeProduto FROM Produto 
	JOIN Prateleira_Produto on fkProduto = idProduto
		JOIN Prateleira on fkPrateleira = idPrateleira 
			JOIN Empresa on Prateleira.fkEmpresa = idEmpresa
				JOIN Perfil on Perfil.fkEmpresa = idEmpresa
						WHERE Prateleira.setor = 'Bebidas' AND Empresa.idEmpresa = ${idEmpresa};
                        `;
                        console.log("Executando a instrução SQL: \n" + instrucao);
                        return database.executar(instrucao);
}

function listarProdutosCuidados(idEmpresa) {
    var instrucao = `SELECT Produto.idProduto, Produto.nomeProduto FROM Produto 
	JOIN Prateleira_Produto on fkProduto = idProduto
		JOIN Prateleira on fkPrateleira = idPrateleira 
			JOIN Empresa on Prateleira.fkEmpresa = idEmpresa
				JOIN Perfil on Perfil.fkEmpresa = idEmpresa
						WHERE Prateleira.setor = 'Cuidados pessoais' AND Empresa.idEmpresa = ${idEmpresa};
                        `;
                        console.log("Executando a instrução SQL: \n" + instrucao);
                        return database.executar(instrucao);
}

module.exports = {
    listarprodutos,
    confirmarProduto,
    listarProdutosBebidas,
    listarProdutosCuidados
}