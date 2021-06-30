import 'package:app_front/api/apiGetTrainingsByUserID.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TreinosAluno extends StatefulWidget {
  final int studentId;
  final String studentName;

  TreinosAluno({Key key, @required this.studentId, this.studentName})
      : super(key: key);

  @override
  _TreinosAlunoState createState() => _TreinosAlunoState();

}

class _TreinosAlunoState extends State<TreinosAluno> {

  List<dynamic> _treinos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Treinos"),
        centerTitle: true,
      ),
      body: buildTreinos(),
    );
  }


  Future getUserTraining() async {
    var listTrainings = await APIGetTrainingsByUserID().getAllTrainings(widget.studentId);
    _treinos = [];
    for (var treino in listTrainings.data) {
      _treinos.add(treino);
    }
    return _treinos;
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
                                    // "Texto",
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
                                    // "Texto",
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
                                    // "Texto",
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
                                      // Navigator.push(
                                      //     context,
                                      //     CupertinoPageRoute(
                                      //       builder: (context) =>
                                      //           DetailsTraining(
                                      //             idTraining:
                                      //             _treinos[index].int_idatreino,
                                      //           ),
                                      //     ));
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
