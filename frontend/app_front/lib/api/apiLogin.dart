import "dart:async";
import 'dart:convert';
import 'package:app_front/models/userLogin.dart';
import 'package:http/http.dart' as http;

class APILogin {
  Future<UserLogin> login(String email, String password) async {
    String url = "10.0.2.2:3000";

    final http.Response response = await http.post(Uri.http(url,"/api/v1/usuarios/login"),
        body: jsonEncode(<String, String>{
          "email": email,
          "password": password,
        }), headers: <String, String>{"content-type": "application/json; charset=UTF-8"});
    if(response.statusCode == 200) {
      print("${response.statusCode}");
      print("${response.body}");
      return UserLogin.fromJson(json.decode(response.body));
    } else if(response.statusCode == 401){
      print("${response.statusCode}");
      print("${response.body}");
      return UserLogin.fromJson(json.decode(response.body));
    }
    return null;//throw Exception("Falha no carregamento dos dados!!!!");
  }
}