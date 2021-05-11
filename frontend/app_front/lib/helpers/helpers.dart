import '../helpers/globals.dart' as globals;

class Helpers {

  // Método para verificar se um usuario é aluno
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

  // Método para verificar se um usuario é professor
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

  // Método para buscar um instrutor no banco a partir do email
  // int getIntructorId(List users, String email) {
  //   for (var user in users) {
  //     if (user.vhr_email == email) {
  //       return user.int_idfprofessor;
  //     }
  //   }
  // }

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

  // Buscando aluno pelo email
  Map getStudentsForEmail(List users, String email) {
    var usuario = {};
    for (var user in users) {
      if (user.vhr_email == email) {
        usuario[' int_idfaluno'] = user.int_idfaluno;
        usuario['vhr_email'] = user.vhr_email;
        usuario['vhr_nome'] = user.vhr_nome;
        usuario['vhr_sobrenome'] = user.vhr_sobrenome;
        usuario['dtt_nascimento'] = user.dtt_nascimento;
        usuario['int_genero'] = user.int_genero;
        usuario['int_tipo'] = user.int_tipo;
        return usuario;
      }
    }
  }

  // TODO: Método em desenvolvimento
  // void saveDataUserInstructor(String nome, String sobrenome, String token, String email, int tipo) {
  //   globals.vhr_nome = nome;
  //   globals.vhr_sobrenome = sobrenome;
  //   globals.vhr_token = token;
  //   globals.vhr_email = email;
  //   globals.int_tipo = tipo;
  // }

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

  void saveDataUserStudent(String nome, String sobrenome, String email, int tipo) {
    globals.vhr_nome = nome;
    globals.vhr_sobrenome = sobrenome;
    globals.vhr_email = email;
    globals.int_tipo = tipo;

  }

  void deleteDataUser() {
    globals.vhr_nome = "";
    globals.vhr_sobrenome = "";
    globals.vhr_token = "";
  }
}