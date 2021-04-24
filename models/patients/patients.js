const Sequelize = require('sequelize');
const sequelize = require('../../database/database');


// 1. Name* (should be at least 3 characters)
// 2. Address* (should be at least 10 characters)
// 3. Email* (should be a valid email address)
// 4. Phone number (should be at least 10 number + country code)
// 5. Password* (must contain one upper character, one lower character and a number. Max
// length 15 and min length 8)
// 6. Patient Photo*


const Patients = sequelize.define(
    'patients',
    {
      patientID: {
        type: Sequelize.INTEGER,
        autoIncrement: true,
        allowNull: false,
        primaryKey: true,
      },
      patientName: {
        type: Sequelize.STRING(20),
        allowNull: false,
      },
      patientPhoneNumber: {
        type: Sequelize.STRING(10),
        allowNull: false,
        unique: true,
      },
      patientAddress:{
        type: Sequelize.STRING(100),
        allowNull: false,
      },
      patientEmail: {
        type: Sequelize.STRING(100),
        allowNull: false,
        validate: {
          isEmail: true,
        },
        unique: true,
      },
      patientPassword: {
        type: Sequelize.STRING(100),
        allowNull: false,
        defaultValue: " "
      },
      patientPhoto:{
        type: Sequelize.STRING(100),
        allowNull: false,
        defaultValue: " "
      },
      userID: {
        type: Sequelize.INTEGER,
        allowNull: false,
      },
      patientCreatedDate: {
        type: 'TIMESTAMP',
        allowNull: false,
        defaultValue: Sequelize.literal('CURRENT_TIMESTAMP'),
      },
    },
    {
      freezeTableName: true,
      timestamps: false,
      createAt: false,
      paranoid: true,
    },
  );
  
  Patients
    .sync()
    .then((result) => {
      console.log('patient table created');
    })
    .catch((err) => {
      console.log(err);
    });
  
  module.exports = Patients;
  