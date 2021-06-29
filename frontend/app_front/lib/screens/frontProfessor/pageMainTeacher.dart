import 'package:app_front/api/apiAddTraining.dart';
import 'package:app_front/api/apiDeleteExercise.dart';
import 'package:app_front/api/apiGetExercises.dart';
import 'package:app_front/api/apiGetUserTrainings.dart';
import 'package:app_front/screens/frontProfessor/criarExercicio.dart';
import 'package:app_front/screens/frontProfessor/treinosAluno.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_front/screens/frontProfessor/tabBarWidget.dart';
import 'package:app_front/api/apiGetStudents.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:app_front/helpers/globals.dart' as globals;
import '../calendar.dart';
import 'criarTreino.dart';
import 'detailsTraining.dart';
import 'pageAddExerciseTraning.dart';
import 'showProfileStudent.dart';

class PageMainTeacher extends StatefulWidget {
  @override
  _PageMainTeacherState createState() => _PageMainTeacherState();
}

class _PageMainTeacherState extends State<PageMainTeacher> {
  List alunosData;
  List _exercises;
  List<dynamic> _treinos;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserTraining();
  }

  @override
  Widget build(BuildContext context) => TabBarWidget(
    title: 'Easy Personal',
    tabs: [
      Tab(
        icon: Icon(Icons.face),
        text: 'Alunos',
      ),
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
    for (var aluno in listStudents.data) {
      if (aluno.instructor_id == globals.int_idfprofessor) {
        alunosData.add(aluno);
      }
    }
    return alunosData;
  }

  Future getUserTraining() async {
    var listTrainings = await APIGetUserTrainings().getAllTrainings();
    _treinos = [];
    for (var treino in listTrainings.data) {
      _treinos.add(treino);
    }
    return _treinos;
  }

  Future getUserExercises() async {
    var listExercises = await APIGetExercises().getAllExercises();
    _exercises = [];
    for (var exercise in listExercises.data) {
      _exercises.add(exercise);
    }
    return _exercises;
  }

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
                padding: EdgeInsets.only(top: 30, bottom: 10),
                shrinkWrap: true,
                itemCount: alunosData.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(
                        bottom: 15, right: 10, left: 10, top: 5),
                    height: 180,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 4,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
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
                                  child: Text(
                                    _getIniciais(alunosData[index].vhr_nome,
                                        alunosData[index].vhr_sobrenome)
                                        .toUpperCase(),
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
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    )),
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
                            padding: EdgeInsets.only(top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) => TreinosAluno(
                                                studentId: alunosData[index]
                                                    .int_idausuario,
                                                studentName: alunosData[index]
                                                    .vhr_nome)),
                                      );
                                    },
                                    iconSize: 45,
                                    icon: Icon(Icons.assignment_outlined)),
                                IconButton(
                                    onPressed: () {},
                                    iconSize: 45,
                                    icon: Icon(Icons.all_inbox_outlined)),
                                IconButton(
                                    onPressed: () {},
                                    iconSize: 45,
                                    icon: Icon(Icons.feedback_outlined)),
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) => ShowProfileStudent(
                                            studentId: alunosData[index]
                                                .int_idausuario,
                                            studentName: alunosData[index]
                                                .vhr_nome + ' ' + alunosData[index].vhr_sobrenome,
                                            studentSobenome: alunosData[index].vhr_sobrenome,
                                            studentNumero: alunosData[index].vhr_whatsapp,
                                            studentPeso: alunosData[index].num_peso,
                                            stundentAltura: alunosData[index].num_altura,
                                            stundentDescricao: alunosData[index].vhr_descricao,)),
                                      );
                                    },
                                    iconSize: 45,
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

  // Retorna uma String com as iniciais do nome e sobrenome do usuário
  String _getIniciais(String nome, String sobrenome) {
    if (sobrenome.substring(0, 3) == "da " ||
        sobrenome.substring(0, 3) == "de ") {
      return nome[0] + sobrenome[3];
    }
    return nome[0] + sobrenome[0];
  }

  ScrollController _scrollbar = ScrollController();

  Widget buildTreinos() {
    return Scaffold(
      body: FutureBuilder(
          future: getUserTraining(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
                return Center(
                  child: Container(
                    width: 200.0,
                    height: 200.0,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      strokeWidth: 5.0,
                    ),
                  ),
                );
              default:
                if (snapshot.hasError) {
                  return Center(child: Text("Erro ao carregar..."));
                } else {
                  return ListView.builder(
                    padding: EdgeInsets.only(top: 30, bottom: 10),
                    controller: _scrollbar,
                    shrinkWrap: true,
                    itemCount: _treinos.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.only(
                            bottom: 15, right: 10, left: 10, top: 5),
                        height: 210,
                        child: Container(
                          padding: EdgeInsets.only(
                              bottom: 15, right: 20, left: 20, top: 18),
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 4,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    _treinos[index].vhr_nome,
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${formatDate(_treinos[index].dtt_inicio)} a ${formatDate(_treinos[index].dtt_fim)}",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${_defineTypeTraining(_treinos[index].int_idftipotreino)}",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 13,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                            builder: (context) =>
                                                DetailsTraining(
                                              idTraining:
                                                  _treinos[index].int_idatreino,
                                            ),
                                          ));
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          "Ver treino",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
            }
          }),
      floatingActionButton: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 50),
          child: Container(
            child: FloatingActionButton.extended(
              onPressed: () async {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => CriarTreino(),
                    ));
              },
              elevation: 3,
              icon: Icon(Icons.add),
              backgroundColor: Colors.green,
              label: Text(
                "Criar",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /*   Funções buildTreinos     */
  String _defineTypeTraining(int typeTraining) {
    if (typeTraining == 1) {
      return "Treino semanal";
    } else {
      return "Treino ABCDE";
    }
  }

  // Método para formatar a data para o tipo dd/mm/yyyy
  String formatDate(String date) {
    String dia, mes, ano;

    dia = date.substring(5, 7);
    mes = date.substring(8, 10);
    ano = date.substring(0, 4);

    return "${mes}/${dia}/${ano}";
  }

  Widget _buildTituloSection(String titulo) => Container(
    alignment: Alignment.bottomLeft,
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.only(left: 30, top: 30, right: 30),
    child: Text(
      titulo,
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Colors.black,
        fontSize: 28.0,
        fontWeight: FontWeight.w500,
        // fontFamily: 'Roboto',
      ),
    ),
  );

  Widget buildExercicios() => Scaffold(
    body: FutureBuilder(
    future: getUserExercises(),
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
              padding: EdgeInsets.only(top: 30, bottom: 10),
              shrinkWrap: true,
              controller: _scrollbar,
              itemCount: _exercises.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.only(
                      bottom: 15, right: 10, left: 10, top: 5),
                  height: 230,
                  child: Container(
                    padding: EdgeInsets.only(
                        bottom: 15, right: 20, left: 20, top: 18),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 4,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              _exercises[index].vhr_nome,
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Text(
                              "Grupo muscular: ${_exercises[index].nome_categoria}",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            Text(
                              "Séries/repetições: ${_exercises[index].vhr_seriesrepeticoes}",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            Text(
                              "Intervalo: ${_exercises[index].int_intervalor.toString()}s",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => PageAddExerciseTraining(int_idaexercicio: _exercises[index].int_idaexercicio),
                                    ));
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "Adicionar a treino",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                              ),
                              onPressed: () async {
                                // Navigator.push(
                                //     context,
                                //     CupertinoPageRoute(
                                //       builder: (context) => DetailsTraining(
                                //         idTraining:
                                //         _treinos[index].int_idatreino,
                                //       ),
                                //     ));

                                var res = await APIDeleteExercise().deleteExercise();
                                // print("delete: $res");

                                print("Clicou");
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "Excluir",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
      }
    }),
    floatingActionButton: Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 50),
        child: Container(
          child: FloatingActionButton.extended(
            onPressed: () async {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => CriarExercicio(),
                  ));
            },
            elevation: 3,
            icon: Icon(Icons.add),
            backgroundColor: Colors.green,
            label: Text(
              "Criar",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17.0,
              ),
            ),
          ),
        ),
      ),
    ),
  );

  // Container(
  //   padding: EdgeInsets.only(right: 20, bottom: 35),
  //   child: FloatingActionButton.extended(
  //     onPressed: () {
  //       Navigator.push(
  //           context,
  //           CupertinoPageRoute(
  //             builder: (context) => CriarExercicio(),
  //           ));
  //     },
  //     elevation: 3,
  //     icon: Icon(Icons.add),
  //     backgroundColor: Colors.green,
  //     label: Text(
  //       "Criar",
  //       style: TextStyle(
  //         fontWeight: FontWeight.bold,
  //         fontSize: 17.0,
  //       ),
  //     ),
  //   ),
  // ),

  Widget buildAgenda() => Center(
    child: Calendar(),
  );

  Widget buildFinanceiro() => Center(
    child: Text("Texto"),
  );
}