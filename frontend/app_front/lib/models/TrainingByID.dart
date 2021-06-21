import 'dart:convert';

class TrainingByID {
  String status;
  List<dynamic> data = [];

  TrainingByID({this.status, this.data});

  TrainingByID.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = (json['data'] as List)
        .map((i) {
      return Data.fromJson(i);
    })
        .cast<dynamic>()
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['data'] = this.data;
    return data;
  }
}

class Data {
  int int_idatreino;
  String vhr_nome;
  String dtt_inicio;
  String dtt_fim;
  String vhr_observacao;
  int int_estaarquivado;
  int int_idftipotreino;
  int int_idfprofessor;
  String vhr_nome_tipo_treino;
  String vhr_descricao;

  Data(
      this.int_idatreino,
      this.vhr_nome,
      this.dtt_inicio,
      this.dtt_fim,
      this.vhr_observacao,
      this.int_estaarquivado,
      this.int_idftipotreino,
      this.int_idfprofessor,
      this.vhr_nome_tipo_treino,
      this.vhr_descricao);

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        json['int_idatreino'] as int,
        json['vhr_nome'] as String,
        json['dtt_inicio'] as String,
        json['dtt_fim'] as String,
        json['vhr_observacao'] as String,
        json['int_estaarquivado'] as int,
        json['int_idftipotreino'] as int,
        json['int_idfprofessor'] as int,
        json['vhr_nome_tipo_treino'] as String,
        json['vhr_descricao'] as String
    );

  }
}
