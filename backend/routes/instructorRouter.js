const express = require('express');
const authController = require('../controllers/authController');
const instructorController = require('../controllers/instructorController');

const router = express.Router();

router.use(authController.protect, authController.isInstructor);

router
  .route('/typeTraining')
  .get(instructorController.getUserTypeTrainings)
  .post(instructorController.addTypeTraining);

module.exports = router;
