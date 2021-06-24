import "dart:async";
import 'dart:convert';
import 'package:app_front/models/Teacher.dart';
import 'package:http/http.dart' as http;

class APIGetTeachers {
  Future<Teacher> getAllTeachers() async {
    String url = "10.0.2.2:3000";
    // String url = "easy-personal.herokuapp.com";
    String route = "/api/v1/usuarios/professores";

    final http.Response response = await http.get(Uri.http(url, route));

    if(response.statusCode == 200) {
      return Teacher.fromJson(json.decode(response.body));
    } else if(response.statusCode == 401){
      return Teacher.fromJson(json.decode(response.body));
    }
    return null;//throw Exception("Falha no carregamento dos dados!!!!");
  }
}