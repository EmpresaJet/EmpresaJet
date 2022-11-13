var produtosModel = require("../models/produtosModel");


function listarprodutos(req, res) {

    var idEmpresa = req.params.idEmpresa
   
    produtosModel.listarprodutos(idEmpresa).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function(erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar os avisos: ", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function confirmarProduto(req, res) {
    var idProduto = req.params.idProduto;
    var nome = req.body.nome;
   
    produtosModel.confirmarProduto(idProduto, nome).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function(erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar os avisos: ", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

module.exports = {
    listarprodutos,
    confirmarProduto,
}