import "dart:async";
import 'dart:convert';
import 'package:app_front/models/jsonDefault.dart';
import 'package:http/http.dart' as http;

class APISingUpTeacher {
  Future<JsonDefault> singUp(String vhr_email, String vhr_senha, String passwordConfirm, String vhr_nome, String vhr_sobrenome, String dtt_nascimento,
      int int_genero, String vhr_whatsapp, int int_tipo, String vhr_cref, String vhr_descricao) async {
    String url = "10.0.2.2:3000";
    final http.Response response = await http.post(Uri.http(url,"/api/v1/usuarios/signup"),
        body: jsonEncode(<String, dynamic>{
          "vhr_email": vhr_email,
          "vhr_senha": vhr_senha,
          "passwordConfirm": passwordConfirm,
          "vhr_nome": vhr_nome,
          "vhr_sobrenome": vhr_sobrenome,
          "dtt_nascimento": dtt_nascimento,
          "int_genero": int_genero,
          "vhr_whatsapp": vhr_whatsapp,
          "int_tipo": int_tipo,
          "vhr_cref": vhr_cref,
          "vhr_descricao": vhr_descricao
        }), headers: <String, String>{"content-type": "application/json; charset=UTF-8"});
    if(response.statusCode == 200 || response.statusCode == 201) {
      print("${response.statusCode}");
      print("${response.body}");
      return JsonDefault.fromJson(json.decode(response.body));
    } else if(response.statusCode == 401){
      print("${response.statusCode}");
      print("${response.body}");
      return JsonDefault.fromJson(json.decode(response.body));
    } else {
      print("FAIL: ${response.statusCode}");
      print("FAIL: ${response.body}");
      return JsonDefault.fromJson(json.decode(response.body));
      //return null;//throw Exception("Falha no carregamento dos dados!!!!");
    }


  }
}