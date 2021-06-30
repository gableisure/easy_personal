import "dart:async";
import 'dart:convert';
import 'package:app_front/models/studentTraning.dart';
import 'package:http/http.dart' as http;

class APIGetStudentTrainings {
  Future<StudentTraining> getAllTrainings() async {
    // String url = "10.0.2.2:3000";
    String url = "easy-personal.herokuapp.com";
    String route = "/api/v1/usuarios/trainings/";

    final http.Response response = await http.get(Uri.http(url, route), headers: <String, String>{
      "content-type": "application/json; charset=UTF-8"
    });

    if(response.statusCode == 200) {
      print("Deu certo");
      return StudentTraining.fromJson(json.decode(response.body));
    } else if(response.statusCode == 401){
      print("Deu errado");
      return StudentTraining.fromJson(json.decode(response.body));
    }
    print("Deu nada");
    return null;//throw Exception("Falha no carregamento dos dados!!!!");
  }
}