import 'package:app_front/api/apiSingUpTeacher.dart';
import 'package:app_front/widgets/buttons/buttonAvancarSingUp.dart';
import 'package:app_front/widgets/buttons/buttonCadastrarSingUp.dart';
import 'package:app_front/widgets/buttons/buttonVoltarSingUp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';

class SignUpTeacher extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
   return _StateSignUpTeacher();
  }
}

class _StateSignUpTeacher extends State<SignUpTeacher> {
  //váriaveis
  int _index = 0;
  String nome;
  String sobrenome;
  String email;
  String senha;
  String cref;
  String genero;
  String dataNascimento;
  String telefone;
  String descricao;


  var userObject = {};

  // controllers dos text form field
  /*
  *   TODO: analisar uso dos controllers
  * */
  // final _nomeController = TextEditingController();
  // final _sobrenomeController = TextEditingController();
  // final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  // final _dataNascimentoController = TextEditingController();
  // final _telefoneController = TextEditingController();
  // final _crefController = TextEditingController();
  // final _generoController = TextEditingController();

  // chaves para os forms
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey3 = GlobalKey<FormState>();


  // widgets
  // nome
  Widget _buildNome() {
    return TextFormField(
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25),),
        ),
        prefixIcon: Icon(Icons.account_circle_rounded),
        labelText: "Primeiro Nome",
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
      validator: (String value) {
        if(value.isEmpty) {
          return "Nome Obrigatório";
        }
        return null;
      },
      onSaved: (String value) {
        userObject['vhr_nome'] = value;
      },
    );
  }

  // sobrenome
  Widget _buildSobrenome() {
    return TextFormField(
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25),),
        ),
        prefixIcon: Icon(Icons.account_circle_rounded),
        labelText: "Sobrenome",
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
      validator: (String value) {
        if(value.isEmpty) {
          return "Sobrenome Obrigatório";
        }
        return null;
      },
      onSaved: (String value) {
        userObject['vhr_sobrenome'] = value;
      },
    );
  }

  // e-mail
  Widget _buildEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25),),
        ),
        prefixIcon: Icon(Icons.email_rounded),
        labelText: "E-mail",
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
      validator: (String value) {
        if(value.isEmpty) {
          return "E-mail Obrigatório";
        }
        if(!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(value)) {
          return "Por Favor, entre com um e-mail válido";
        }
        return null;
      },
      onSaved: (String value) {
        //usuario.vhr_email = value;
        userObject['vhr_email'] = value;
      },
    );
  }
  // senha
  Widget _buildSenha() {
    return TextFormField(
      controller: _senhaController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25),),
        ),
        prefixIcon: Icon(Icons.vpn_key_rounded),
        labelText: "Senha",
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
      validator: (String value) {
        if(value.isEmpty) {
          return "Senha Obrigatória";
        }
        return null;
      },
      onSaved: (String value) {
        userObject['vhr_senha'] = value;
      },
    );
  }

  // confirma senha
  Widget _buildConfirmaSenha() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25),),
        ),
        prefixIcon: Icon(Icons.vpn_key_rounded),
        labelText: "Confirmar senha",
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
      validator: (String value) {
        if(value.isEmpty) {
          return "Confirmação de senha obrigatória";
        }
        if(value != _senhaController.text) {
          return "As senhas não coincidem";
        }
        return null;
      },
      onSaved: (String value) {
        userObject['passwordConfirm'] = value;
      },
    );
  }

  // data de nascimento
  Widget _buildDataNascimento() {
    return TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        DataInputFormatter(),
      ],
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25),),
        ),
        prefixIcon: Icon(Icons.date_range_rounded),
        labelText: "Data de Nascimento",
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
      validator: (String value) {
        if(value.isEmpty) {
          return "Data de nascimento obrigatória";
        }
        return null;
      },
      onSaved: (String value) {
        userObject['dtt_nascimento'] = value;
      },
    );
  }

  // telefone
  Widget _buildTelefone() {
    return TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        TelefoneInputFormatter(),
      ],
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25),),
        ),
        prefixIcon: Icon(Icons.phone),
        hintText: "(##) 9####-####",
        labelText: "Telefone WhatsApp",
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
      validator: (String value) {
        if(value.isEmpty) {
          return "Telefone Obrigatório";
        }
        return null;
      },
      onSaved: (String value) {
        userObject['vhr_whatsapp'] = value;
      },
    );
  }

  // cref
  Widget _buildCref() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25),),
        ),
        prefixIcon: Icon(Icons.credit_card_rounded),
        labelText: "CREF",
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
      validator: (String value) {
        if(value.isEmpty) {
          return;
        }
        return null;
      },
      onSaved: (String value) {
        userObject['vhr_cref'] = value;
      },
    );
  }

  // gênero
  Widget _buildGenero() {
    var _list = ["Masculino", "Feminino", "Indefinido"];
    return DropdownButtonFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25),),
        ),
        prefixIcon: Icon(Icons.people_alt_rounded),
        labelText: "Escolha o Gênero",
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
        isDense: true,
      ),
      value: genero,
      items: _list.map<DropdownMenuItem<String>>((String drop) {
        return DropdownMenuItem<String>(
          child: Text(drop),
          value: drop,
        );
        }).toList(),
        validator: (String value){
          if(value == null || value.isEmpty){
            return "Escolha de gênero Obrigatória";
          }
          return null;
        },
        onChanged: (String value) {
          setState(() {
            userObject['int_genero'] = value;
          });
        },
        onSaved: (String value) {
          userObject['int_genero'] = value;
        },
      );
  }

  // descrição
  Widget _buildDescricao() {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLength: 255,
      maxLines: 10,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25),),
        ),
        prefixIcon: Icon(Icons.text_snippet_rounded),
        labelText: "Breve Descrição",
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
      validator: (String value) {
        if(value.isEmpty) {
          return;
        }
        return null;
      },
      onSaved: (String value) {
        userObject['vhr_descricao'] = value;
      },
    );
  }

  void _switchInputField(int newIndex) {
    setState(() {
      _index = newIndex;
    });
  }

  Widget _buildButtonAvancar() {
    return Padding(
        padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 8.0),
        child: Row(
            children: [
              Text(
                "Avançar",
                style: TextStyle(
                  fontSize: 22.0,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              SizedBox( width: 5.0, ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                size: 25.0,
              ),
            ]
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IndexedStack(
          index: _index,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    "PASSO 1 DE 3",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Color(0xFF0073B7),
                    ),
                  ),
                  SizedBox(height: 13,),
                  _buildNome(),
                  SizedBox(height: 18,),
                  _buildSobrenome(),
                  SizedBox(height: 18,),
                  _buildEmail(),
                  SizedBox(height: 18,),
                  _buildSenha(),
                  SizedBox(height: 18,),
                  _buildConfirmaSenha(),
                ],
              ),
            ),
            Form(
              key: _formKey2,
              child: Column(
                children: <Widget>[
                  Text(
                    "PASSO 2 DE 3",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Color(0xFF0073B7),
                    ),
                  ),
                  SizedBox(height: 18,),
                  _buildDataNascimento(),
                  SizedBox(height: 18,),
                  _buildTelefone(),
                  SizedBox(height: 18,),
                  _buildCref(),
                  SizedBox(height: 18,),
                  _buildGenero(),
                ],
              ),
            ),
            Form(
              key: _formKey3,
              child: Column(
                children: <Widget>[
                  Text(
                    "PASSO 3 DE 3",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Color(0xFF0073B7),
                    ),
                  ),
                  SizedBox(height: 18,),
                  _buildDescricao(),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 20.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: <Widget>[
            _index >= 1
            ? ElevatedButton(

              onPressed: () {
                _switchInputField(_index - 1);
              },
              child: ButtonVoltarSingUp(labelButton: "Voltar", iconButton: Icon( Icons.chevron_left_outlined ),),
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlue,
                shape: new RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25),),
                ),
                elevation: 10,
              ),
            ) : Container(),
            _index == 0
            ? ElevatedButton(
              onPressed: () {
                if(!_formKey.currentState.validate()) {
                  return;
                } else {
                  _switchInputField(_index + 1);
                }
              },
              child: ButtonAvancarSingUp(labelButton: "Avançar", iconButton: Icon( Icons.chevron_right_outlined ),),
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlue,
                shape: new RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25),),
                ),
                elevation: 10,
              ),
            ) : Container(),
            if(_index == 1)
              ElevatedButton(
                onPressed: () {
                  if(!_formKey2.currentState.validate()) {
                    return;
                  } else {
                    _switchInputField(_index + 1);
                  }
                },
                child: ButtonAvancarSingUp(labelButton: "Avançar", iconButton: Icon( Icons.chevron_right_outlined ),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue,
                  shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25),),
                  ),
                  elevation: 10,
                ),
              ),
            if(_index == 2)
              ElevatedButton(
                onPressed: () async {
                  if(!_formKey3.currentState.validate()) {
                    return;
                  } else {
                    _formKey.currentState.save();
                    _formKey2.currentState.save();
                    _formKey3.currentState.save();

                    if(userObject['int_genero'] == "Masculino") userObject['int_genero'] = 0;
                    else if (userObject['int_genero'] == "Feminino") userObject['int_genero'] = 1;
                    else userObject['int_genero'] = 2;

                    userObject['int_tipo'] = 1;

                    var response = await APISingUpTeacher().singUp(
                      userObject['vhr_email'],
                      userObject['vhr_senha'],
                      userObject['passwordConfirm'],
                      userObject['vhr_nome'],
                      userObject['vhr_sobrenome'],
                      userObject['dtt_nascimento'],
                      userObject['int_genero'],
                      userObject['vhr_whatsapp'],
                      userObject['int_tipo'],
                      userObject['vhr_cref'],
                      userObject['vhr_descricao'],
                    );
                    print("Response Token: ${response.token}");

                    if(response.token != null) {
                      SnackBar snackbar = new SnackBar(
                        content: Text(
                          "Professor cadastrado com sucesso",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: Colors.green[600],
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      Navigator.of(context).pushReplacementNamed("/login");
                    } else {
                      SnackBar snackbar = new SnackBar(
                        content: Text(
                          "Outro erro!!!",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: Colors.red[600],
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    }
                  }
                },
                child: ButtonCadastrarSingUp(labelButton: "Cadastrar"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue,
                  shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25),),
                  ),
                  elevation: 10,
                ),
              ),
          ],
        ),
      ],
    );
  }

}