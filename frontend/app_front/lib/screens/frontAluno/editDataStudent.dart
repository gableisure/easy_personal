
import 'package:flutter/material.dart';

class EditDataStudent extends StatefulWidget {
  const EditDataStudent({Key key}) : super(key: key);

  @override
  _EditDataStudentState createState() => _EditDataStudentState();
}

class _EditDataStudentState extends State<EditDataStudent> {

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
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 30, top: 25, right: 30, bottom: 80),
          color: Colors.white,
          child: Container(
            width: 100,
            child: Column(
              children: [
                _buildTituloSection("Editar dados"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTituloSection(String titulo) => Container(
    alignment: Alignment.bottomLeft,
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
