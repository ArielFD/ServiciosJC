const axios = require('axios');
var nodemailer =require("nodemailer")
express=require("express")
var app=express();

//===================================================================Send Email===================================================================

// app.post("/send-email",(req,res)=>{
//     const transporter = nodemailer.createTransport({
//     host: 'smtp.gmail.com',
//     port: 465,
//     secure:true,
//     auth: {
//         user: 'arielferrera1992@gmail.com',
//         pass: 'frotvaybnnefswcm'
//     }
// });
// var mailOption = {
//   from: "Remitente",
//   to: "arielferrera1992@gmail.com",
//   subject: "Message title",
//   text: "Plaintext version of the message",
//   html: "<p>HTML version of the message</p>"
// };
//     transporter.sendMail(mailOption,(error,info)=>{
//       if(error){
//         res.status(500).send(error.message)
//       }else{
//         console.log("email enviado");
//         res.status(200).jsonp(req.body)
//       }
//     })
// })

// app.listen(3000,()=>{
//     console.log("local 3000");
// })


///===================================================================Login Registred User===================================================================

// axios
//   .post('http://localhost:1337/api/auth/local', {
//     "identifier": 'Arielito',
//     "password": 'America1992'
//   })
//   .then(response => {
//     // Handle success.
//     console.log('Well done!');
//     console.log('User profile', response.data.user);
//     console.log('User token', response.data.jwt);
//   })
//   .catch(error => {
//     // Handle error.
//     console.log('An error occurred:', error.response);
//   });
//User token eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNjQzNzM1MzMyLCJleHAiOjE2NDYzMjczMzJ9.Eu2bnFvIZLz3hwgSRkUchr40md6DQWdhQv1gSr2QZsw


//===================================================================Forgot Password===================================================================
//Request API.
// axios
//   .post('http://localhost:1337/api/auth/forgot-password', {
//     email: 'arielferrera1992@gmail.com', // user's email
//   })
//   .then(response => {
//     console.log('Your user received an email');
//   })
//   .catch(error => {
//     console.log('An error occurred:', error.response);
//   });

//===================================================================Reset Password===================================================================

  // axios
  // .post('http://localhost:1337/api/auth/reset-password', {
  //   code: '27a61948ff524bb3c25289d499bd8d7c4a1a7fdc85e757df71b7082a5812d552d4f03b6cee2b2c76bdce3bbb7e3c8090fbb9871a9054ab4c914f7a36388b66ed', // code contained in the reset link of step 3.
  //   password: 'userNewPassword',
  //   passwordConfirmation: 'userNewPassword',
  // })
  // .then(response => {
  //   console.log("Your user's password has been reset.");
  // })
  // .catch(error => {
  //   console.log('An error occurred:', error.response);
  // });

//===================================================================Mail Confirmation===================================================================

  // axios
  // .post(`http://localhost:1337/api/auth/send-email-confirmation`, {
  //   email: 'arielferrera1992@gmail.com', // user's email
  // })
  // .then(response => {
  //   console.log('Your user received an email');
  // })
  // .catch(error => {
  //   console.error('An error occurred:', error.response);
  // });