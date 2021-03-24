const authService = require('../services/authService');
const catchAsync = require('../utils/catchAsync');

exports.signup = catchAsync(async (req, res, next) => {
  const token = await authService.signup(req);

  res.status(201).json({
    status: 'success',
    data: 'Usuário criado!',
    token,
  });
});

exports.login = catchAsync(async (req, res, next) => {
  const token = await authService.login(req);

  res.status(200).json({
    status: 'success',
    data: 'User login',
    token,
  });
});
