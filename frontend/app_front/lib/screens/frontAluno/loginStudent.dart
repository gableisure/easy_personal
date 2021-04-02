import 'package:app_front/api/apiLogin.dart';
import 'package:flutter/material.dart';

class LoginStudent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateLoginStudent();
  }
}

class _StateLoginStudent extends State<LoginStudent> {
  //váriaveis
  String email;
  String senha;
  //chaves paras os forms
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //Widgets
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
  //senha
  Widget _buildSenha() {
    return TextFormField(
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              _buildEmail(),
              SizedBox(height: 18,),
              _buildSenha(),
            ],
          ),
        ),
        SizedBox(height: 13,),
        Container(
          height: 35,
          child: TextButton(
            child: Text(
              "Esqueceu a Senha?",
              style: TextStyle(
                color: Color(0xFF0073B7),
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed("/forgotPassword");
            },
          ),
        ),
        SizedBox(height: 20,),
        Container(
          height: 60,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.lightBlue,
              shape: new RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25),),
              ),
            ),
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Entrar",
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    width: 28,
                    height: 28,
                    child: Icon(
                      Icons.fitness_center_rounded,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ],
              ),
            ),
            onPressed: () async {
              if(!_formKey.currentState.validate()) {
                return;
              }
              _formKey.currentState.save();
              var response =  await APILogin().login(email, senha);

              if(response.token != null) {
                print(response.data);
                Navigator.of(context).pushReplacementNamed("/pageMainStudent");
              } else {
                print("Email ou Senha Inválidos!!!!");
              }
            },
          ),
        ),
        SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Não Tem Uma Conta?",
              style: TextStyle(
                color: Color(0xFF00253F),
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
            TextButton(
              child: Text(
                "Cadastre-se",
                style: TextStyle(
                  color: Color(0xFF0073B7),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ) ,
              ),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed("/signUp");
              },
            ),
          ],
        ),
      ],
    );
  }
}