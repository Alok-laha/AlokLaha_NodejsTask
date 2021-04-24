const express = require('express');
const router = express.Router();
const registerRoutes= require('../../controllers/users/user');

router.post('/BasicRegister',registerRoutes.basicRegister);
router.post('/Login', registerRoutes.login);
router.post('/findPatients', registerRoutes.findAllPatients);
router.post('/patientsOfHospital',registerRoutes.findPatientsOfHosptals);




module.exports = router;