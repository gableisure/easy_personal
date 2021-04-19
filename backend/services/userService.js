const bcrypt = require('bcryptjs');
const crypto = require('crypto');
const db = require('../db');
const AppError = require('../utils/AppError');

exports.gelAllUsers = async () => {
  const { rows: users } = await db.query('SELECT * FROM tbl_usuario');

  return users;
};

exports.getAllStudents = async () => {
  const { rows: users } = await db.query(
    `SELECT * FROM tbl_usuario 
    INNER JOIN tbr_aluno 
    ON tbr_aluno.int_idfaluno = tbl_usuario.int_idausuario
    INNER JOIN user_instructors 
    ON user_instructors.user_id = tbl_usuario.int_idausuario;`
  );

  return users;
};

exports.getAllInstructors = async () => {
  const { rows: users } = await db.query(
    `SELECT * FROM tbl_usuario 
    INNER JOIN tbr_professor 
    ON tbr_professor.int_idfprofessor = tbl_usuario.int_idausuario;`
  );

  return users;
};

exports.getUser = async req => {
  const { rows: user } = await db.query(
    `SELECT * FROM tbl_usuario 
    LEFT JOIN tbr_aluno 
    ON tbr_aluno.int_idfaluno = tbl_usuario.int_idausuario
    INNER JOIN user_instructors 
    ON user_instructors.user_id = tbl_usuario.int_idausuario
    LEFT JOIN tbr_professor 
    ON tbr_professor.int_idfprofessor = tbl_usuario.int_idausuario
    AND tbl_usuario.int_idausuario = $1;`,
    [req.params.id]
  );

  Object.entries(user[0]).forEach(([key, value]) => {
    if (value === null) delete user[0][key];
  });

  console.log(user[0]);

  return user[0];
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
};
