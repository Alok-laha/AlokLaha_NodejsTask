const express = require('express');
const router = express.Router();
const patientControllers= require('../../controllers/patients/patients');

router.post('/BasicRegister',patientControllers.basicRegister);
router.post('/Login', patientControllers.login);
router.put('/updateProfile', patientControllers.updatePatient);
router.post('/uploadImage/:id', patientControllers.uploadImage);
router.get('/register', patientControllers.getRegisterForm);



module.exports = router;