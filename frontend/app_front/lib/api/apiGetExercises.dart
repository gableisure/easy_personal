import "dart:async";
import 'dart:convert';
import 'package:app_front/models/Exercise.dart';
import 'package:http/http.dart' as http;
import 'package:app_front/helpers/globals.dart' as globals;

class APIGetExercises {
  Future<Exercise> getAllExercises() async {
    // String url = "10.0.2.2:3000";
    String url = "easy-personal.herokuapp.com";
    String route = "/api/v1/instructors/exercise";

    final http.Response response = await http.get(Uri.http(url, route), headers: <String, String>{
      "content-type": "application/json; charset=UTF-8",
      "Cookie": globals.rawCookie
    });

    if(response.statusCode == 200) {
      return Exercise.fromJson(json.decode(response.body));
    } else if(response.statusCode == 401){
      return Exercise.fromJson(json.decode(response.body));
    }
    return null;//throw Exception("Falha no carregamento dos dados!!!!");
  }
}