import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/painting.dart';
import 'package:app_front/screens/widgets/radioButtonLogin.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        //reverse: true,
        physics: ClampingScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color(0xFF0073B7),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 160,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.only(
                    top: 20,
                    left: 40,
                    right: 40,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(60),
                    ),
                  ),
                  child: SingleChildScrollView(
                    reverse: false,
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Deseja logar como Personal ou Aluno?",
                          style: TextStyle(
                            color: Color(0xFF0073B7),
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                        RadioButtonSignUp(),
                      ],
                    ),
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
