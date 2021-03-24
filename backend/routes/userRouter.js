const express = require('express');
const userController = require('../controllers/userController');
const authController = require('../controllers/authController');

const router = express.Router();

router.route('/').get(userController.getAllUsers).post(userController.addUser);
router.route('/:id').get(userController.getUser);

router.route('/alunos').get(userController.getAllStudents);

router.route('/professores').get(userController.getAllInstructors);

router.route('/signup').post(authController.signup);

router.route('/login').post(authController.login);

module.exports = router;
