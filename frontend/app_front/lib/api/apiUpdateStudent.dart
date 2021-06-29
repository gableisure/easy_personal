import "dart:async";
import 'dart:convert';
import 'package:app_front/models/userForgotPassword.dart';
import 'package:http/http.dart' as http;

class APIUpdateStudent {
  Future<UserForgotPassword> updateStudent(Map user) async {
    // String url = "10.0.2.2:3000";
    String url = "easy-personal.herokuapp.com";

    final http.Response response = await http.patch(Uri.http(url,"/api/v1/usuarios/${user['int_idausuario']}"),
        body: jsonEncode(<String, dynamic>{
          "vhr_nome": user['vhr_nome'],
          "vhr_sobrenome": user['vhr_sobrenome'],
          "dtt_nascimento": user['dtt_nascimento'],
          "vhr_whatsapp": user['vhr_whatsapp'],
          "int_genero": user['int_genero'],
          "num_peso": user['num_peso'],
          "num_altura": user['num_altura'],
          "vhr_descricao": user['vhr_descricao'],
        }), headers: <String, String>{"content-type": "application/json; charset=UTF-8"});
    if(response.statusCode == 200 || response.statusCode == 204) {
      return UserForgotPassword.fromJson(json.decode(response.body));
    } else if(response.statusCode == 401) {
      return UserForgotPassword.fromJson(json.decode(response.body));
    }
    return null;
  }
}