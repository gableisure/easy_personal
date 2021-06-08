const express = require('express');
const userController = require('../controllers/userController');
const authController = require('../controllers/authController');

const router = express.Router();

router.route('/professores').get(userController.getAllInstructors);
router.route('/alunos').get(userController.getAllStudents);

router
  .route('/trainings')
  .get(authController.protect, userController.getUserTrainings);

router.route('/').get(userController.getAllUsers).post(authController.signup);
router
  .route('/:id')
  .get(userController.getUser)
  .patch(userController.updateUser)
  .delete(userController.deleteUser);

router.route('/signup').post(authController.signup);

router.route('/login').post(authController.login);

router.route('/forgotPassword').post(authController.forgotPassword);

router.route('/resetPassword/:token').patch(authController.resetPassword);

module.exports = router;
