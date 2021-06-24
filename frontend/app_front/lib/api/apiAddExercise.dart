import "dart:async";
import 'dart:convert';
import 'package:app_front/models/addExercise.dart';
import 'package:http/http.dart' as http;
import 'package:app_front/helpers/globals.dart' as globals;

class APIAddExercise {
  Future<AddExercise> addExercise(Map exercise) async {
    String url = "10.0.2.2:3000";
    //String url = "easy-personal.herokuapp.com";
    String route = "/api/v1/instructors/exercise";


    final http.Response response = await http.post(Uri.http(url, route),
        body: jsonEncode(<String, dynamic>{
          "vhr_nome": exercise['vhr_nome'],
          "int_intervalor": exercise['int_intervalor'],
          "vhr_seriesrepeticoes": exercise['vhr_seriesrepeticoes'],
          "int_idfcategoria": exercise['int_idfcategoria'],
        }),
        headers: <String, String>{
          "content-type": "application/json; charset=UTF-8",
          "Cookie": globals.rawCookie
        });
    if (response.statusCode == 200 || response.statusCode == 201) {
      return AddExercise.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      return AddExercise.fromJson(json.decode(response.body));
    }
    return null; //throw Exception("Falha no carregamento dos dados!!!!");
  }
}