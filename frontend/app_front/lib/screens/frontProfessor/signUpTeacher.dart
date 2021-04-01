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

  // controllers dos text form field
  final _nameController = TextEditingController();
  final _senhaController = TextEditingController();

  // chaves para os forms
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey3 = GlobalKey<FormState>();

  //Widgets
  //Nome
  Widget _buildNome() {
    return TextFormField(
      controller: _nameController,
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
        nome = value;
      },
    );
  }
  //sobrenome
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
        sobrenome = value;
      },
    );
  }
  //E-mail
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
        email = value;
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
        senha = value;
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
        senha = value;
      },
    );
  }

  //cref
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
        cref = value;
      },
    );
  }
  //genero
  Widget _buildGenero() {
    var _list = ["Masculino", " Femenino", "Indefinido", ""];
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
          genero = value;
        });
      },

      onSaved: (String value) {
        genero = value;
      },
    );
  }
  //Data de Nascimento
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
          return "Data de Nascimento Obrigatória";
        }
        return null;
      },
      onSaved: (String value) {
        dataNascimento = value;
      },
    );
  }
  //Telefone
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
        telefone = value;
      },
    );
  }
  //Descrição
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
          return "Descrição Obrigatória";
        }
        return null;
      },
      onSaved: (String value) {
        descricao = value;
      },
    );
  }

  void _switchInputField(int newIndex) {
    setState(() {
      _index = newIndex;
    });
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
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _index >= 1
            ? ElevatedButton(
              onPressed: () {
                _switchInputField(_index - 1);
              },
              child: Text("RETORNAR", style: TextStyle(fontSize: 20, color: Color(0xFFFFFFFF)),),
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
              child: Text("CONTINUAR", style: TextStyle(fontSize: 20, color: Color(0xFFFFFFFF)),),
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
                child: Text("CONTINUAR", style: TextStyle(fontSize: 20, color: Color(0xFFFFFFFF),),),
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
                onPressed: () {
                  if(!_formKey3.currentState.validate()) {
                    return;
                  } else {
                    _formKey.currentState.save();
                    _formKey2.currentState.save();
                    _formKey3.currentState.save();
                    print(_nameController.text);
                  }
                },
                child: Text("CADASTRAR", style: TextStyle(fontSize: 20, color: Color(0xFFFFFFFF),),),
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