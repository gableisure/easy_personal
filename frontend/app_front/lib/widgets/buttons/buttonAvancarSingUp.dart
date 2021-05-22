import 'package:flutter/material.dart';

class ButtonAvancarSingUp extends StatefulWidget {
  final String labelButton;
  final Icon iconButton;

  ButtonAvancarSingUp({Key key, @required this.labelButton, this.iconButton}) : super(key: key);

  @override
  _ButtonAvancarSingUpState createState() => _ButtonAvancarSingUpState();
}

class _ButtonAvancarSingUpState extends State<ButtonAvancarSingUp> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 8.0, right: 8.0),
      child: Row(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "${widget.labelButton}",
                style: TextStyle(
                  fontSize: 22.0,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ),
            SizedBox( width: 3.0, ),
            widget.iconButton,
          ]
      ),
    );
  }
}
