const nodemailer = require('nodemailer');

const sendEmail = async options => {
  const transporter = nodemailer.createTransport({
    service: 'Gmail',
    auth: {
      user: 'easypersonal2021@gmail.com',
      pass: 'tccea2021',
    },
  });

  const mailOptions = {
    from: 'Easy Personal <easypersonal2021@gmail.com>',
    to: options.email,
    subject: options.subject,
    text: options.message,
  };

  await transporter.sendMail(mailOptions);
};

module.exports = sendEmail;
