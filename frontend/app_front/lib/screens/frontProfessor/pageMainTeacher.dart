import 'dart:math';
import 'package:app_front/screens/frontProfessor/treinosAluno.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_front/screens/frontProfessor/tabBarWidget.dart';
import 'package:app_front/api/apiGetStudents.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


class PageMainTeacher extends StatefulWidget {
  final int instructorId;

  PageMainTeacher({Key key, @required this.instructorId}) : super(key: key);

  @override
  _PageMainTeacherState createState() => _PageMainTeacherState();

}

class _PageMainTeacherState extends State<PageMainTeacher> {
  List alunosData;


  @override
  Widget build(BuildContext context) => TabBarWidget(
    title: 'Easy Personal',
    tabs: [
      Tab(icon: Icon(Icons.face), text: 'Alunos',),
      Tab(icon: Icon(Icons.assignment), text: 'Treinos'),
      Tab(icon: Icon(Icons.fitness_center), text: 'Exercícios'),
      Tab(icon: Icon(Icons.date_range), text: 'Agenda'),
      Tab(icon: Icon(Icons.attach_money), text: 'Financeiro'),
    ],
    children: [
      buildAlunos(),
      buildTreinos(),
      buildExercicios(),
      buildAgenda(),
      buildFinanceiro(),
    ],
  );



  Future getStudentsForTeacher() async {
    var listStudents = await APIGetStudents().getAllStudents();
    alunosData = [];
    for(var aluno in listStudents.data) {
      if(aluno.instructor_id == widget.instructorId) {
        alunosData.add(aluno);
      }
    }
    return alunosData;
  }

  // TODO: Implementar lógica para retornar o nome curso do aluno
  //String getFullName(String name, String surname) => "${name} ${}";

  Widget buildAlunos() => FutureBuilder(
      future: getStudentsForTeacher(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.none:
            return Container(
              width: 200.0,
              height: 200.0,
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                strokeWidth: 5.0,
              ),
            );
          default:
            if (snapshot.hasError) {
              return Center(child: Text("Erro ao carregar..."));
            } else {
              return ListView.builder(
                padding:
                    EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
                shrinkWrap: true,
                itemCount: alunosData.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 25),
                    height: 200,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [0.1, 0.8],
                          colors: [
                            Color(0xFF3594DD),
                            Color(0xFF4563DB),
                          ],
                        ),
                      ),
                      child: Column(
                        children: [

                          // nome e avatar
                          Container(
                            padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color(0XFFddd9ce),
                                  child: Text(
                                    _getIniciais(alunosData[index].vhr_nome,
                                          alunosData[index].vhr_sobrenome).toUpperCase(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 21.0,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 60.0,
                                ),
                                Text(
                                  alunosData[index].vhr_nome +
                                      " " +
                                      alunosData[index].vhr_sobrenome,
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    ),
                                  )
                                ),
                              ],
                            ),
                          ),

                          // Divisor do container
                          Divider(
                            color: Colors.grey,
                            thickness: 2,
                            indent: 15,
                            endIndent: 15,
                          ),

                          // icones
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) => TreinosAluno(instructorId: widget.instructorId, studentId: alunosData[index].int_idausuario, studentName: alunosData[index].vhr_nome)
                                        ),
                                      );
                                    },
                                    iconSize: 50,
                                    padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
                                    color: Colors.white,
                                    icon: Icon(Icons.assignment_outlined)),
                                IconButton(
                                    onPressed: () {},
                                    iconSize: 50,
                                    padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
                                    color: Colors.white,
                                    icon: Icon(Icons.all_inbox_outlined)),
                                IconButton(
                                    onPressed: () {},
                                    iconSize: 50,
                                    padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
                                    color: Colors.white,
                                    icon: Icon(Icons.feedback_outlined)),
                                IconButton(
                                    onPressed: () {},
                                    iconSize: 50,
                                    padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
                                    color: Colors.white,
                                    icon: Icon(Icons.account_circle_outlined))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
        }
      });

  /*  Funções buildAluno  */
  String _getIniciais(String nome, String sobrenome) {
    if(sobrenome.substring(0, 3) == "da " || sobrenome.substring(0, 3) == "de ") {
      return nome[0] + sobrenome[3];
    }
    return nome[0] + sobrenome[0];
  }

  Widget buildTreinos() => Center(
    child: Text("Texto"),
  );

  Widget buildExercicios() => Center(
    child: Text("Texto"),
  );

  Widget buildAgenda() => Center(
    child: Text("Texto"),
  );

  Widget buildFinanceiro() => Center(
    child: Text("Texto"),
  );


}