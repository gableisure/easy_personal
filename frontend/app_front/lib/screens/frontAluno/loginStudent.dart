import 'dart:async';
import 'package:app_front/api/apiGetStudents.dart';
import 'package:app_front/api/apiLoginStudent.dart';
import 'package:app_front/helpers/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_front/screens/webView.dart';

class LoginStudent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateLoginStudent();
  }
}

class _StateLoginStudent extends State<LoginStudent>  with TickerProviderStateMixin {
  //váriaveis
  String email;
  String senha;
  bool _showPassword = false;
  int _state = 0;
  //chaves paras os forms
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Animation _animation;
  AnimationController _controller;
  GlobalKey _globalKey = GlobalKey();
  double _width = double.maxFinite;

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
        hintText: "E-mail teste: aluno@easy.com",
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
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
      obscureText: _showPassword == false ? true : false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25),),
        ),
        prefixIcon: Icon(Icons.vpn_key_rounded),
        labelText: "Senha",
        hintText: "senha Teste: 123",
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
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
        senha = value;
      },
    );
  }

  /*@override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }*/

  //animation button succes
  void animateButton() {
    double initialWidth = _globalKey.currentContext.size.width;

    _controller = AnimationController(duration: Duration(milliseconds: 300), vsync: this);

    _animation = Tween(begin: 0.0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {
          _width = initialWidth - ((initialWidth - 66) * _animation.value);
        });
      });
    _controller.forward();

    setState(() {
      _state = 1;
    });

    Timer(Duration(milliseconds: 1100), () {
      setState(() {
        _state = 2;
      });
    });
  }
  //animation buttonError
  void animateButtonError() {
    double initialWidth = _globalKey.currentContext.size.width;

    _controller = AnimationController(duration: Duration(milliseconds: 300), vsync: this);

    _animation = Tween(begin: 0.0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {
          _width = initialWidth - ((initialWidth - 66) * _animation.value);
        });
      });
    _controller.forward();

    setState(() {
      _state = 1;
    });

    Timer(Duration(milliseconds: 1100), () {
      setState(() {
        _state = 3;
      });
    });
  }

  //Button
  setUpButton() {
    if (_state == 0) {
      return Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "ENTRAR",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            Icon(
              Icons.fitness_center_rounded,
              color: Colors.white,
              size: 25,
            )
          ],
        ),
      );
    } else if (_state == 1) {
      return SizedBox(
        height: 50,
        width: 50,
        child: Center(
          child: CircularProgressIndicator(
            value: null,
            strokeWidth: 4,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      );
    } else if(_state == 2){
      return Icon(Icons.check, color: Colors.white, size: 30,);
    } else {
      return Icon(Icons.cancel_rounded, color: Color(0xFFFC0800), size: 30,);
    }
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
        /*Container(
          height: 35,
          child: TextButton(
            child: Text(
              "Esqueceu a Senha?",
              style: TextStyle(
                color: Color(0xFF0073B7),
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed("/forgotPassword");
            },
          ),
        ),*/
        SizedBox(height: 20,),
        Container(
          key: _globalKey,
          width: _width,
          height: 60,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF4563DB),
              shape: new RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25),),
              ),
            ),
            child: setUpButton(),
            onPressed: () async {
              if(!_formKey.currentState.validate()) {
                return;
              }
              //Estado do button
              setState(() {
                if(_state >= 1) {
                  animateButton();
                }
              });
              _formKey.currentState.save();
              var listStudents = await APIGetStudents().getAllStudents();
              var users = listStudents.data;

              if(Helpers().isStudent(users, email) != null) {
                setState(() {
                  if(_state == 0) {
                    animateButton();
                  }
                });
                Map studentLogged = Helpers().getStudentsForEmail(users, email);
                var response =  await APILoginStudent().login(email, senha);
                if(response.token != null) {
                  setState(() {
                    _state = 2;
                  });
                  SnackBar snackbar = new SnackBar(
                    content: Text(
                      "Usuário Logado com Sucesso!!",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Colors.green[600],
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  //salvando dados do user
                  Helpers().saveDataUserStudent(studentLogged);
                  print(response.data);
                  Navigator.of(context).pushNamedAndRemoveUntil("/pageMainStudent", (route) => false);
                } else {
                  setState(() {
                    _state = 3;
                  });
                  SnackBar snackbar = new SnackBar(
                    content: Text(
                      "E-mail ou Senha Inválidos!!",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Colors.red[600],
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                }
              }else{
                setState(() {
                  _state = 3;
                });
                SnackBar snackbar = new SnackBar(
                  content: Text(
                    "Esse Aluno(a) não exite!!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Colors.red[600],
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              }
            },
          ),
        ),
        SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Não tem uma conta?",
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
                Navigator.of(context).pushReplacementNamed("/showSignUp");
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Precisando de ajuda com o app?",
              style: TextStyle(
                color: Color(0xFF00253F),
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
            TextButton(
              child: Text(
                "Tutorial",
                style: TextStyle(
                  color: Color(0xFF0073B7),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ) ,
              ),
              onPressed: ()  {
                Navigator.of(context).pushReplacementNamed("/webView");
              }
            ),
          ],
        ),
      ],
    );
  }
}