import 'package:app_front/screens/frontProfessor/tabBarWidget.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;


class PageMainTeacher extends StatefulWidget {
  @override
  _PageMainTeacherState createState() => _PageMainTeacherState();
}

class _PageMainTeacherState extends State<PageMainTeacher> {
  final uri = "api-easy-personal-dsv.herokuapp.com";
  List data;
  List alunosData;

  getAlunos() async {
    http.Response response = await http.get(Uri.https(uri, "/alunos"));
    data = json.decode(response.body);
    setState(() {
      alunosData = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getAlunos();
  }

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

  Widget buildAlunos() => Container(
    color: Color(0XFFF5F5F5),
    child: ListView.separated(
      padding: EdgeInsets.only(top: 30, left: 10, right: 10),
      separatorBuilder: (context, index) => Divider(),
      itemCount: alunosData.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: const Color(0XFFFFFFFF),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Color(0XFFCECECE),
            ),
          ),
          height: 150.0,
          padding: EdgeInsets.all(5.0),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0, top: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      maxRadius: 35.0,
                      child:
                        Text(
                          "${_getIniciais(alunosData[index]["vhr_nome"], alunosData[index]["vhr_sobrenome"])}",
                          style: TextStyle(
                            fontSize: 35.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                    ),
                  ],

                ),
              ),
              SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15,),
                  Text(
                    "${alunosData[index]["vhr_nome"]} ${alunosData[index]["vhr_sobrenome"]}",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.w700,
                      color: Color(0XFF2E2E2E),

                    ),
                  ),
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.assignment_outlined,
                            size: 40,
                          ),
                      ),
                      SizedBox(width: 5,),
                      TextButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.feedback_outlined,
                          size: 40,
                        ),
                      ),
                      SizedBox(width: 5,),
                      TextButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.face_outlined,
                          size: 40,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        );
      },
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
