import 'package:app_front/api/apiGetStudentTrainings.dart';
import 'package:app_front/api/apiGetUserTrainings.dart';
import 'package:app_front/screens/frontProfessor/tabBarWidget.dart';
import 'package:flutter/material.dart';


class PageMainStudent extends StatefulWidget {
  @override
  _PageMainStudentState createState() => _PageMainStudentState();
}

class _PageMainStudentState extends State<PageMainStudent> {

  List<dynamic> _treinos;

  @override
  Widget build(BuildContext context) => TabBarWidget(
    title: 'Easy Personal',
    tabs: [
      Tab(icon: Icon(Icons.fitness_center), text: 'Treinos'),
      Tab(icon: Icon(Icons.announcement), text: 'Feedback'),
      Tab(icon: Icon(Icons.inbox), text: 'Treinos Arquivados'),
      ],
    children: [
      buildTreinos(),
      buildFeedback(),
      buildTreinosArquivados(),
    ],
  );

  // Widget buildTreinos() =>
  //     Scaffold(
  //       body: SingleChildScrollView(
  //         child: Column(
  //           children: [
  //             // _buildContainerInfo(),
  //             // _buildListaTreinos("Treino de aquecimento", "03/05/2021",
  //             //     "03/06/2021", "ATIVO", Colors.green),
  //             // _buildListaTreinos("Treino de introdução", "03/04/2021",
  //             //     "03/05/2021", "INATIVO", Colors.red),
  //             // _buildListaTreinos("Treino teste", "25/03/2021", "01/04/2021",
  //             //     "INATIVO", Colors.red),
  //             // _buildListaTreinos("Treino teste", "25/03/2021", "01/04/2021",
  //             //     "INATIVO", Colors.red),
  //             // _buildListaTreinos("Treino teste", "25/03/2021", "01/04/2021",
  //             //     "INATIVO", Colors.red),
  //           ],
  //         ),
  //       ),
  //     );

  // Widget _buildContainerPesquisa() => Container(
  //   color: Colors.blue,
  //   width: MediaQuery.of(context).size.width,
  //   padding: EdgeInsets.only(top: 20, right: 10, bottom: 20, left: 10),
  //   child: TextField(
  //     decoration: InputDecoration(
  //       suffixIcon: Icon(Icons.search),
  //       border: OutlineInputBorder(
  //         borderRadius: BorderRadius.all(Radius.circular(10.0)),
  //       ),
  //       fillColor: Colors.white,
  //       filled: true,
  //       labelText: 'Pesquisar treino',
  //     ),
  //   ),
  // );

  // Widget _buildContainerInfo() => Container(
  //   width: MediaQuery.of(context).size.width,
  //   padding: EdgeInsets.only(top: 20, right: 10, left: 20),
  //   child: Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       // Container qtd. de treinos
  //       Container(
  //         child: Row(
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Icon(
  //               Icons.bar_chart,
  //               color: Colors.blueAccent,
  //               size: 30,
  //             ),
  //             Text(
  //               "3 Treinos",
  //               style: TextStyle(
  //                 color: Colors.grey,
  //                 fontWeight: FontWeight.w600,
  //                 fontSize: 15,
  //               ),
  //             ),
  //           ],
  //         ),
  //       )
  //     ],
  //   ),
  // );

  // Widget _buildListaTreinos(String nomeTreino, String dataInicio,
  //     String dataFim, String status, Color color) =>
  //     Padding(
  //       padding: EdgeInsets.only(right: 10, left: 10, top: 20),
  //       child: Container(
  //         padding: EdgeInsets.only(bottom: 15, left: 10, top: 5),
  //         width: MediaQuery.of(context).size.width,
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           boxShadow: [
  //             BoxShadow(
  //               color: Colors.grey.withOpacity(0.5),
  //               spreadRadius: 3,
  //               blurRadius: 4,
  //               offset: Offset(0, 3), // changes position of shadow
  //             ),
  //           ],
  //           borderRadius: BorderRadius.all(
  //             Radius.circular(15),
  //           ),
  //         ),
  //         child: Padding(
  //           padding: EdgeInsets.only(top: 14),
  //           child: Column(
  //             children: [
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Container(
  //                     width: 270,
  //                     padding: EdgeInsets.only(left: 10),
  //                     child: Text(
  //                       nomeTreino,
  //                       style: TextStyle(
  //                         fontSize: 20.0,
  //                       ),
  //                     ),
  //                   ),
  //                   Container(
  //                     padding: EdgeInsets.only(right: 18),
  //                     child: Chip(
  //                       labelPadding: EdgeInsets.all(2.0),
  //                       label: Text(
  //                         status,
  //                         style: TextStyle(
  //                           color: Colors.white,
  //                         ),
  //                       ),
  //                       backgroundColor: color,
  //                       elevation: 6.0,
  //                       shadowColor: Colors.grey[60],
  //                       padding: EdgeInsets.all(8.0),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               SizedBox(
  //                 height: 17.0,
  //               ),
  //               Row(
  //                 children: [
  //                   Container(
  //                     padding: EdgeInsets.only(left: 10),
  //                     child: Text(
  //                       "${dataInicio} a ${dataFim}",
  //                       style: TextStyle(
  //                         fontSize: 13.0,
  //                         color: Colors.blueGrey,
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               SizedBox(
  //                 height: 17.0,
  //               ),
  //               Row(
  //                 children: [
  //                   Container(
  //                     padding: EdgeInsets.only(left: 8),
  //                     child: ElevatedButton(
  //                       onPressed: () {},
  //                       child: Text(
  //                         "Ver treino",
  //                         style: TextStyle(fontSize: 18.0),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     );

  Future getUserTraining() async {
    var listTrainings = await APIGetStudentTrainings().getAllTrainings();
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

  Widget buildFeedback() => Center(
    child: Text(
      "Page Feedbacks",
      style: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.w500,
        color: Colors.grey
      ),

    ),
  );

  Widget buildTreinosArquivados() => Center(
    child: Text(
      "Page Training Archived",
      style: TextStyle(
      fontSize: 25.0,
      fontWeight: FontWeight.w500,
      color: Colors.grey
    ),
  )
  );

}
