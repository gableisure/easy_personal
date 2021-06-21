const express = require('express');
const cookieParser = require('cookie-parser');
const path = require('path');
const userRouter = require('./routes/userRouter');
const instructorRouter = require('./routes/instructorRouter');
const AppError = require('./utils/AppError');
const globalErrorHandler = require('./controllers/errorController');

const app = express();

app.use(express.json({ limit: '10kb' }));
app.use(cookieParser());
app.use(express.static(__dirname));

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, '../frontend/app_front/lib/main.dart'));
});

app.use('/api/v1/usuarios', userRouter);
app.use('/api/v1/instructors', instructorRouter);

app.all('*', (req, res, next) =>
  next(new AppError(`A rota ${req.originalUrl} não existe!`))
);

app.use(globalErrorHandler);

module.exports = app;
