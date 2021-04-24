const Users= require('../../models/users/user');
const { QueryTypes } = require('sequelize');
const Sequelize = require('sequelize');
const sequelize = require('../../database/database');
const bcrypt= require('bcrypt');
const jwt = require('jsonwebtoken');
const { promisify } = require('util');

exports.basicRegister = async (req, res, next) => {
    try {
      let { firstName, lastName, phoneNumber, userPassword, hospitalName, state, userPincode } = req.body;
     
      if(firstName.length>19 || lastName.length>19 ||!firstName ||!lastName){
        return res.status(400).json({
          status: true,
          message: 'Names should be within 20 characters and mandatory to provide',
        });
      }else if(!hospitalName) return res.status(400).json({
        status: true,
        message: 'Hospital name is mandatory',
      });

      req.body.userPassword = await bcrypt.hash(req.body.userPassword, 12);
      
      const user = await Users.create(req.body);
  
  
      const token = jwt.sign({ user: user.userID }, process.env.JWT_KEY, {
        expiresIn: '1d',
      });
  
      const refreshToken = jwt.sign({ user: user.userID }, process.env.JWT_REFRESH_KEY, {
        expiresIn: '7d',
      });
      res.status(200).json({
        status: true,
        message: 'Registered successfully',
        data: {
          token,
          refreshToken,
        },
      });
    } catch (error) {
      return next(error);
    }
  };


  exports.login = async (req, res, next) => {
    try {
      let  phoneNumber  = req.body.phoneNumber;
      let userPassword= req.body.userPassword;

      if(!phoneNumber || !userPassword) return res.status(401).json({
        status: false,
        message: 'Please enter details correctly',
      });
  
      let userDetails;
  
      //find user in DB
      
      userDetails = await Users.findOne({ where: [{ phoneNumber: phoneNumber }] });
      
  
      if (!userDetails || userDetails === null || userDetails === undefined) {
        return res.status(401).json({
            status: false,
            message: 'Login failed',
          });
      }

      const isValidPassword = await bcrypt.compare(userPassword, userDetails.userPassword);

      if(!isValidPassword) return res.status(401).json({
        status: false,
        message: 'Password mismatch',
      });
  
      //const otp = Math.floor(1000 + Math. random() * 9000);
  
      const token = jwt.sign({ user: userDetails.userID }, process.env.JWT_KEY, {
        expiresIn: '1d',
      });
  
      const refreshToken = jwt.sign({ user: userDetails.userID }, process.env.JWT_REFRESH_KEY, {
        expiresIn: '7d',
      });
  
      return res.status(200).json({
        status: true,
        message: 'Logged in',
        data:{
          token,
          refreshToken
        }
      });
    } catch (error) {
      return next(error);
    }
  };
  

exports.findAllPatients= async(req, res, next)=> {
  try {

    let token;
      const { authorization } = req.headers;

      if (authorization && authorization.startsWith('Bearer')) 
      {
        token = authorization.split(' ')[1];
      }

      if (!token) 
      {
        return res.status(400).json({
          status: true,
          message: 'Please provide header',
        });
      }
      const decoded = await promisify(jwt.verify)(token, process.env.JWT_KEY);

      const currentUser = await Users.findOne({ where: { userID: decoded.user } });
    if (!currentUser) {
      return res.status(400).json({
        status: true,
        message: 'User does not belongs with provided ID',
        });
    }

    //Fetching all the patients in an order for a single psychiatrist (without photos).
    const statement= "SELECT * from patients where patients.userID= "+currentUser.userID+" ORDER BY patients.patientName ASC";
    const allPatients= await sequelize.query(statement, {type: QueryTypes.SELECT});

    if(allPatients.length===0) return res.status(200).json({
      status: true,
      message: 'No patient found',
      });

      return res.status(400).json({
        status: true,
        message: 'patients found',
        totalPatients: allPatients.length,
        data:{
          allPatients
        }
        });
    
  } catch (error) {
    return next(error);
  }
}


exports.findPatientsOfHosptals= async (req, res, next)=> {
  try {
    //Fetch the count of how many patients are registered for each psychiatrist in a hospital.
    //This should return, hospital name, psychiatrist name, patients count.

    const hospitalName= req.body.hospitalName;
    if(!hospitalName) return res.status(400).json({
      status: true,
      message: 'Please enter hospital name'
      });

      const statement="SELECT users.userID, users.hospitalName,users.firstName, users.lastName from users where users.hospitalName LIKE '%"+hospitalName+"%'";
      const foundpatients= await sequelize.query(statement, {type: QueryTypes.SELECT});
      

      if(!foundpatients) return res.status(400).json({
        status: true,
        message: 'No patient found for the hospital'
        });

      let result=[];

        for(let i=0;i<foundpatients.length;i++){
            let statement1=" SELECT count(patients.userID) as totalPatients from patients where patients.userID= "+foundpatients[i].userID;
            let temp= await sequelize.query(statement1, {type: QueryTypes.SELECT});
            
            let obj={
              hospitalName: foundpatients[i].hospitalName,
              psychiatristName: foundpatients[i].firstName+" "+foundpatients[i].lastName,
              totalPatients: temp[0].totalPatients
            }
            result.push(obj);
            
        }

        return res.status(400).json({
          status: true,
          message: 'patients found',
          data:{
            result
          }
        });
      

  } catch (error) {
    return next(error);
  }
}