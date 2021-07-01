import "dart:async";
import 'dart:convert';
import 'package:app_front/models/TrainingStudent.dart';
import 'package:http/http.dart' as http;
import 'package:app_front/helpers/globals.dart' as globals;

class APIGetStudentTrainings {
  Future<TrainingStudent> getAllTrainings() async {
    // String url = "10.0.2.2:3000";
    String url = "easy-personal.herokuapp.com";
    String route = "/api/v1/usuarios/trainings/";

    final http.Response response = await http.get(Uri.http(url, route), headers: <String, String>{
      "content-type": "application/json; charset=UTF-8",
      "Cookie": globals.rawCookieStudent
    });

    if(response.statusCode == 200) {
      print("StatusCode: ${response.statusCode}");
      print("Body: ${response.body}");
      return TrainingStudent.fromJson(json.decode(response.body));
    } else if(response.statusCode == 401){
      print("StatusCode: ${response.statusCode}");
      // print("Body: ${response.body}");
      return TrainingStudent.fromJson(json.decode(response.body));
    }
    return null;//throw Exception("Falha no carregamento dos dados!!!!");
  }
}