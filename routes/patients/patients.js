const express = require('express');
const router = express.Router();
const patientControllers= require('../../controllers/patients/patients');

router.post('/BasicRegister',patientControllers.basicRegister);
router.post('/Login', patientControllers.login);
router.post('/updateProfile', patientControllers.updatePatient);




module.exports = router;