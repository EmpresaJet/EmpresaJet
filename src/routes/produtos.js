var express = require("express");
var router = express.Router();

var produtosController = require("../controllers/produtosController");


router.get("/listarprodutos", function (req, res) {
    produtosController.listarprodutos(req, res);
});



module.exports = router;