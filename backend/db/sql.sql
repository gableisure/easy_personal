CREATE TABLE tbl_usuario (
  int_idausuario SERIAL PRIMARY KEY NOT NULL,
  vhr_email VARCHAR(30) NOT NULL UNIQUE,
  vhr_senha VARCHAR(60) NOT NULL,
  vhr_nome VARCHAR(20) NOT NULL,
  vhr_sobrenome VARCHAR(20) NOT NULL,
  dtt_nascimento VARCHAR(20) NOT NULL,
  int_genero INT NOT NULL,
  vhr_whatsapp VARCHAR(20) NOT NULL,
  int_tipo INT NOT NULL,
  changedpasswordat BIGINT DEFAULT NULL,
  vhr_descricao VARCHAR(120) DEFAULT NULL
);

CREATE TABLE tbr_aluno (
  int_idfaluno INT NOT NULL UNIQUE,
  num_peso DECIMAL NOT NULL,
  num_altura DECIMAL NOT NULL,
  FOREIGN KEY (int_idfaluno)
    REFERENCES tbl_usuario (int_idausuario)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE tbr_professor (
  int_idfprofessor INT NOT NULL UNIQUE,
  vhr_cref VARCHAR(20) NOT NULL,
  vhr_token VARCHAR(12) NOT NULL,
  FOREIGN KEY (int_idfprofessor)
    REFERENCES tbl_usuario (int_idausuario)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE resetpasswordtokens (
  user_id INT NOT NULL,
  token TEXT NOT NULL,
  expiresin BIGINT NOT NULL,
  FOREIGN KEY(user_id)
    REFERENCES tbl_usuario (int_idausuario)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE user_instructors (
  user_id INT NOT NULL,
  instructor_id INT NOT NULL,
  FOREIGN KEY(user_id)
    REFERENCES tbr_aluno (int_idfaluno),
  FOREIGN KEY(instructor_id)
    REFERENCES tbr_professor (int_idfprofessor)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE tbl_treino (
  int_idatreino SERIAL PRIMARY KEY NOT NULL,
  vhr_nome VARCHAR(80) NOT NULL,
  dtt_inicio DATE NOT NULL,
  dtt_fim DATE NOT NULL,
  vhr_observacao TEXT,
  int_estaarquivado INT DEFAULT 0 NOT NULL,
  int_idftipotreino INT NOT NULL,
  int_idfprofessor INT NOT NULL,
  FOREIGN KEY(int_idftipotreino)
    REFERENCES tbr_tipotreino (int_idatipotreino)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY(int_idfprofessor)
    REFERENCES tbl_usuario (int_idausuario)
    ON UPDATE CASCADE
    ON DELETE CASCADE 
);

CREATE TABLE tbr_tipotreino (
  int_idatipotreino SERIAL PRIMARY KEY NOT NULL,
  vhr_nome VARCHAR(14) NOT NULL,
  vhr_descricao VARCHAR(54) NOT NULL 
);

CREATE TABLE tbr_categoria (
  int_idacategoria SERIAL PRIMARY KEY NOT NULL,
  vhr_nome VARCHAR(30) NOT NULL,
  vhr_descricao VARCHAR(200) NOT NULL
);

CREATE TABLE tbl_exercicio (
  int_idaexercicio SERIAL PRIMARY KEY NOT NULL,
  vhr_nome VARCHAR(100) NOT NULL,
  int_intervalor INT NOT NULL,
  vhr_seriesrepeticoes VARCHAR(5) NOT NULL,
  int_idfcategoria INT NOT NULL,
  int_idfprofessor INT NOT NULL,
  FOREIGN KEY(int_idfcategoria)
    REFERENCES tbr_categoria (int_idacategoria)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY(int_idfprofessor)
    REFERENCES tbl_usuario (int_idausuario)
    ON UPDATE CASCADE
    ON DELETE CASCADE 
);

CREATE TABLE tbl_treinoexercicio (
  int_idatreinoexercicio SERIAL PRIMARY KEY NOT NULL,
  int_idfexercicio INT NOT NULL,
  int_idftreino INT NOT NULL,
  FOREIGN KEY(int_idfexercicio)
    REFERENCES tbl_exercicio (int_idaexercicio)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY(int_idftreino)
    REFERENCES tbl_treino (int_idatreino)
    ON UPDATE CASCADE
    ON DELETE CASCADE 
);

CREATE TABLE tbl_alunotreino (
  int_idfaluno INT NOT NULL,
  int_idftreino INT NOT NULL,
  int_estaemvigor INT NOT NULL DEFAULT 0,
  FOREIGN KEY(int_idfaluno)
    REFERENCES  tbr_aluno (int_idfaluno)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY(int_idftreino)
    REFERENCES tbl_treino (int_idatreino)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

