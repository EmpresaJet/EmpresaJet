var express = require("express");
var router = express.Router();

var produtosController = require("../controllers/produtosController");


router.get("/", function (req, res) {
    produtosController.buscar(req,res);
});