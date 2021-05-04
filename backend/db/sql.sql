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