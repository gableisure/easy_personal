import "dart:async";
import 'dart:convert';
import 'package:app_front/models/addTraining.dart';
import 'package:http/http.dart' as http;
import 'package:app_front/helpers/globals.dart' as globals;

class APIAddTraining {
  Future<AddTraining> addTraining(Map training) async {
     // String url = "10.0.2.2:3000";
    String url = "easy-personal.herokuapp.com";
    String route = "/api/v1/instructors/training";


    final http.Response response = await http.post(Uri.http(url, route),
        body: jsonEncode(<String, dynamic>{
          "vhr_nome": training['vhr_nome'],
          "dtt_inicio": training['dtt_inicio'],
          "dtt_fim": training['dtt_fim'],
          "vhr_observacao": training['vhr_observacao'],
          "int_estaarquivado": 0,
          "int_idftipotreino": training['int_idftipotreino'],
        }),
        headers: <String, String>{
          "content-type": "application/json; charset=UTF-8",
          "Cookie": globals.rawCookie
        });
    if (response.statusCode == 200 || response.statusCode == 201) {
      return AddTraining.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      return AddTraining.fromJson(json.decode(response.body));
    }
    return null; //throw Exception("Falha no carregamento dos dados!!!!");
  }
}