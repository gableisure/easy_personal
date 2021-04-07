class JsonDefault {
  String status;
  String data;
  String token;

  JsonDefault({this.status, this.data, this.token});

  JsonDefault.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['data'] = this.data;
    data['token'] = this.token;
    return data;
  }
}