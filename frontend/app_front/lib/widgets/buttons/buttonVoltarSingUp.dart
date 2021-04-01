import 'package:flutter/material.dart';

class ButtonVoltarSingUp extends StatefulWidget {
  final String labelButton;
  final Icon iconButton;

  ButtonVoltarSingUp({Key key, @required this.labelButton, @required this.iconButton}) : super(key: key);

  @override
  _ButtonVoltarSingUpState createState() => _ButtonVoltarSingUpState();
}

class _ButtonVoltarSingUpState extends State<ButtonVoltarSingUp> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 8.0),
      child: Row(
          children: [
            widget.iconButton,
            SizedBox( width: 5.0, ),
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
