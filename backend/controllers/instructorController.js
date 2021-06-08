const catchAsync = require('../utils/catchAsync');
const instructorService = require('../services/instructorService');

exports.addTraining = catchAsync(async (req, res, next) => {
  await instructorService.addTraining(req);

  res.status(201).json({
    status: 'success',
    data: 'Treino criado!',
  });
});

exports.getUserTrainings = catchAsync(async (req, res, next) => {
  const trainings = await instructorService.getUserTrainings(req);

  res.status(200).json({
    status: 'success',
    results: trainings.length,
    data: trainings,
  });
});

exports.getUserTrainingByTrainingId = catchAsync(async (req, res, next) => {
  const training = await instructorService.getUserTrainingByTrainingId(req);

  res.status(200).json({
    status: 'success',
    data: training,
  });
});

exports.deleteUserTraining = catchAsync(async (req, res, next) => {
  await instructorService.deleteUserTrainings(req);

  res.status(204).json({
    status: 'success',
    data: 'Treino deletado!',
  });
});

exports.getUserTypeTrainings = catchAsync(async (req, res, next) => {
  const typeTrainings = await instructorService.getAllTypeTrainings(req);

  res.status(200).json({
    status: 'success',
    results: typeTrainings.length,
    data: typeTrainings,
  });
});

exports.getUserStudents = catchAsync(async (req, res, next) => {
  const students = await instructorService.getUserStudents(req);

  res.status(200).json({
    status: 'success',
    results: students.length,
    data: students,
  });
});

exports.addTrainingToStudent = catchAsync(async (req, res, next) => {
  await instructorService.addTrainingToStudent(req);

  res.status(201).json({
    status: 'success',
    data: 'Treino atribuido ao aluno!',
  });
});

exports.getTrainingsByUserId = catchAsync(async (req, res, next) => {
  const trainings = await instructorService.getTrainingsByUserId(req);

  res.status(200).json({
    status: 'success',
    results: trainings.length,
    data: trainings,
  });
});

exports.addExercise = catchAsync(async (req, res, next) => {
  await instructorService.addExercise(req);

  res.status(201).json({
    status: 'success',
    data: 'Exercício criado!',
  });
});

exports.addExerciseToTraining = catchAsync(async (req, res, next) => {
  await instructorService.addExerciseToTraining(req);

  res.status(201).json({
    status: 'success',
    data: 'Exercício atribuido ao treino!',
  });
});
