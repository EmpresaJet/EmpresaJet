var express = require("express");
var router = express.Router();

var kpigeralController = require("../controllers/kpigeralController");

router.get("/kpisdashboardgeral/:idEmpresa", function (req, res) {
    kpigeralController.buscarMedidasEmTempoReal(req, res);
});

module.exports = router;