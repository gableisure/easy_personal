import "dart:async";
import 'dart:convert';
import 'package:app_front/models/Training.dart';
import 'package:http/http.dart' as http;
import 'package:app_front/helpers/globals.dart' as globals;

class APIGetUserTrainings {
  Future<Training> getAllTrainings() async {
    String url = "10.0.2.2:3000";
    //String url = "easy-personal.herokuapp.com";
    String route = "/api/v1/instructors/training";

    final http.Response response = await http.get(Uri.http(url, route), headers: <String, String>{
      "content-type": "application/json; charset=UTF-8",
      "Cookie": globals.rawCookie
    });

    if(response.statusCode == 200) {
      return Training.fromJson(json.decode(response.body));
    } else if(response.statusCode == 401){
      return Training.fromJson(json.decode(response.body));
    }
    return null;//throw Exception("Falha no carregamento dos dados!!!!");
  }
}