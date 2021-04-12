import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_front/widgets/buttons/radioButtonSignUp.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.1, 0.2],
                colors: [
                Color(0xFF3594DD),
                Color(0xFF4563DB),
              ],
            ),
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                child: AppBar(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back_rounded, color: Colors.white,),
                    onPressed: () => Navigator.of(context).pushReplacementNamed("/login"),
                  ),
                  title: Text("Criar Nova Conta",),
                  centerTitle: true,
                  titleSpacing: 3.0,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                ),
              ),
              Positioned(
                top: 140,
                child: Container(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 40,
                    right: 40,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(60),
                    ),
                  ),
                  child: SingleChildScrollView(
                    //reverse: false,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                       RadioButtonSignUp(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}