import "dart:async";
import 'dart:convert';
import 'package:app_front/models/userForgotPassword.dart';
import 'package:http/http.dart' as http;

class APIPassword {
  Future<UserForgotPassword> forgotPassword(String email) async {
    String url = "10.0.2.2:3000";
    //String url = "easy-personal.herokuapp.com";
    String route = "/api/v1/usuarios/forgotPassword/api/v1/usuarios/forgotPassword";

    final http.Response response = await http.post(Uri.http(url, route),
        body: jsonEncode(<String, String>{
          "email": email,
        }), headers: <String, String>{"content-type": "application/json; charset=UTF-8"});
    if(response.statusCode == 200) {
      return UserForgotPassword.fromJson(json.decode(response.body));
    } else if(response.statusCode == 404) {
      return UserForgotPassword.fromJson(json.decode(response.body));
    }
    return null;//throw Exception("Falha no carregamento dos dados!!!!");
  }
}