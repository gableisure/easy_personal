import "dart:async";
import 'dart:convert';
import 'package:app_front/models/Student.dart';
import 'package:http/http.dart' as http;

class APIGetStudents {
  Future<Student> getAllStudents() async {
    String url = "10.0.2.2:3000";
    // String url = "easy-personal.herokuapp.com";
    String route = "/api/v1/usuarios/alunos/";

    final http.Response response = await http.get(Uri.http(url, route));

    if(response.statusCode == 200) {
      return Student.fromJson(json.decode(response.body));
    } else if(response.statusCode == 401){
      return Student.fromJson(json.decode(response.body));
    }
    return null;//throw Exception("Falha no carregamento dos dados!!!!");
  }
}