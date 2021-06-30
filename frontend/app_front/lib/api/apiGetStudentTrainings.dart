import "dart:async";
import 'dart:convert';
import 'package:app_front/models/studentTraning.dart';
import 'package:http/http.dart' as http;
import 'package:app_front/helpers/globals.dart' as globals;

class APIGetStudentTrainings {
  Future<StudentTraining> getAllTrainings() async {
    // String url = "10.0.2.2:3000";
    String url = "easy-personal.herokuapp.com";
    String route = "/api/v1/usuarios/trainings/";

    final http.Response response = await http.get(Uri.http(url, route), headers: <String, String>{
      "content-type": "application/json; charset=UTF-8",
      "Cookie": globals.rawCookieStudent
    });

    if(response.statusCode == 200) {
      print("Deu certo");
      print(json.decode(response.body));
      return StudentTraining.fromJson(json.decode(response.body));
    } else if(response.statusCode == 401){
      print("Deu errado");
      print(json.decode(response.body));
      return StudentTraining.fromJson(json.decode(response.body));
    }
    print("Deu nada");
    return null;//throw Exception("Falha no carregamento dos dados!!!!");
  }
}