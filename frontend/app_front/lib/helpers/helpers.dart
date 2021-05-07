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

  Map getInstructorForEmail(List users, String email) {
    // var usuario = {'usuario':'admin','senha':'admin123'};
    var usuario = {};
    for (var user in users) {
      if (user.vhr_email == email) {
        usuario['int_idfprofessor'] = user.int_idfprofessor;
        usuario['vhr_email'] = user.vhr_sobrenome;
        usuario['vhr_nome'] = user.vhr_nome;
        usuario['vhr_sobrenome'] = user.vhr_sobrenome;
        usuario['dtt_nascimento'] = user.dtt_nascimento;
        usuario['int_genero'] = user.int_genero;
        usuario['vhr_token'] = user.vhr_token;
        return usuario;
      }
    }
  }

  // TODO: Método em desenvolvimento
  void saveDataUser(String nome, String sobrenome, String token) {
    globals.vhr_nome = nome;
    globals.vhr_sobrenome = sobrenome;
    globals.vhr_token = token;
  }

  void deleteDataUser() {
    globals.vhr_nome = "";
    globals.vhr_sobrenome = "";
    globals.vhr_token = "";
  }
}