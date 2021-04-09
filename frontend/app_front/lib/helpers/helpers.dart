class Helpers {

  bool isStudent(List users, String email) {
    var res;

    for(var i = 0; i < users.length; ++i) {
      if(users[i].vhr_email == email) {
        if(users[i].int_tipo == 0) {
          print("true");
          res = true;
        }else{
          print("false");
          res = false;
        }
      }else{
        if(!(i > users.length)) continue;
      }
    }
    return res;
  }

  // bool isTeacher(List users, String email) {
  //   var res;
  //
  //   for(var i = 0; i < users.length; ++i) {
  //     if(users[i].vhr_email == email) {
  //       if(users[i].int_tipo == 1) {
  //         print("true");
  //         res = true;
  //       }else{
  //         print("false");
  //         res = false;
  //       }
  //     }else{
  //       if(!(i > users.length)) continue;
  //     }
  //   }
  //   return res;
  // }


  String getTokenTeacher(List users, String email) {
    String token;
    for (var user in users) {
      if (user.vhr_email == email) {
        return user.vhr_token;
      }
    }
  }

}