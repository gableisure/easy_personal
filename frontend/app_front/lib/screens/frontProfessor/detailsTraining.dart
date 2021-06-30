import 'package:app_front/api/apiGetTrainingByID.dart';
import 'package:app_front/widgets/treinoSemanal.dart';
import 'package:flutter/material.dart';

class DetailsTraining extends StatefulWidget {

  final int idTraining;

  const DetailsTraining({Key key, this.idTraining}) : super(key: key);

  @override
  _DetailsTrainingState createState() => _DetailsTrainingState();
}

class _DetailsTrainingState extends State<DetailsTraining> {

  List<dynamic> _treino;
  ScrollController _scrollbar = ScrollController();


  Future getTrainingByID() async {
    var training = await APIGetTraningByID().getTrainingByID(widget.idTraining);
    _treino = [];
    for (var treino in training.data) {
      _treino.add(treino);
    }
    return _treino;
    print(training);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
        title: Text(
          "Treino",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
      future: getTrainingByID(),
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
                shrinkWrap: true,
                controller: _scrollbar,
                itemCount: _treino.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: EdgeInsets.only(
                            bottom: 15, right: 20, left: 20, top: 18),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 4,
                              offset: Offset(
                                  0, 3), // changes position of shadow
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
                                  "${_treino[index].vhr_nome}",
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
                                  "${formatDate(_treino[index].dtt_inicio)} a ${formatDate(_treino[index].dtt_fim)}",
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
                                  "${_defineTypeTraining(_treino[index].int_idftipotreino)}",
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              // "",
                              "${_treino[index].vhr_observacao}",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _buildTituloSection("Exercícios"),
                      TreinoSemanal(),
                    ],
                  );
                },
              );
            }
        }
      }),
    );
  }

  Widget _buildTituloSection(String titulo) => Container(
    alignment: Alignment.bottomLeft,
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.only(left: 30, top: 10, right: 30),
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

  String _defineTypeTraining(int typeTraining) {
    if(typeTraining == 1){
      return "Treino semanal";
    }else{
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
