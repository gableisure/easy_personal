const userServices = require('../services/userService');
const catchAsync = require('../utils/catchAsync');

exports.getAllUsers = catchAsync(async (req, res, next) => {
  const users = await userServices.gelAllUsers();

  res.status(200).json({
    status: 'success',
    results: users.length,
    data: [users],
  });
});

exports.getAllStudents = catchAsync(async (req, res, next) => {
  const users = await userServices.getAllStudents();

  res.status(200).json({
    status: 'success',
    results: users.length,
    data: [users],
  });
});

exports.getAllInstructors = catchAsync(async (req, res, next) => {
  const users = await userServices.getAllInstructors();

  res.status(200).json({
    status: 'success',
    results: users.length,
    data: [users],
  });
});

exports.getUser = catchAsync(async (req, res, next) => {
  const user = await userServices.getUser(req);

  res.status(200).json({
    status: 'success',
    data: user,
  });
});

exports.addUser = catchAsync(async (req, res, next) => {
  await userServices.addUser(req);

  res.status(201).json({
    status: 'success',
    data: 'Usuário criado!',
  });
});

exports.deleteUser = catchAsync(async (req, res, next) => {
  await userServices.deleteUser(req);

  res.status(204).json({
    status: 'success',
    data: 'Usuário deletado!',
  });
});

exports.updateUser = catchAsync(async (req, res, next) => {
  await userServices.updateUser(req);

  res.status(200).json({
    status: 'success',
    data: 'Usuário editado!',
  });
});
