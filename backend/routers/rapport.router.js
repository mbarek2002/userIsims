const router = require('express').Router();
const RapportController = require('../controllers/rapport.controller')


router.get('/getRapports',RapportController.getRapports);
router.post('/addRapport',RapportController.addRapport)

module.exports =router;