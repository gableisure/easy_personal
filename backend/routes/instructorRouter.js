const express = require('express');
const authController = require('../controllers/authController');
const instructorController = require('../controllers/instructorController');

const router = express.Router();

router.use(authController.protect, authController.isInstructor);

router.route('/type-trainings').get(instructorController.getUserTypeTrainings);

router
  .route('/training')
  .get(instructorController.getUserTrainings)
  .post(instructorController.addTraining);

router
  .route('/exercise')
  .get(instructorController.getExercises)
  .post(instructorController.addExercise);

router
  .route('/training/:trainingId/exercise/:exerciseId')
  .post(instructorController.addExerciseToTraining);

router
  .route('/training/:trainingId')
  .get(instructorController.getUserTrainingByTrainingId)
  .delete(instructorController.deleteUserTraining);

router.route('/students').get(instructorController.getUserStudents);

router
  .route('/students/training/:trainingId')
  .post(instructorController.addTrainingToStudent);

router
  .route('/students/:userId')
  .get(instructorController.getTrainingsByUserId);

router
  .route('/exercise/:exerciseId')
  .delete(instructorController.deleteUserExercises);

module.exports = router;
