const crypto = require('crypto');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const { promisify } = require('util');
const AppError = require('../utils/AppError');
const db = require('../db');
const sendEmail = require('../utils/email');

const signToken = userId =>
  jwt.sign({ userId }, process.env.JWT_TOKEN, {
    expiresIn: process.env.JWT_EXPIRES_IN,
  });

const createSendToken = (userId, res) => {
  const token = signToken(userId);

  const cookieOptions = {
    expires: new Date(
      Date.now() + process.env.JWT_COOKIE_EXPIRES_IN * 24 * 60 * 60 * 1000
    ),
    httpOnly: true,
  };

  if (process.env.NODE_ENV === 'production') cookieOptions.secure = true;

  res.cookie('jwt', token, cookieOptions);

  return token;
};
const comparePassword = async (requestPass, userPass) =>
  await bcrypt.compare(requestPass, userPass);

exports.protect = async req => {
  let token;

  if (
    req.headers.authorization &&
    req.headers.authorization.startsWith('Bearer')
  ) {
    token = req.headers.authorization.split(' ')[1];
  } else if (req.cookies.jwt) {
    token = req.cookies.jwt;
  }

  if (!token) {
    throw new AppError(
      'Você não está logado! Por favor, entre na sua conta para ter acesso.',
      401
    );
  }
  // Verification token
  const decoded = await promisify(jwt.verify)(token, process.env.JWT_TOKEN);

  const {
    rows: user,
  } = await db.query(`SELECT * FROM tbl_usuario WHERE int_idausuario = $1`, [
    decoded.userId,
  ]);

  if (!user[0]) {
    throw new AppError('Não existe nenhum usuário com este token.', 401);
  }

  return user[0];
};

exports.getUserType = async req => req.user.int_tipo;

exports.signup = async (req, res) => {
  // NÃO PERMITIR REPETIÇÃO DE TOKEN DE PROFESSOR.
  let validUser = false;
  let validInstructor;

  if (req.body.int_tipo === 0) {
    // Verificar se token do professor existe.
    if (!req.body.token_professor)
      throw new AppError(
        'Você precisa usar o token de um professor válido.',
        400
      );

    const {
      rows: instructors,
    } = await db.query(
      'SELECT int_idfprofessor FROM tbr_professor WHERE vhr_token = $1',
      [req.body.token_professor]
    );

    if (!instructors[0]) {
      throw new AppError('Token de professor inválido.', 400);
    }

    validInstructor = instructors[0];
    validUser = true;
  }

  // Verificar se senha e confirmação de senha são iguais.
  if (req.body.vhr_senha !== req.body.passwordConfirm)
    throw new AppError('As senhas precisam ser iguais.', 400);

  // Verificar tipo de usuário.
  if (req.body.int_tipo !== 0 && req.body.int_tipo !== 1)
    throw new AppError('Tipo de usuário inválido.', 400);

  // Gerar hash de senha.
  const password = await bcrypt.hash(req.body.vhr_senha, 12);

  // Inserir usuário.
  const { rows: createdUser } = await db.query(
    `
    INSERT INTO tbl_usuario (vhr_email, vhr_senha, vhr_nome, vhr_sobrenome, dtt_nascimento, int_genero, vhr_whatsapp, int_tipo, vhr_descricao)
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9) RETURNING int_idausuario;`,
    [
      req.body.vhr_email,
      password,
      req.body.vhr_nome,
      req.body.vhr_sobrenome,
      req.body.dtt_nascimento,
      req.body.int_genero,
      req.body.vhr_whatsapp,
      req.body.int_tipo,
      req.body.vhr_descricao,
    ]
  );

  if (req.body.int_tipo === 0) {
    await db.query(
      `
      INSERT INTO tbr_aluno (int_idfaluno, num_peso, num_altura)
      VALUES ($1, $2, $3);`,
      [createdUser[0].int_idausuario, req.body.num_peso, req.body.num_altura]
    );

    if (validUser) {
      await db.query(
        'INSERT INTO user_instructors (user_id, instructor_id) VALUES ($1, $2)',
        [createdUser[0].int_idausuario, validInstructor.int_idfprofessor]
      );
    }
  }

  if (req.body.int_tipo === 1) {
    const token = crypto.randomBytes(6).toString('hex');

    await db.query(
      `
      INSERT INTO tbr_professor (int_idfprofessor, vhr_cref, vhr_token)
      VALUES ($1, $2, $3);`,
      [createdUser[0].int_idausuario, req.body.vhr_cref, token]
    );
  }

  return createSendToken(createdUser[0].int_idausuario, res);
};

exports.login = async (req, res) => {
  const { email, password } = req.body;

  if (!email || !password) {
    throw new AppError('Por favor, digite seu email e sua senha.', 400);
  }

  const {
    rows: user,
  } = await db.query(
    `SELECT int_idausuario, vhr_email, vhr_senha FROM tbl_usuario WHERE vhr_email = $1`,
    [email]
  );

  if (!user[0] || !(await comparePassword(password, user[0].vhr_senha)))
    throw new AppError('Email ou senha incorreta.', 401);

  return createSendToken(user[0].int_idausuario, res);
};

exports.forgotPassword = async req => {
  const { email } = req.body;

  if (!email) throw new AppError('Por favor, digite seu email.', 400);

  const {
    rows: user,
  } = await db.query(
    `SELECT int_idausuario, vhr_email, vhr_senha FROM tbl_usuario WHERE vhr_email = $1`,
    [email]
  );

  if (!user[0]) throw new AppError('Não existe uma conta com este email!', 404);

  // Criando token para mandar para resetar senha.
  // esse token será enviado pro email do usuário.
  const resetToken = crypto.randomBytes(32).toString('hex');

  // Encryptar o token gerado para ser guardado no banco de dados.
  const encryptResetToken = crypto
    .createHash('sha256')
    .update(resetToken)
    .digest('hex');

  const passwordResetExpires = Date.now() + 10 * 60 * 1000;

  await db.query(
    'INSERT INTO resetpasswordtokens (user_id, token, expiresin) VALUES ($1, $2, $3)',
    [user[0].int_idausuario, encryptResetToken, passwordResetExpires]
  );

  // Mandar email.
  const resetURL = `${req.protocol}://${req.get(
    'host'
  )}/api/v1/usuarios/resetPassword/${resetToken}`;

  const message = `Perdeu sua senha? Aqui está a solução: ${resetURL}`;

  try {
    sendEmail({
      email: user[0].vhr_email,
      subject: 'Token de recuperação de senha (válido por 10 min).',
      message: message,
    });
  } catch (err) {
    await db.query(
      'DELETE FROM resetpasswordtokens WHERE user_id = $1',
      user[0].int_idausuario
    );
  }
};

exports.resetPassword = async (req, res) => {
  // VER PROBLEMA DO TRY CATCH SENDEMAIL
  const { token } = req.params;
  const { password, passwordConfirm } = req.body;

  const hashedToken = crypto.createHash('sha256').update(token).digest('hex');

  const {
    rows: user,
  } = await db.query(
    'SELECT user_id, expiresin FROM resetpasswordtokens WHERE token = $1',
    [hashedToken]
  );

  // Indetificar se token existe e se ainda é válido.
  if (!user[0] || Date.now() > user[0].expiresin)
    throw new AppError('Token inválido ou expirado!', 400);

  if (!password || !passwordConfirm)
    throw new AppError('Preencha todos os campos.', 400);

  if (password !== passwordConfirm)
    throw new AppError('As senhas precisam ser iguais.', 400);

  // Gerar hash de senha.
  const hashedPassword = await bcrypt.hash(password, 12);

  await db.query(
    'UPDATE tbl_usuario SET vhr_senha = $1, changedpasswordat = $2 WHERE int_idausuario = $3',
    [hashedPassword, Date.now(), user[0].user_id]
  );

  await db.query('DELETE FROM resetpasswordtokens WHERE user_id = $1', [
    user[0].user_id,
  ]);

  return createSendToken(user[0].user_id, res);
};
