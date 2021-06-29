import "dart:async";
import 'dart:convert';
import 'package:app_front/models/deleteExercise.dart';
import 'package:http/http.dart' as http;
import 'package:app_front/helpers/globals.dart' as globals;

class APIDeleteExercise {
  Future<DeleteExercise> deleteExercise() async {
    String url = "10.0.2.2:3000";
    //String url = "easy-personal.herokuapp.com";
    String route = "/api/v1/instructors/exercise/47";

    final http.Response response = await http.delete(Uri.https(url, route),
        headers: <String, String>{
          "content-type": "application/json; charset=UTF-8",
          // "Cookie": globals.rawCookie
        });
    if(response.statusCode != 204) {
      return DeleteExercise.fromJson(json.decode(response.body));
    } else {
      print("${response.statusCode}");
    }
  }
}