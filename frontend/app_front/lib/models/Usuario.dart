class Usuario {
  // int int_idausuario;
  String vhr_senha;
  String vhr_email;
  String vhr_nome;
  String vhr_sobrenome;
  String dtt_nascimento;
  String vhr_cref;
  int int_genero;
  String vhr_whatsapp;
  int int_tipo;
  String token_professor;
  //String changedpasswordat;

  Usuario(
      {
        //this.int_idausuario,
        this.vhr_email,
        this.vhr_senha,
        this.vhr_nome,
        this.vhr_sobrenome,
        this.dtt_nascimento,
        this.vhr_cref,
        this.int_genero,
        this.vhr_whatsapp,
        this.int_tipo,
        this.token_professor,
        //this.changedpasswordat
      }
  );

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      //int_idausuario: json['int_idausuario'],
      token_professor: json['token_professor'],
      vhr_email: json['vhr_email'],
      vhr_senha: json['vhr_senha'],
      vhr_nome: json['vhr_nome'],
      vhr_sobrenome: json['vhr_sobrenome'],
      dtt_nascimento: json['dtt_nascimento'],
      vhr_cref: json['vhr_cref'],
      int_genero: json['int_genero'],
      vhr_whatsapp: json['vhr_whatsapp'],
      int_tipo: json['int_tipo'],

      //changedpasswordat: json['changedpasswordat'],
    );
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['vhr_email'] = this.sId;
  //   data['email'] = this.email;
  //   data['phoneNumber'] = this.phoneNumber;
  //   data['isAddressApproved'] = this.isAddressApproved;
  //   data['unitNumber'] = this.unitNumber;
  //   data['streetAddress'] = this.streetAddress;
  //   data['area'] = this.area;
  //   data['zipCode'] = this.zipCode;
  //   data['totalOrder'] = this.totalOrder;
  //   data['todayOrder'] = this.todayOrder;
  //   data['isPauseDelivery'] = this.isPauseDelivery;
  //   data['vacationStartDt'] = this.vacationStartDt;
  //   data['vacationEndDt'] = this.vacationEndDt;
  //   data['defaultLiter'] = this.defaultLiter;
  //   return data;
  // }

}