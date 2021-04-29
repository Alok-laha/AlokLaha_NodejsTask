const express = require('express');
const router = express.Router();
const patientControllers= require('../../controllers/patients/patients');

router.post('/BasicRegister',patientControllers.basicRegister);
router.post('/Login', patientControllers.login);
router.put('/updateProfile', patientControllers.updatePatient);
router.post('/uploadImage', patientControllers.uploadImage);




module.exports = router;