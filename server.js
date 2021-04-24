const express = require('express');
require('dotenv').config();
const bodyParser = require('body-parser');
const multer= require("multer");
const path= require("path");
const app = express();
const db = require('./database/database');
const doctorRegisterRoutes= require('./routes/users/users');
const patientRegisterRoutes= require('./routes/patients/patients');

// view engine setup
app.use(express.json());
app.use(express.urlencoded({
  extended: true
}));
app.use(express.static(__dirname + '/public/'));
app.set("view engine", "ejs");

app.use('/doctor', doctorRegisterRoutes);
app.use('/patient', patientRegisterRoutes);


app.all('*', (req, res, next) => {
    res.status(404).json({
      status: false,
      message: 'Requested API not found',
    });
  });

const testConnection = async () => {
    try {
      await db.authenticate();
      console.log('mysql connection has been established successfully.');
    } catch (error) {
      console.error('Unable to connect to the mysql database:', error);
    }
  };
  
  testConnection();
  
  app.listen(process.env.PORT, () => {
    console.log('latticeserver is running.....');
  });
  