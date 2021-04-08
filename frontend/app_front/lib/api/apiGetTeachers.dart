import "dart:async";
import 'dart:convert';
import 'package:app_front/models/Student.dart';
import 'package:http/http.dart' as http;

class APIGetTeachers {
  Future<Student> getAllTeachers() async {
    String url = "10.0.2.2:3000";

    final http.Response response = await http.get(Uri.http(url,"/api/v1/usuarios/professores"));

    if(response.statusCode == 200) {
      print("${response.statusCode}");
      print("${response.body}");
      return Student.fromJson(json.decode(response.body));
    } else if(response.statusCode == 401){
      print("${response.statusCode}");
      print("${response.body}");
      return Student.fromJson(json.decode(response.body));
    }
    return null;//throw Exception("Falha no carregamento dos dados!!!!");
  }
}