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
          mainAxisAlignment: MainAxisAlignment.center,
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
          SignUpTeacher(),
        if(selectedRadioButton2 == 2)
          SignUpStudent(),
      ],
    );
  }
}