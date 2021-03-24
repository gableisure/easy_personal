import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_front/screens/widgets/radioButtonSignUp.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: Colors.white,),
          onPressed: () => Navigator.of(context).pushReplacementNamed("/login"),
        ),
        title: Text("Criar Nova Conta"),
        centerTitle: true,
        titleSpacing: 3.0,
        backgroundColor: Color(0xFF0073B7),
        elevation: 50,
      ),
      body: SingleChildScrollView(
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