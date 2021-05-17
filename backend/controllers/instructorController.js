const catchAsync = require('../utils/catchAsync');
const instructorService = require('../services/instructorService');

exports.addTypeTraining = catchAsync(async (req, res, next) => {
  await instructorService.addTypeTraining(req);

  res.status(201).json({
    status: 'success',
    data: 'Tipo de treino criado!',
  });
});

exports.getUserTypeTrainings = catchAsync(async (req, res, next) => {
  const userTypeTrainings = await instructorService.getUserTypeTrainings(req);

  res.status(200).json({
    status: 'success',
    data: userTypeTrainings,
  });
});
