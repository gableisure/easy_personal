const db = require('../db');
// const AppError = require('../utils/AppError');

exports.addTypeTraining = async req => {
  await db.query(
    'INSERT INTO tbr_tipotreino (vhr_nome, vhr_descricao, user_id) VALUES ($1, $2, $3)',
    [req.body.vhr_nome, req.body.vhr_descricao, req.user.int_idausuario]
  );
};

exports.getUserTypeTrainings = async req => {
  const {
    rows: user,
  } = await db.query(
    'SELECT vhr_nome, vhr_descricao FROM tbr_tipotreino WHERE user_id = $1',
    [req.user.int_idausuario]
  );

  return user;
};
