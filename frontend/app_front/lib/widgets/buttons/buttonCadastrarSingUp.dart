import 'package:flutter/material.dart';

class ButtonCadastrarSingUp extends StatefulWidget {
  final String labelButton;

  ButtonCadastrarSingUp({Key key, @required this.labelButton}) : super(key: key);

  @override
  _ButtonCadastrarSingUpState createState() => _ButtonCadastrarSingUpState();
}

class _ButtonCadastrarSingUpState extends State<ButtonCadastrarSingUp> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 8.0, left: 8.0),
      child: Row(
          children: [
            Text(
              "${widget.labelButton}",
              style: TextStyle(
                fontSize: 22.0,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ]
      ),
    );
  }
}
