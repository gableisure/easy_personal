const crypto = require('crypto');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const AppError = require('../utils/AppError');
const db = require('../db');

const signToken = id =>
  jwt.sign({ id }, process.env.JWT_TOKEN, {
    expiresIn: process.env.JWT_EXPIRES_IN,
  });

const comparePassword = async (requestPass, userPass) =>
  await bcrypt.compare(requestPass, userPass);

exports.signup = async req => {
  // Verificar se senha e confirmação de senha são iguais.
  if (req.body.vhr_senha !== req.body.confirmSenha)
    throw new AppError('As senhas precisam ser iguais.', 400);

  // Verificar tipo de usuário.
  if (req.body.int_tipo !== 0 && req.body.int_tipo !== 1)
    throw new AppError('Tipo de usuário inválido.', 400);

  // Gerar hash de senha.
  const password = await bcrypt.hash(req.body.vhr_senha, 12);

  // Inserir usuário.
  const { rows: createdUser } = await db.query(
    `
    INSERT INTO tbl_usuario (vhr_email, vhr_senha, vhr_nome, vhr_sobrenome, dtt_nascimento, int_genero, vhr_whatsapp, int_tipo)
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING int_idausuario;`,
    [
      req.body.vhr_email,
      password,
      req.body.vhr_nome,
      req.body.vhr_sobrenome,
      req.body.dtt_nascimento,
      req.body.int_genero,
      req.body.vhr_whatsapp,
      req.body.int_tipo,
    ]
  );

  if (req.body.int_tipo === 0) {
    await db.query(
      `
      INSERT INTO tbr_aluno (int_idfaluno, vhr_descricao, num_peso, num_altura)
      VALUES ($1, $2, $3, $4);`,
      [
        createdUser[0].int_idausuario,
        req.body.vhr_descricao,
        req.body.num_peso,
        req.body.num_altura,
      ]
    );
  }

  if (req.body.int_tipo === 1) {
    const token = crypto.randomBytes(6).toString('hex');

    await db.query(
      `
      INSERT INTO tbr_professor (int_idfprofessor, vhr_cref, vhr_token, vhr_descricao)
      VALUES ($1, $2, $3, $4);`,
      [
        createdUser[0].int_idausuario,
        req.body.vhr_cref,
        token,
        req.body.vhr_descricao,
      ]
    );
  }

  const webToken = signToken(createdUser[0].int_idausuario);

  return webToken;
};

exports.login = async req => {
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
    throw new AppError('Email ou senha incorreta.', 400);

  const webtoken = signToken(user[0].int_idausuario);

  return webtoken;
};
