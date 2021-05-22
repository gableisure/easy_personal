import 'package:flutter/material.dart';
import 'package:app_front/helpers/globals.dart' as globals;

import 'buttons/radioButtonSignUp.dart';

class AlertSignUp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Color(0xFF3594DD),
                Color(0xFF4563DB),
                Color(0xFF5036D5),
                Color(0xFF5B16D0),
              ],
            ),
          ),
          child: Stack(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 30),),
              AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                titlePadding: EdgeInsets.only(top: 25, left: 40, right: 40),
                title: Text(
                  "Olá, Siga as informações abaixo para se juntar a EasyPersonal!!",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.justify,
                ),
                //contentPadding: EdgeInsets.only(left: 50, right: 50),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                              "Antes de prosseguir com o cadastro por favor escolha se deseja se cadastrar como aluno ou personal.\n"
                              "Personal: Essa opção é voltada para profissionais de educação física que estão interessados em utilizar nossa ferramenta para otimizar o seu serviço\n"
                              "Aluno: Essa opção é voltada para pessoas cujo professores estejam cadastrados na ferramenta.\n"
                              "Para realizar o cadastro é necessário que seu professor lhe envie sua chave de ativação pessoal.\n"
                              "Agradecemos a recomendação do aplicativo caso seu professor não o utilize.\n",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: RadioButtonSignUp(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
