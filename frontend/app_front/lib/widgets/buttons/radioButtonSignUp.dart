import 'package:flutter/material.dart';
import 'package:app_front/screens/frontProfessor/signUpTeacher.dart';
import 'package:app_front/screens/frontAluno/signUpStudent.dart';

class RadioButtonSignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyStateRadioButton();
  }
}

class _MyStateRadioButton extends State<RadioButtonSignUp> {
  int selectedRadioButton1;
  int selectedRadioButton2;

  var _userObject = {};

  _defineUserObjectTeacher() {
    _userObject['int_tipo'] = 1;
  }

  _defineUserObjectStudent() {
    _userObject['int_tipo'] = 0;
  }

  @override
  void initState() {
    super.initState();
    selectedRadioButton1 = 0;
    selectedRadioButton2 = 0;
  }
  //professor
  setSelectedStateRadioTeacher(int val) {
    setState(() {
      selectedRadioButton1 = val;
      selectedRadioButton2 = 0;
    });
  }
  //aluno
  setSelectedStateRadioStudent(int val) {
    setState(() {
      selectedRadioButton1 = 0;
      selectedRadioButton2 = val;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Radio(
              value: 1,
              groupValue: selectedRadioButton1,
              onChanged: (val) {
                setSelectedStateRadioTeacher(val);
              },
            ),
            Text("PERSONAL"),
            Radio(
              value: 2,
              groupValue: selectedRadioButton2,
              onChanged: (val) {
                setSelectedStateRadioStudent(val);
              },
            ),
            Text("ALUNO"),
            SizedBox(height: 20,),
          ],
        ),
        if(selectedRadioButton1 == 1)
          _buttonTeacher(),
        if(selectedRadioButton2 == 2)
          _buttonAluno(),
      ],
    );
  }
  //button student
  Widget _buttonAluno() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed("/login");
          },
          child: Text(
            "Cancelar",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.blueAccent,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        TextButton(
          onPressed: () {
            _defineUserObjectStudent();
            Navigator.of(context).pushReplacementNamed("/signUpScreen");
          },
          child: Text(
            "Continuar",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.blueAccent,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
  //button teacher
  Widget _buttonTeacher() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed("/login");
          },
          child: Text(
            "Cancelar",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.blueAccent,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        TextButton(
          onPressed: () {
            _defineUserObjectTeacher();
            Navigator.of(context).pushReplacementNamed("/signUpScreenTeacher");
          },
          child: Text(
            "Continuar",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.blueAccent,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}