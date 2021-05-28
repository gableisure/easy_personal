import '../helpers/globals.dart' as globals;

class Helpers {

  // Método para verificar se o usuario é um aluno
  bool isStudent(List users, String email) {
    var res;

    for (var i = 0; i < users.length; ++i) {
      if (users[i].vhr_email == email) {
        if (users[i].int_tipo == 0) {
          print("true");
          res = true;
        } else {
          print("false");
          res = false;
        }
      } else {
        if (!(i > users.length)) continue;
      }
    }

    return res;
  }

  // Método para verificar se o usuario é um professor
  bool isTeacher(List users, String email) {
    var res;

    for (var i = 0; i < users.length; ++i) {
      if (users[i].vhr_email == email) {
        if (users[i].int_tipo == 1) {
          print("true");
          res = true;
        } else {
          print("false");
          res = false;
        }
      } else {
        if (!(i > users.length)) continue;
      }
    }

    return res;
  }

  // Método que busca um professor por email e retorna um Map com os dados do professor
  Map getInstructorForEmail(List users, String email) {
    var usuario = {};
    for (var user in users) {
      if (user.vhr_email == email) {
        usuario['int_idausuario'] = user.int_idausuario;
        usuario['vhr_email'] = user.vhr_email;
        usuario['vhr_nome'] = user.vhr_nome;
        usuario['vhr_sobrenome'] = user.vhr_sobrenome;
        usuario['dtt_nascimento'] = user.dtt_nascimento;
        usuario['vhr_whatsapp'] = user.vhr_whatsapp;
        usuario['vhr_descricao'] = user.vhr_descricao;
        usuario['int_tipo'] = user.int_tipo;
        usuario['int_genero'] = user.int_genero;
        usuario['vhr_token'] = user.vhr_token;
        usuario['int_idfprofessor'] = user.int_idfprofessor;
        usuario['vhr_cref'] = user.vhr_cref;
        usuario['vhr_token'] = user.vhr_token;

        return usuario;
      }
    }
  }

  // Método que busca um aluno por email e retorna um Map com os dados do aluno
  Map getStudentsForEmail(List users, String email) {
    var usuario = {};
    for (var user in users) {
      if (user.vhr_email == email) {
        usuario['int_idausuario'] = user.int_idausuario;
        usuario['vhr_email'] = user.vhr_email;
        usuario['vhr_nome'] = user.vhr_nome;
        usuario['vhr_sobrenome'] = user.vhr_sobrenome;
        usuario['dtt_nascimento'] = user.dtt_nascimento;
        usuario['vhr_whatsapp'] = user.vhr_whatsapp;
        usuario['vhr_descricao'] = user.vhr_descricao;
        usuario['int_tipo'] = user.int_tipo;
        usuario['int_genero'] = user.int_genero;
        usuario['int_idfaluno'] = user.int_idfaluno;
        usuario['num_peso'] = user.num_peso;
        usuario['num_altura'] = user.num_altura;
        usuario['user_id'] = user.user_id;
        usuario['instructor_id'] = user.instructor_id;

        return usuario;
      }
    }
  }

  // Método que recebe um Map com os dados do professor
  void saveDataUserInstructor(Map instructorLogged) {
    globals.int_idausuario = instructorLogged['int_idausuario'];
    globals.vhr_email = instructorLogged['vhr_email'];
    globals.vhr_nome = instructorLogged['vhr_nome'];
    globals.vhr_sobrenome = instructorLogged['vhr_sobrenome'];
    globals.dtt_nascimento = instructorLogged['dtt_nascimento'];
    globals.vhr_whatsapp = instructorLogged['vhr_whatsapp'];
    globals.vhr_descricao = instructorLogged['vhr_descricao'];
    globals.int_tipo = instructorLogged['int_tipo'];
    globals.int_genero = instructorLogged['int_genero'];
    globals.vhr_token = instructorLogged['vhr_token'];
    globals.int_idfprofessor = instructorLogged['int_idfprofessor'];
    globals.vhr_cref = instructorLogged['vhr_cref'];
    globals.vhr_token = instructorLogged['vhr_token'];
  }

  // Método que recebe um Map com os dados do aluno
  void saveDataUserStudent(Map studentLogged) {
    globals.int_idausuario = studentLogged['int_idausuario'];
    globals.vhr_email = studentLogged['vhr_email'];
    globals.vhr_nome = studentLogged['vhr_nome'];
    globals.vhr_sobrenome = studentLogged['vhr_sobrenome'];
    globals.dtt_nascimento = studentLogged['dtt_nascimento'];
    globals.vhr_whatsapp = studentLogged['vhr_whatsapp'];
    globals.vhr_descricao = studentLogged['vhr_descricao'];
    globals.int_tipo = studentLogged['int_tipo'];
    globals.int_genero = studentLogged['int_genero'];
    globals.int_idfaluno = studentLogged['int_idfaluno'];
    globals.num_peso = studentLogged['num_peso'];
    globals.num_altura = studentLogged['num_altura'];
    globals.user_id = studentLogged['user_id'];
    globals.instructor_id = studentLogged['instructor_id'];
  }

  // Método que deleta todos os dados do usuário cadastrado (limpa as variáveis globais)
  void deleteDataUser() {
    globals.int_idausuario = 0;
    globals.vhr_email = "";
    globals.vhr_nome = "";
    globals.vhr_sobrenome = "";
    globals.dtt_nascimento = "";
    globals.vhr_whatsapp = "";
    globals.vhr_descricao = "";
    globals.int_tipo = 0;
    globals.int_genero = 0;
    globals.vhr_token = "";
    globals.int_idfprofessor = 0;
    globals.vhr_cref = "";
    globals.vhr_token = "";
    globals.int_idfaluno = 0;
    globals.num_peso = "";
    globals.num_altura = "";
    globals.user_id = 0;
    globals.instructor_id = 0;
  }

  // Método para atualizar parte dos dados do aluno
  void updateDataStudent(Map studentUpdate) {
    globals.vhr_sobrenome = studentUpdate['vhr_nome'];
    globals.vhr_sobrenome = studentUpdate['vhr_sobrenome'];
    globals.dtt_nascimento = studentUpdate['dtt_nascimento'];
    globals.vhr_whatsapp = studentUpdate['vhr_whatsapp'];
    globals.num_peso = studentUpdate['num_peso'];
    globals.num_altura = studentUpdate['num_altura'];
    globals.int_genero = studentUpdate['int_genero'];
    globals.vhr_descricao = studentUpdate['vhr_descricao'];
  }

  // Método para atualizar parte dos dados do aluno
  void updateDataTeacher(Map teacherUpdate) {
    globals.vhr_sobrenome = teacherUpdate['vhr_nome'];
    globals.vhr_sobrenome = teacherUpdate['vhr_sobrenome'];
    globals.dtt_nascimento = teacherUpdate['dtt_nascimento'];
    globals.vhr_whatsapp = teacherUpdate['vhr_whatsapp'];
    globals.vhr_cref = teacherUpdate['vhr_cref'];
    globals.int_genero = teacherUpdate['int_genero'];
    globals.vhr_descricao = teacherUpdate['vhr_descricao'];
  }

}