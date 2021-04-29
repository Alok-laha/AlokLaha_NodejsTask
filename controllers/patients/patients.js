const Patients = require('../../models/patients/patients');
const { promisify } = require('util');
const bcrypt= require('bcrypt');
const jwt = require('jsonwebtoken');
const multer= require("multer");
const path= require("path");

let currentData="";
const storage = multer.diskStorage({
    destination: (req, file, cb) => {
            cb(null, 'public/uploads');
    },
    filename: (req, file, cb) => {
       console.log(file);
       currentData=file.fieldname + '-' + Date.now() + path.extname(file.originalname);
       cb(null, currentData);
  }
});
       
const fileFilter = (req, file, cb) => {
    if (file.mimetype === 'image/png' || file.mimetype === 'image/jpg' || file.mimetype === 'image/jpeg') {
      cb(null, true);
    } else {
      cb(null, false);
    }
  };

exports.basicRegister = async (req, res, next) => {
    try {

      let { patientName,countryCode, patientPhoneNumber, patientAddress, patientEmail, patientPassword, userID} = req.body;
      console.log(req.body);

      if(!patientName || !patientAddress || !patientPhoneNumber || !patientEmail || !patientPassword || !userID)
      {
        return res.status(400).json({
          status: true,
          message: 'Enter mandatory details',
        });
      }

      if(patientName.length<3 || patientAddress.length<10 || patientPhoneNumber<10){
        return res.status(400).json({
          status: true,
          message: 'Name length atleast 3, address 10, phone 10',
        });
      }

      if (!patientEmail.match(/@/g)) {
        return res.status(400).json({
          status: true,
          message: 'Please enter a valid e-mail ID',
        });
      }

      // let re=new RegExp("(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}");
      // if(!re.test(req.body.patientPassword)){
      //   return res.status(400).json({
      //     status: true,
      //     message: 'must contain one upper character, one lower character and a number. Max length 15 and min length 8',
      //   });
      // }

      let upload = multer({ storage: storage, fileFilter: fileFilter }).single('myImage');
      upload(req, res, function(err) {
        // req.file contains information of uploaded file
        // req.body contains information of text fields, if there were any

        if (req.fileValidationError) {
            return res.send(req.fileValidationError);
        }
        else if (!req.file) {
            return res.send('Please select an image to upload');
        }
        else if (err instanceof multer.MulterError) {
            return res.send(err);
        }
        else if (err) {
            return res.send(err);
        }
        req.body.patientPhoto= currentData;
      });
      
      req.body.patientPhoneNumber= countryCode+" "+patientPhoneNumber;
      req.body.patientPassword = await bcrypt.hash(req.body.patientPassword, 12);
      
      
      const user = await Patients.create(req.body);
  
  
      const token = jwt.sign({ user: user.patientID }, process.env.JWT_KEY, {
        expiresIn: '1d',
      });
  
      const refreshToken = jwt.sign({ user: user.patientID }, process.env.JWT_REFRESH_KEY, {
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
      return res.status(400).json({
        status: false,
        message: error
      });
    }
  };

exports.uploadImage= async (req, res)=>{
  try {
//     const patientPhoneNumber= req.body.patientPhoneNumber;
//     console.log(req.file);
// console.log("number"+ patientPhoneNumber);
//     const foundpatient= await Patients.findOne({where: { patientPhoneNumber: patientPhoneNumber
//     }});

//     if(!foundpatient) return res.status(200).json({
//       status: false,
//       message: 'Patient not found'
//     });

    let upload = multer({ storage: storage, fileFilter: fileFilter }).single('myImage');
      upload(req, res, function(err) {
        // req.file contains information of uploaded file
        // req.body contains information of text fields, if there were any

        if (req.fileValidationError) {
            return res.send(req.fileValidationError);
        }
        else if (!req.file) {
            return res.send('Please select an image to upload');
        }
        else if (err instanceof multer.MulterError) {
            return res.send(err);
        }
        else if (err) {
            return res.send(err);
        }
        req.body.patientPhoto= currentData;
      });
console.log(currentData);
      // foundpatient.patientPhoto= currentData;
      // foundpatient.save().then(data=> {
      //   return res.send('Image uploaded');
      // });
      res.send('done');

  } catch (error) {
    return res.status(400).json({
      status:false,
      message:error
    })
  }
}


exports.updatePatient= async(req, res, next)=>{
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
      

      const currentUser = await Patients.findOne({ where: { patientID: decoded.user } });
    if (!currentUser) {
      return res.status(400).json({
        status: true,
        message: 'User does not belongs with provided ID',
        });
    }

    if(!req.body.patientPhoneNumber || req.body.patientPhoneNumber==null) return res.status(400).json({
            status: true,
            message: 'Enter mobile number',
      });

        let { patientName, patientPhoneNumber, patientAddress, patientEmail, patientPassword, userID} = req.body;
      if(!patientName || !patientAddress || !patientPhoneNumber || !patientEmail || !patientPassword || !userID)
      {
        return res.status(400).json({
          status: true,
          message: 'Enter mandatory details',
    });
      }

      currentUser.patientName= patientName,
      currentUser.patientPhoneNumber= patientPhoneNumber,
      currentUser.patientAddress= patientAddress,
      currentUser.patientEmail= patientEmail,
      currentUser.patientPassword= patientPassword,
      currentUser.userID= userID;

      currentUser.save().then(data=>{
        data.patientPassword=""
        return res.status(200).json({
          status: true,
          message: 'Profile updated successfully',
          data: [data]
        });
      });

      

    } catch (error) {
      const refreshToken = req.header('x-refresh-token');

      if (!refreshToken) {
        return res.status(400).json({
          status: false,
          message: "Please provide refresh token"
        });
      }
  console.log("In refresh");
      try {
        const decodedRefreshToken = await promisify(jwt.verify)(refreshToken, process.env.JWT_REFRESH_KEY);
  
        const currentUser = await Patients.findOne({ where: { patientID: decodedRefreshToken.user } });
      if (!currentUser) {
      return res.status(400).json({
        status: true,
        message: 'User does not belongs with provided ID',
        });
      }

        if(!req.body.patientPhoneNumber || req.body.patientPhoneNumber==null) return res.status(400).json({
          status: true,
          message: 'Enter mobile number',
    });

      let { patientName, patientPhoneNumber, patientAddress, patientEmail, patientPassword, userID} = req.body;
    if(!patientName || !patientAddress || !patientPhoneNumber || !patientEmail || !patientPassword || !userID)
    {
      return res.status(400).json({
        status: true,
        message: 'Enter mandatory details',
  });
    }

    currentUser.patientName= patientName,
    currentUser.patientPhoneNumber= patientPhoneNumber,
    currentUser.patientAddress= patientAddress,
    currentUser.patientEmail= patientEmail,
    currentUser.patientPassword= patientPassword,
    currentUser.userID= userID;

    currentUser.save().then(data=>{
      data.patientPassword=""
      return res.status(200).json({
        status: true,
        message: 'Profile updated successfully',
        data: [data]
      });
    });
  
      } catch (error) {
        return res.status(400).json({
          status: false,
          message: error
        });
      }
    }
}

exports.login = async (req, res, next) => {
  try {
    let  phoneNumber  = req.body.patientPhoneNumber;
    let userPassword= req.body.patientPassword;

    if(!phoneNumber || !userPassword) return res.status(401).json({
      status: false,
      message: 'Please enter details correctly',
    });

    let userDetails;

    //find user in DB
    
    userDetails = await Patients.findOne({ where: [{ patientPhoneNumber: phoneNumber }] });
    

    if (!userDetails || userDetails === null || userDetails === undefined) {
      return res.status(401).json({
          status: false,
          message: 'Login failed',
        });
    }

    const isValidPassword = await bcrypt.compare(userPassword, userDetails.patientPassword);

    if(!isValidPassword) return res.status(401).json({
      status: false,
      message: 'Password mismatch',
    });

    //const otp = Math.floor(1000 + Math. random() * 9000);
    const token = jwt.sign({ user: userDetails.patientID }, process.env.JWT_KEY, {
      expiresIn: '1d',
    });

    const refreshToken = jwt.sign({ user: userDetails.patientID }, process.env.JWT_REFRESH_KEY, {
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
    return res.status(400).json({
      status: false,
      message: error
    });
  }
};