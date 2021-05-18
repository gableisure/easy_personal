import 'package:app_front/api/apiGetTeachers.dart';
import 'package:app_front/api/apiLoginTeacher.dart';
import 'package:app_front/helpers/helpers.dart';
import 'package:app_front/screens/frontProfessor/pageMainTeacher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../helpers/globals.dart' as globals;

class LoginTeacher extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StateLoginTeacher();
  }
}

class _StateLoginTeacher extends State<LoginTeacher> {

  //váriaveis
  String email;
  String senha;
  bool _showPassword = false;

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
                fontWeight: FontWeight.bold,
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
              primary: Color(0xFF4563DB),
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
              if (!_formKey.currentState.validate()) {
                return;
              }

              _formKey.currentState.save();

              var listTeachers = await APIGetTeachers().getAllTeachers();
              var users = listTeachers.data;

              if (Helpers().isTeacher(users, email) != null) {
                Map instructorLogged = Helpers().getInstructorForEmail(users, email);
                var response = await APILoginTeacher().login(email, senha);
                if (response.token != null) {
                  SnackBar snackbar = new SnackBar(
                    content: Text(
                      "Usuário Logado com Sucesso!!",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Colors.green[600],
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);

                  // Envia o Map Professor para que seja registrado os dados do professor logado
                  Helpers().saveDataUserInstructor(instructorLogged);

                  // Navega para a página principal do professor
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => PageMainTeacher()
                      ),
                  );
                } else {
                  SnackBar snackbar = new SnackBar(
                    content: Text(
                      "E-mail ou Senha Inválidos!!",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Colors.red[600],
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                }
              } else {
                SnackBar snackbar = new SnackBar(
                  content: Text(
                    "Esse professor(a) não existe!!",
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
                Navigator.of(context).pushReplacementNamed("/signUp");
              },
            ),
          ],
        ),
      ],
    );
  }
}