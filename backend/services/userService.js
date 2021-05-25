const bcrypt = require('bcryptjs');
const crypto = require('crypto');
const db = require('../db');
const AppError = require('../utils/AppError');

const filterObj = (obj, ...allowedArgs) => {
  const newObj = {};

  Object.keys(obj).forEach(key => {
    if (allowedArgs.includes(key)) {
      newObj[key] = obj[key];
    }
  });

  return newObj;
};

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
    LEFT JOIN user_instructors 
    ON user_instructors.user_id = tbl_usuario.int_idausuario
    LEFT JOIN tbr_professor 
    ON tbr_professor.int_idfprofessor = tbl_usuario.int_idausuario
    WHERE tbl_usuario.int_idausuario = $1;`,
    [req.params.id]
  );

  if (!user[0]) throw new AppError('Usuário não existe.', 404);

  Object.entries(user[0]).forEach(([key, value]) => {
    if (value === null) delete user[0][key];
  });

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
};

exports.deleteUser = async req => {
  const {
    rowCount,
  } = await db.query(`DELETE FROM tbl_usuario WHERE int_idausuario = $1`, [
    req.params.id,
  ]);

  if (!rowCount) throw new AppError('Usuário não existe.', 404);
};

exports.updateUser = async req => {
  const fields = [req.params.id];
  const str = [];

  const filteredUser = filterObj(
    req.body,
    'vhr_nome',
    'vhr_sobrenome',
    'dtt_nascimento',
    'int_genero',
    'vhr_whatsapp',
    'vhr_descricao'
  );

  // Editar valores do usuario.
  if (Object.keys(filteredUser).length >= 0) {
    Object.entries(filteredUser).forEach(([key, value], i) => {
      fields.push(value);
      str.push(`${key} = $${i + 2}`);
    });

    const { rowCount } = await db.query(
      `UPDATE tbl_usuario SET ${str} WHERE int_idausuario = $1`,
      fields
    );

    if (!rowCount) throw new AppError('Usuário não existe.', 404);
  }

  // Editando dados do estudante
  const userInfo = await this.getUser(req);
  if ((req.body.num_peso || req.body.num_altura) && userInfo.int_tipo === 0) {
    const studentObj = filterObj(req.body, 'num_peso', 'num_altura');
    const studentFields = [req.params.id];
    const studentStr = [];

    Object.entries(studentObj).forEach(([key, value], i) => {
      studentFields.push(value);
      studentStr.push(`${key} = $${i + 2}`);
    });

    await db.query(
      `UPDATE tbr_aluno SET ${studentStr} WHERE int_idfaluno = $1`,
      studentFields
    );
  }
};
