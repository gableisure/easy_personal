import 'package:app_front/screens/frontAluno/profileStudent.dart';
import 'package:app_front/screens/frontProfessor/profileTeacher.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ProfileTeacher(),
          ProfileStudent(),
        ],
      ),
    );
  }
}