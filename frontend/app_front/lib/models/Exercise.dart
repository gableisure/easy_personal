class Exercise {
  String status;
  int results;
  List<dynamic> data = [];

  Exercise({this.status, this.results, this.data});

  Exercise.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    results = json['results'];
    data = (json['data'] as List).map((i) {
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
  int int_idaexercicio;
  String vhr_nome;
  int  int_intervalor;
  String vhr_seriesrepeticoes;
  int int_idfcategoria;
  int int_idfprofessor;
  String vhr_descricao;

  Data(
      this.int_idaexercicio,
      this.vhr_nome,
      this.int_intervalor,
      this.vhr_seriesrepeticoes,
      this.int_idfcategoria,
      this.int_idfprofessor,
      this.vhr_descricao,
      );

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      json['int_idaexercicio'] as int,
      json['vhr_nome'] as String,
      json['int_intervalor'] as int,
      json['vhr_seriesrepeticoes'] as String,
      json['int_idfcategoria'] as int,
      json['int_idfprofessor'] as int,
      json['vhr_descricao'] as String,
    );
  }
}