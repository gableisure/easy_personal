import 'package:flutter/material.dart';
import 'package:app_front/api/apiGetStudents.dart';
import '../../helpers/globals.dart' as globals;

class ShowProfileStudent extends StatefulWidget {
  final int studentId;
  final String studentName;
  final String studentSobenome;
  final String studentPeso;
  final String stundentAltura;
  final String studentNumero;
  final String stundentDescricao;

  ShowProfileStudent({Key key, @required this.studentId, this.studentName, this.studentSobenome,
  this.studentNumero, this.studentPeso, this.stundentAltura, this.stundentDescricao})
      : super(key: key);

  @override
  _ShowProfileStudentState createState() => _ShowProfileStudentState();
}

class _ShowProfileStudentState extends State<ShowProfileStudent> {
  //iniciais
  String _getIniciais(String nome, String sobrenome) {
    if(sobrenome.substring(0, 3) == "da " || sobrenome.substring(0, 3) == "de ") {
      return nome[0] + sobrenome[3];
    }
    return nome[0] + sobrenome[0];
  }

  //appbar
  Widget _appBar(context) {
    return Stack(
      children: [
        Positioned(
          child:AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: (){
                Navigator.of(context).pushReplacementNamed("/pageMainTeacher");
              },
            ),
            title: Align(
              alignment: Alignment.centerRight,
              child: Container(
                child: Text(
                  '${widget.studentName}',
                  style: TextStyle(
                    fontSize: 21.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  //circleAvatar
  Widget _avatarCircle() {
    return CircleAvatar(
      radius: 40,
      backgroundColor: Colors.white,
      child: Text(
        _getIniciais("${widget.studentName}", "${widget.studentSobenome}").toUpperCase(),
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w400,
          color: Colors.blue,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  //alunosInfo
  Widget _alunoInfo() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("PESO DO ALUNO", style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,),
              SizedBox(height: 10),
              Text(widget.studentPeso + ' Kg', style: TextStyle(color: Colors.white, fontSize: 15)),
            ],
          ),
        ),
        Container(
          height: 54,
          child: VerticalDivider(
            thickness: 2,
            color: Colors.white,
          ),
        ),
        Expanded(
          flex: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("ALTURA DO ALUNO", style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,),
              SizedBox(height: 10),
              Text(widget.stundentAltura +' Cm', style: TextStyle(color: Colors.white, fontSize: 15),),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.55,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.1, 0.4, 0.7, 0.9],
                    colors: [
                      Color(0xFF3594DD),
                      Color(0xFF4563DB),
                      Color(0xFF5036D5),
                      Color(0xFF5B16D0),
                    ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  _appBar(context),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 25, right: 25),
                        child: _avatarCircle(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 50, right: 25),
                        child: Text(
                          widget.studentNumero,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 35),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 45),
                    child: _alunoInfo(),
                  ),
                ],
              ),
            ),
            SizedBox(height:30),
            Column(
              children: <Widget>[
                Text(
                  "Descrição",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 50, right: 50),
                  child: Text(
                    "${widget.stundentDescricao == '' ? "Aluno não tem descrição":'${widget.stundentDescricao}'}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}