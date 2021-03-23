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

exports.addUser = catchAsync(async (req, res, next) => {
  const a = await userServices.addUser(req);
});
