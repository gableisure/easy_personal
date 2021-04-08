class Helpers {

  bool isStudent(List users, String email) {
    for(var user in users) {
      if(user.vhr_email == email) {
        if(user.int_tipo == 0) return true;
        else return false;
      }else{
        return false;
      }
    }
  }

  bool isTeacher(List users, String email) {
    for(var user in users) {
      if(user.vhr_email == email) {
        if(user.int_tipo == 1) return true;
        else return false;
      }else{
        return false;
      }
    }
  }

}