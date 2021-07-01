import "dart:async";
import 'dart:convert';
import 'package:app_front/models/StatusData.dart';
import 'package:http/http.dart' as http;
import 'package:app_front/helpers/globals.dart' as globals;

class APIAddTrainingToStudent {
  Future<StatusData> addTrainingToStudent(int idTraining, int idStudent) async {
    // String url = "10.0.2.2:3000";
    String url = "easy-personal.herokuapp.com";
    String route = "/api/v1/instructors/students/training/$idTraining";


    final http.Response response = await http.post(Uri.http(url, route),
        body: jsonEncode(<String, dynamic>{
          "id_aluno": idStudent
        }),
        headers: <String, String>{
          "content-type": "application/json; charset=UTF-8",
          "Cookie": globals.rawCookie
        });
    if (response.statusCode == 200 || response.statusCode == 201) {
      return StatusData.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      return StatusData.fromJson(json.decode(response.body));
    }
    return null; //throw Exception("Falha no carregamento dos dados!!!!");
  }
}