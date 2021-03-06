import 'package:flutter/material.dart';
import 'package:app_front/screens/frontProfessor/loginTeacher.dart';
import 'package:app_front/screens/frontAluno/loginStudent.dart';
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
    selectedRadioButton1 = 1;
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
  void dispose() {
    super.dispose();
    //radioTeacher.dispose();
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
          LoginTeacher(),
        if(selectedRadioButton2 == 2)
          LoginStudent(),
      ],
    );
  }
}