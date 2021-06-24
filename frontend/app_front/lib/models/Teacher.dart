class Teacher {
  String status;
  int results;
  List<dynamic> data = [];

  Teacher({this.status, this.results, this.data});

  Teacher.fromJson(Map<String, dynamic> json) {
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
  String vhr_senha;
  String vhr_nome;
  String vhr_sobrenome;
  String dtt_nascimento;
  int int_genero;
  String vhr_whatsapp;
  int int_tipo;
  String changedpasswordat;
  int int_idfprofessor;
  String vhr_cref;
  String vhr_token;
  String vhr_descricao;

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
      this.int_idfprofessor,
      this.vhr_cref,
      this.vhr_token,
      this.vhr_descricao
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
      json['int_idfprofessor'] as int,
      json['vhr_cref'] as String,
      json['vhr_token'] as String,
      json['vhr_descricao'] as String,
    );
  }
}