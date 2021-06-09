class JsonDefault {
  String status;
  String data;
  String token;
  String message;
  int id;

  JsonDefault({this.status, this.data, this.token, this.message, this.id});

  JsonDefault.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
    token = json['token'];
    message = json['message'];
    id = json['int_idausuario'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['data'] = this.data;
    data['token'] = this.token;
    data['message'] = this.message;
    data["int_idausuario"] = this.id;
    return data;
  }
}