class Student {
  String status;
  int results;
  List<dynamic> data = [];

  Student({this.status, this.results, this.data});

  Student.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    results = json['results'];
    data = (json['data'][0] as List).map((i) {
      return Data.fromJson(i);
    }).cast<dynamic>().toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['results'] = this.results;
    data['data'] = this.data;
    return data;
  }
}

class Data {
  int int_idausuario;
  String vhr_email;
  String  vhr_senha;
  String vhr_nome;
  String vhr_sobrenome;
  String dtt_nascimento;
  int int_genero;
  String vhr_whatsapp;
  int int_tipo;
  String changedpasswordat;
  int int_idfaluno;
  String vhr_descricao;
  String num_peso;
  String num_altura;
  int user_id;
  int instructor_id;

  Data(
      this.int_idausuario,
      this.vhr_email,
      this.vhr_senha,
      this.vhr_nome,
      this.vhr_sobrenome,
      this.dtt_nascimento,
      this.int_genero,
      this.vhr_whatsapp,
      this.int_tipo,
      this.changedpasswordat,
      this.int_idfaluno,
      this.vhr_descricao,
      this.num_peso,
      this.num_altura,
      this.user_id,
      this.instructor_id
  );

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      json['int_idausuario'] as int,
      json['vhr_email'] as String,
      json['vhr_senha'] as String,
      json['vhr_nome'] as String,
      json['vhr_sobrenome'] as String,
      json['dtt_nascimento'] as String,
      json['int_genero'] as int,
      json['vhr_whatsapp'] as String,
      json['int_tipo'] as int,
      json['changedpasswordat'] as String,
      json['int_idfaluno'] as int,
      json['vhr_descricao'] as String,
      json['num_peso'] as String,
      json['num_altura'] as String,
      json['user_id'] as int,
      json['instructor_id'] as int,
    );
  }
}