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
        //this.changedpasswordat
      }
  );

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      //int_idausuario: json['int_idausuario'],
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
}