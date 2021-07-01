class TrainingStudent {
  String status;
  int results;
  List<dynamic> data = [];

  TrainingStudent({this.status, this.results, this.data});

  TrainingStudent.fromJson(Map<String, dynamic> json) {
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
  int int_idftreino;
  int int_idfaluno;
  int int_estaemvigor;
  int int_idatreino;
  String vhr_nome;
  String dtt_inicio;
  String dtt_fim;
  String vhr_observacao;
  int int_estaarquivado;
  int int_idftipotreino;
  int int_idfprofessor;
  List exercises;

  Data(
      this.int_idftreino,
      this.int_idfaluno,
      this.int_estaemvigor,
      this.int_idatreino,
      this.vhr_nome,
      this.dtt_inicio,
      this.dtt_fim,
      this.vhr_observacao,
      this.int_estaarquivado,
      this.int_idftipotreino,
      this.int_idfprofessor,
      this.exercises
      );

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        json['int_idftreino'] as int,
        json['int_idfaluno'] as int,
        json['int_estaemvigor'] as int,
        json['int_idatreino'] as int,
        json['vhr_nome'] as String,
        json['dtt_inicio'] as String,
        json['dtt_fim'] as String,
        json['vhr_observacao'] as String,
        json['int_estaarquivado'] as int,
        json['int_idftipotreino'] as int,
        json['int_idfprofessor'] as int,
        json['exercises'] as List
    );
  }
}