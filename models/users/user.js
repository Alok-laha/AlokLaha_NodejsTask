const Sequelize = require('sequelize');
const sequelize = require('../../database/database');

const Users = sequelize.define(
  'users',
  {
    userID: {
      type: Sequelize.INTEGER,
      autoIncrement: true,
      allowNull: false,
      primaryKey: true,
    },
    firstName: {
      type: Sequelize.STRING(20),
      allowNull: false,
    },
    lastName: {
        type: Sequelize.STRING(20),
        allowNull: false,
    },
    phoneNumber: {
      type: Sequelize.STRING(),
      allowNull: false,
      unique: true,
    },
    userPassword: {
      type: Sequelize.STRING(100),
      allowNull: false,
      defaultValue: "password"
    },
    hospitalName: {
      type: Sequelize.STRING(100),
      allowNull: false,
      defaultValue: " "
    },
    state: {
      type: Sequelize.STRING(20),
      allowNull: true,
    },
    userPincode:{
      type: Sequelize.STRING(10),
      allowNull: true,
    },
    userCreatedDate: {
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

Users
  .sync()
  .then((result) => {
    console.log('user table created');
  })
  .catch((err) => {
    console.log(err);
  });

module.exports = Users;
