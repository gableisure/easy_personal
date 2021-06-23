import 'package:flutter/material.dart';

class DayExercises extends StatefulWidget {
  const DayExercises({Key key}) : super(key: key);

  @override
  _DayExercisesState createState() => _DayExercisesState();
}

class _DayExercisesState extends State<DayExercises> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.red,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTituloSection("Segunda"),
          ],
        ),
      ),
    );
  }

  Widget _buildTituloSection(String titulo) => Container(
        alignment: Alignment.bottomLeft,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 30, top: 10, right: 30),
        child: Text(
          titulo,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.w500,
            // fontFamily: 'Roboto',
          ),
        ),
      );
}
