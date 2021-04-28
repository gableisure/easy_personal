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
  List alunosData = [
    "Felipe",
    "Felipe",
    "Felipe",
    "Felipe",
    "Felipe",
    "Felipe",
    "Felipe",
    "Felipe",
    "Felipe",
    "Felipe",
  ];

  @override
  Widget build(BuildContext context) => TabBarWidget(
    title: 'Easy Personal',
    tabs: [
      Tab(icon: Icon(Icons.face), text: 'Alunos'),
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

  Widget buildAlunos() => FutureBuilder(
      future: getStudentsForTeacher(),
      builder: (context, snapshot) {
        switch(snapshot.connectionState){
          case ConnectionState.waiting:
          case ConnectionState.none:
            return  Container(
              width: 200.0,
              height: 200.0,
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                strokeWidth: 5.0,
              ),
            );
          default:
            if(snapshot.hasError) {
              return Center(child: Text("Erro ao carregar..."));
            }else{
              return ListView.builder(
                padding: EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
                shrinkWrap: true,
                itemCount: alunosData.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.fromLTRB(10,10,10,0),
                    height: 200,
                    width: double.maxFinite,
                    child: Card(
                      elevation: 5,
                      child: Text(alunosData[index].vhr_nome),
                    ),
                  );
                },
              );
            }
        }
      }
  );

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