const express = require('express');
const morgan = require('morgan');
const userRouter = require('./routes/userRouter');
const AppError = require('./utils/AppError');
const globalErrorHandler = require('./controllers/errorController');

const app = express();

app.use(express.json());

if (process.env.NODE_ENV === 'development') app.use(morgan('dev'));

app.use('/api/v1/usuarios', userRouter);

app.all('*', (req, res, next) =>
  next(new AppError(`A rota ${req.originalUrl} não existe!`))
);

app.use(globalErrorHandler);

module.exports = app;
