import "dart:async";
import 'dart:convert';
import 'package:app_front/models/addExerciseToTraining.dart';
import 'package:http/http.dart' as http;
import 'package:app_front/helpers/globals.dart' as globals;

class APIAddExerciseToTraining {
  Future<AddExerciseToTraining> addExerciseToTraining(int int_idatreino, int int_idaexercicio) async {
    // String url = "10.0.2.2:3000";
    String url = "easy-personal.herokuapp.com";
    String route = "/api/v1/instructors/training/$int_idatreino/exercise/$int_idaexercicio";


    final http.Response response = await http.post(Uri.http(url, route),
        headers: <String, String>{
          "content-type": "application/json; charset=UTF-8",
          "Cookie": globals.rawCookie
        });
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("body: ${json.decode(response.body)}");
      return AddExerciseToTraining.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      print("body: ${json.decode(response.body)}");
      return AddExerciseToTraining.fromJson(json.decode(response.body));
    }
    return null; //throw Exception("Falha no carregamento dos dados!!!!");
  }
}