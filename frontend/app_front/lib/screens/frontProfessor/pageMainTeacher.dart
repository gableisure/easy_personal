import 'package:app_front/models/Student.dart';
import 'package:app_front/screens/frontProfessor/tabBarWidget.dart';
import 'package:app_front/api/apiGetStudents.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


class PageMainTeacher extends StatefulWidget {
  final String token;

  PageMainTeacher({Key key, @required this.token}) : super(key: key);

  @override
  _PageMainTeacherState createState() => _PageMainTeacherState();

}

class _PageMainTeacherState extends State<PageMainTeacher> {
  List alunosData;

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
    alunosData = listStudents.data;
    return alunosData;
  }

  @override
  void initState() {
    super.initState();
    getStudentsForTeacher();
  }

  Widget buildAlunos() => Container(
    child: Column(
      children: [
        //Container pesquisa aluno
        Container(
          padding: EdgeInsets.only(top: 30.0, right: 10.0, left: 10.0),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25),),
              ),
              suffix: Icon(Icons.search_outlined),
              labelStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
          ),
        ),

        // //Container lista de alunos
        Container(
          padding: EdgeInsets.only(top: 30.0),
          child: FutureBuilder(
            future: getStudentsForTeacher(),
            builder: (context, snapshot){
              switch(snapshot.connectionState){
                case ConnectionState.waiting:
                case ConnectionState.none:
                    return Container(
                      width: 200.0,
                      height: 200.0,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 5.0,
                      ),
                    );
                default:
                  if(snapshot.hasError){
                    return Center(child: Text("Erro ao carregar..."));
                  } else {
                    return ListView.builder(
                      padding: EdgeInsets.only(top: 30, left: 10, right: 10),
                      shrinkWrap: true,
                      itemCount: alunosData.length,
                      itemBuilder: (context, index) {
                        return Text(
                          "${alunosData[index].vhr_nome}",
                        );
                      },
                    );
                  }
              }
            },
          ),
        ),
      ],
    ),
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
