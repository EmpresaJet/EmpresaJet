var database = require("../database/config");

function listarprodutos(idUsuario) {


    console.log("ACESSEI O PRODUTOS MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n \n function ListarProdutosFrioseCongelados()");

    var instrucao = `SELECT Produto.idProduto, Produto.nomeProduto FROM Produto 
	JOIN Prateleira_Produto on fkProduto = idProduto
		JOIN Prateleira on fkPrateleira = idPrateleira 
			JOIN Empresa on Prateleira.fkEmpresa = idEmpresa
				JOIN Perfil on Perfil.fkEmpresa = idEmpresa
						WHERE Prateleira.setor = 'Frios e congelados' AND Perfil.idPerfil = ${idUsuario};
                        `;
                        console.log("Executando a instrução SQL: \n" + instrucao);
                        return database.executar(instrucao);
}


module.exports = {
    listarprodutos
}