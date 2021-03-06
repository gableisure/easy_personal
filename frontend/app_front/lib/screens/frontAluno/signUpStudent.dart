import 'package:app_front/api/apiSingUpStudent.dart';
import 'package:app_front/widgets/buttons/buttonAvancarSingUp.dart';
import 'package:app_front/widgets/buttons/buttonCadastrarSingUp.dart';
import 'package:app_front/widgets/buttons/buttonVoltarSingUp.dart';
import 'package:flutter/material.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';

class SignUpStudent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateSignUpStudent();
  }
}

class _StateSignUpStudent extends State<SignUpStudent> {
  // váriaveis
  int _index = 0;
  String genero;
  bool _showPassword = false;
  bool _showConfirmPassword = false;

  var _userObject = {};

  // controllers dos text form field
  final _senhaController = TextEditingController();

  // chaves para os forms
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey3 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyToken = GlobalKey<FormState>();

  //Widgets
  // token
  Widget _buildToken() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25),),
        ),
        prefixIcon: Icon(Icons.vpn_key_outlined),
        labelText: "Token do Professor",
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
      validator: (String value) {
        if(value.isEmpty) {
          return "Token Obrigatório";
        }
        return null;
      },
      onSaved: (String value) {
        _userObject['token_professor'] = value;
      },
    );
  }

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
        _userObject['vhr_nome'] = value;
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
        _userObject['vhr_sobrenome'] = value;
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
        _userObject['vhr_email'] = value;
      },
    );
  }

  // senha
  Widget _buildSenha() {
    return TextFormField(
      controller: _senhaController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: _showPassword == false ? true : false,
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
        suffixIcon: GestureDetector(
          child: Icon(
            _showPassword == false ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey[800],
          ),
          onTap: () {
            setState(() {
              _showPassword = !_showPassword;
            });
          },
        ),
      ),
      validator: (String value) {
        if(value.isEmpty) {
          return "Senha Obrigatória";
        }
        return null;
      },
      onSaved: (String value) {
        _userObject['vhr_senha'] = value;
      },
    );
  }

  // confirma senha
  Widget _buildConfirmaSenha() {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: _showConfirmPassword == false ? true : false,
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
        suffixIcon: GestureDetector(
          child: Icon(
            _showConfirmPassword == false ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey[800],
          ),
          onTap: () {
            setState(() {
              _showConfirmPassword = !_showConfirmPassword;
            });
          },
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
        _userObject['passwordConfirm'] = value;
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
          return "Data de Nascimento Obrigatória";
        }
        return null;
      },
      onSaved: (String value) {
        _userObject['dtt_nascimento'] = value;
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
        labelText: "Telefone",
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
        _userObject['vhr_whatsapp'] = value;
      },
    );
  }

  // peso
  Widget _buildPeso() {
    return TextFormField(
      /*inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        PesoInputFormatter(),
      ],*/
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25),),
        ),
        prefixIcon: Icon(Icons.nature_people_rounded),
        labelText: "Peso",
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
      validator: (String value) {
        if(value.isEmpty) {
          return "Peso Obrigatório";
        }
        return null;
      },
      onSaved: (String value) {
        _userObject['num_peso'] = value;
      },
    );
  }

  // altura
  Widget _buildAltura() {
    return TextFormField(
      /*inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        AlturaInputFormatter(),
      ],*/
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25),),
        ),
        prefixIcon: Icon(Icons.height),
        labelText: "Altura",
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
      validator: (String value) {
        if(value.isEmpty) {
          return "Altura Obrigatória";
        }
        return null;
      },
      onSaved: (String value) {
        _userObject['num_altura'] = value;
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
          _userObject['int_genero'] = value;
        });
      },

      onSaved: (String value) {
        _userObject['int_genero'] = value;
      },
    );
  }

  // Descrição
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
        hintText: "Breve Descrição Sobre Você:\n"
            "- Possui alguma comorbidade?\n"
            "- Já praticou alguma atividade física antes?\n"
            "- Já passou por alguma cirurgia?\n",
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
        _userObject['vhr_descricao'] = value;
      },
    );
  }
  @override
  void _switchInputField(int newIndex) {
    setState(() {
      _index = newIndex;
    });
  }

  _defineUserObject() {
    if(_userObject['int_genero'] == "Masculino") _userObject['int_genero'] = 0;
    else if (_userObject['int_genero'] == "Feminino") _userObject['int_genero'] = 1;
    else _userObject['int_genero'] = 2;

    _userObject['int_tipo'] = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IndexedStack(
          index: _index,
          children: <Widget>[
            Form(
              key: _formKeyToken,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 28,),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Passo 1 de 4",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Color(0xFF0073B7),
                      ),
                    ),
                  ),
                  SizedBox(height: 23,),
                  Text(
                    "Qual a identificação do seu professor?",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.blueGrey[900],
                    ),
                  ),
                  SizedBox(height: 35,),
                  _buildToken(),
                ],
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Passo 2 de 4",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Color(0xFF0073B7),
                      ),
                    ),
                  ),
                  SizedBox(height: 13,),
                  _buildNome(),
                  SizedBox(height: 18,),
                  _buildSobrenome(),
                  SizedBox(height: 18,),
                  _buildEmail(),
                  SizedBox(height: 18,),
                  _buildDataNascimento(),
                ],
              ),
            ),
            Form(
              key: _formKey2,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Passo 3 de 4",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Color(0xFF0073B7),
                      ),
                    ),
                  ),
                  SizedBox(height: 18,),
                  _buildSenha(),
                  SizedBox(height: 18,),
                  _buildConfirmaSenha(),
                  SizedBox(height: 18,),
                  _buildTelefone(),
                  SizedBox(height: 18,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: _buildAltura(),
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 4.0),),
                      Expanded(
                        flex: 2,
                        child: _buildPeso(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Form(
              key: _formKey3,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Passo 4 de 4",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Color(0xFF0073B7),
                      ),
                    ),
                  ),
                  SizedBox(height: 18,),
                  _buildDescricao(),
                  SizedBox(height: 18,),
                  _buildGenero(),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 8.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _index >= 1
                ? Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: () {
                  _switchInputField(_index - 1);
                },
                child: ButtonVoltarSingUp(labelButton: "Voltar", iconButton: Icon( Icons.chevron_left_outlined ),),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF4563DB),
                  shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20),),
                  ),
                  elevation: 10,
                ),
              ),
            ) : Expanded(flex: 2, child: Container()),
            _index == 0
                ? ElevatedButton(
              onPressed: () {
                if(!_formKeyToken.currentState.validate()) {
                  return;
                } else {
                  _switchInputField(_index + 1);
                }
              },
              child:  ButtonAvancarSingUp(labelButton: "Avançar", iconButton: Icon( Icons.chevron_right_outlined ),),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF4563DB),
                shape: new RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20),),
                ),
                elevation: 10,
              ),
            ) : Container(),
            Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
            if(_index == 1)
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: () {
                    if(!_formKey.currentState.validate()) {
                      return;
                    } else {
                      _switchInputField(_index + 1);
                    }
                  },
                  child: ButtonAvancarSingUp(labelButton: "Avançar", iconButton: Icon( Icons.chevron_right_outlined ),),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF4563DB),
                    shape: new RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20),),
                    ),
                    elevation: 10,
                  ),
                ),
              ),
            if(_index == 2)
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: () async {
                    if(!_formKey2.currentState.validate()) {
                      return;
                    } else {
                      _switchInputField(_index + 1);
                    }
                  },
                  child: ButtonAvancarSingUp(labelButton: "Avançar", iconButton: Icon( Icons.chevron_right_outlined ),),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF4563DB),
                    shape: new RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20),),
                    ),
                    elevation: 10,
                  ),
                ),
              ),
            if(_index == 3)
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: () async {
                    if(!_formKey3.currentState.validate()) {
                      return;
                    } else {
                      _formKey.currentState.save();
                      _formKey2.currentState.save();
                      _formKey3.currentState.save();
                      _formKeyToken.currentState.save();
                      _defineUserObject();

                      var response = await APISingUpStudent().singUp(
                          _userObject['vhr_email'],
                          _userObject['vhr_senha'],
                          _userObject['passwordConfirm'],
                          _userObject['vhr_nome'],
                          _userObject['vhr_sobrenome'],
                          _userObject['dtt_nascimento'],
                          _userObject['int_genero'],
                          _userObject['vhr_whatsapp'],
                          _userObject['int_tipo'],
                          _userObject['vhr_descricao'],
                          _userObject['num_altura'],
                          _userObject['num_peso'],
                          _userObject['token_professor']
                      );
                      //verificando usuário
                      if(response.token != null) {
                        SnackBar snackbar = new SnackBar(
                          content: Text(
                            "Aluno(a) cadastrado com sucesso",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: Colors.green[600],
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        Navigator.of(context).pushReplacementNamed("/login");
                      } else {
                        SnackBar snackbar = new SnackBar(
                          content: Text(
                            "E-mail já cadastrado",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: Colors.red[600],
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      }
                    }
                  },
                  child:  ButtonCadastrarSingUp(labelButton: "Cadastrar"),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF4563DB),
                    shape: new RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20),),
                    ),
                    elevation: 10,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}