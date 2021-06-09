import "dart:async";
import 'dart:convert';
import 'package:app_front/models/jsonDefault.dart';
import 'package:http/http.dart' as http;

class APIDeleteUser {
  Future<JsonDefault> deleteUser(Map user) async {
    // String url = "10.0.2.2:3000";
    String url = "easy-personal.herokuapp.com";

    final http.Response response = await http.delete(Uri.https(url,"/api/v1/usuarios/${user['int_idausuario']}"),
       headers: <String, String>{"content-type": "application/json; charset=UTF-8"});
    if(response.statusCode != 204) {
      print("${response.statusCode}");
      print("${response.body}");
      return JsonDefault.fromJson(json.decode(response.body));
    } else {
      print("${response.statusCode}");
      //print("${response.body}");
      //return JsonDefault.fromJson(json.decode(response.body));
    }
  }
}