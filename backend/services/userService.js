const db = require('../db');
const bcrypt = require('bcrypt');
const AppError = require('../utils/AppError');

exports.gelAllUsers = async () => {
  const { rows: users } = await db.query('SELECT * FROM tbl_usuario');

  return users;
};

exports.addUser = async req => {
  // Verificar se senha e confirmação de senha são iguais.
  if (req.body.vhr_senha !== req.body.confirmSenha)
    throw new AppError('As senhas precisam ser iguais.', 400);

  // Verificar tipo de usuário.
  if (req.body.int_tipo !== 0 && req.body.int_tipo !== 1)
    throw new AppError('Tipo de usuário inválido.', 400);

  // Gerar hash de senha.
  const password = await bcrypt.hash(req.body.vhr_senha, 12);

  // Inserir usuário.
  const { rowCount: createdUser } = await db.query(
    `
    INSERT INTO tbl_usuario (vhr_email, vhr_senha, vhr_nome, vhr_sobrenome, dtt_nascimento, int_genero, vhr_whatsapp, int_tipo)
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING int_idausuario`,
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

  if (!createdUser) throw new AppError('Não foi possível criar usuário.', 500);
};
