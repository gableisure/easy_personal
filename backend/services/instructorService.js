const db = require('../db');
const AppError = require('../utils/AppError');

exports.addTraining = async req => {
  await db.query(
    `INSERT INTO tbl_treino (vhr_nome, dtt_inicio, dtt_fim, vhr_observacao, int_estaarquivado, int_idftipotreino, int_idfprofessor)
    VALUES ($1, $2, $3, $4, $5, $6, $7)`,
    [
      req.body.vhr_nome,
      req.body.dtt_inicio,
      req.body.dtt_fim,
      req.body.vhr_observacao,
      req.body.int_estaarquivado,
      req.body.int_idftipotreino,
      req.user.int_idausuario,
    ]
  );
};

exports.getUserTrainings = async req => {
  const { rows: trainings } = await db.query(
    `SELECT treino.*, tipotreino.vhr_nome as vhr_nome_tipo_treino, tipotreino.vhr_descricao
    FROM tbl_treino treino LEFT JOIN tbr_tipotreino tipotreino ON treino.int_idftipotreino = tipotreino.int_idatipotreino
    WHERE treino.int_idfprofessor = $1`,
    [req.user.int_idausuario]
  );

  return trainings;
};

exports.getUserTrainingByTrainingId = async req => {
  const { rows: training } = await db.query(
    `SELECT treino.*, tipotreino.vhr_nome as vhr_nome_tipo_treino, tipotreino.vhr_descricao
    FROM tbl_treino treino LEFT JOIN tbr_tipotreino tipotreino ON treino.int_idftipotreino = tipotreino.int_idatipotreino
    WHERE treino.int_idfprofessor = $1 AND treino.int_idatreino = $2`,
    [req.user.int_idausuario, req.params.trainingId]
  );

  return training;
};

exports.deleteUserTrainings = async req => {
  const {
    rowCount,
  } = await db.query(
    `DELETE FROM tbl_treino WHERE int_idatreino = $1 AND int_idfprofessor = $2`,
    [req.params.trainingId, req.user.int_idausuario]
  );

  if (!rowCount) {
    throw new AppError(
      'Este usuário não possui nenhum treino com este ID.',
      404
    );
  }
};

exports.getAllTypeTrainings = async req => {
  const { rows: typeTrainings } = await db.query(
    'SELECT vhr_nome, vhr_descricao FROM tbr_tipotreino',
    []
  );

  return typeTrainings;
};

exports.getUserStudents = async req => {
  const { rows: students } = await db.query(
    `SELECT * FROM user_instructors instructor LEFT JOIN tbl_usuario ON instructor.user_id = tbl_usuario.int_idausuario
     LEFT JOIN tbr_aluno ON instructor.user_id = tbr_aluno.int_idfaluno WHERE instructor.instructor_id = $1`,
    [req.user.int_idausuario]
  );

  return students;
};

exports.addTrainingToStudent = async req => {
  if (!req.body.id_aluno || !req.params.trainingId)
    throw new AppError('ID do aluno ou do treino inválido.', 400);

  // Identificar se treino pertence a este professor.
  const {
    rowCount,
  } = await db.query(
    `SELECT * FROM tbl_treino WHERE int_idatreino = $1 AND int_idfprofessor = $2`,
    [req.params.trainingId, req.user.int_idausuario]
  );

  if (!rowCount)
    throw new AppError('Escolha um treino que foi criado por você.', 403);

  // Identificar se aluno pertence a este professor.
  const {
    rowCount: isValidStudent,
  } = await db.query(
    `SELECT * FROM user_instructors WHERE user_id = $1 AND instructor_id = $2`,
    [req.body.id_aluno, req.user.int_idausuario]
  );

  if (!isValidStudent)
    throw new AppError('Este usuário não é seu estudante.', 403);

  await db.query(
    `INSERT INTO tbl_alunotreino (int_idfaluno, int_idftreino) VALUES ($1, $2)`,
    [req.body.id_aluno, req.params.trainingId]
  );
};

exports.getTrainingsByUserId = async req => {
  // Verificar se treino foi feito por este professor.
  // const {
  //   rowCount,
  // } = await db.query(
  //   `SELECT * FROM tbl_treino WHERE int_idfprofessor = $1 AND int_idatreino = $2`,
  //   [req.user.int_idausuario, req.body.trainingID]
  // );

  // Pegar apenas os treinos do usuário que foram feitos por ESTE professor.
  const { rows: trainings } = await db.query(
    `SELECT * FROM tbl_alunotreino 
    LEFT JOIN tbl_treino ON tbl_treino.int_idatreino = tbl_alunotreino.int_idftreino 
    WHERE tbl_alunotreino.int_idfaluno = $1 AND tbl_treino.int_idfprofessor = $2`,
    [req.params.userId, req.user.int_idausuario]
  );

  for (let training of trainings) {
    const { rows } = await db.query(
      `SELECT exercicio.* FROM tbl_treinoexercicio treinoexercicio
      LEFT JOIN tbl_exercicio exercicio ON exercicio.int_idaexercicio = treinoexercicio.int_idfexercicio 
      WHERE treinoexercicio.int_idftreino = $1`,
      [training.int_idatreino]
    );

    training['exercises'] = rows;
  }

  return trainings;
};

exports.addExercise = async req => {
  const {
    vhr_nome: vhrNome,
    int_intervalor: intIntervalor,
    vhr_seriesrepeticoes: vhrSeriesrepeticoes,
    int_idfcategoria: intIdfcategoria,
  } = req.body;

  await db.query(
    `INSERT INTO tbl_exercicio (vhr_nome, int_intervalor, vhr_seriesrepeticoes, int_idfcategoria, int_idfprofessor)
  VALUES ($1, $2, $3, $4, $5)`,
    [
      vhrNome,
      intIntervalor,
      vhrSeriesrepeticoes,
      intIdfcategoria,
      req.user.int_idausuario,
    ]
  );
};

exports.addExerciseToTraining = async req => {
  // Identificar se treino pertence a este professor.
  const {
    rowCount,
  } = await db.query(
    `SELECT * FROM tbl_treino WHERE int_idatreino = $1 AND int_idfprofessor = $2`,
    [req.params.trainingId, req.user.int_idausuario]
  );

  if (!rowCount)
    throw new AppError('Escolha um treino que foi criado por você.', 403);

  // Identificar se exercicio pertence a este professor.
  const {
    rowCount: isValidExercise,
  } = await db.query(
    `SELECT * FROM tbl_exercicio WHERE int_idaexercicio = $1 AND int_idfprofessor = $2`,
    [req.params.exerciseId, req.user.int_idausuario]
  );

  if (!isValidExercise)
    throw new AppError('Escolha um exercício que foi criado por você.', 403);

  await db.query(
    `INSERT INTO tbl_treinoexercicio (int_idfexercicio, int_idftreino) VALUES ($1, $2)`,
    [req.params.exerciseId, req.params.trainingId]
  );
};

exports.getExercises = async req => {
  const { rows } = await db.query(
    `SELECT exercicio.*, categoria.vhr_nome as nome_categoria, categoria.vhr_descricao 
    FROM tbl_exercicio exercicio INNER JOIN tbr_categoria categoria ON categoria.int_idacategoria = exercicio.int_idfcategoria 
    WHERE exercicio.int_idfprofessor = $1`,
    [req.user.int_idausuario]
  );

  return rows;
};

exports.deleteUserExercises = async req => {
  const {
    rowCount,
  } = await db.query(
    `DELETE FROM tbl_exercicio WHERE int_idaexercicio = $1 AND int_idfprofessor = $2`,
    [req.params.exerciseId, req.user.int_idausuario]
  );

  if (!rowCount) {
    throw new AppError(
      'Este usuário não possui nenhum exercício com este ID.',
      404
    );
  }
};
