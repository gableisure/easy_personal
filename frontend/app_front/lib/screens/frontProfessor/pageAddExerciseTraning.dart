import 'package:flutter/material.dart';

import '../../api/apiGetUserTrainings.dart';
import '../../api/APIAddExerciseToTraining.dart';
import 'package:app_front/widgets/alertCheckSalvoAddToTraining.dart';

class PageAddExerciseTraining extends StatefulWidget {
  final int int_idaexercicio;

  const PageAddExerciseTraining({Key key, this.int_idaexercicio})
      : super(key: key);

  @override
  _PageAddExerciseTrainingState createState() =>
      _PageAddExerciseTrainingState();
}

class _PageAddExerciseTrainingState extends State<PageAddExerciseTraining> {
  ScrollController _scrollbar = ScrollController();


  List<dynamic> _treinos;

  Future getUserTraining() async {
    var listTrainings = await APIGetUserTrainings().getAllTrainings();
    _treinos = [];
    for (var treino in listTrainings.data) {
      _treinos.add(treino);
    }
    return _treinos;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.red,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        flexibleSpace: Container(
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
                ]
            ),
            //borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
        ),
        title: Text("Atribuir exercício ao treino", style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),),
        centerTitle: true,
      ),
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
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.green),
                                    ),
                                    onPressed: () async {

                                      var res = await APIAddExerciseToTraining().addExerciseToTraining(_treinos[index].int_idatreino, widget.int_idaexercicio);

                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (context) => AlertCheckSalvoAddToTraining(),
                                      );

                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          "Adicionar",
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
}
