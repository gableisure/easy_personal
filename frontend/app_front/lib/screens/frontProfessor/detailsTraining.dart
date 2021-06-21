import 'package:app_front/api/apiGetUserTrainings.dart';
import 'package:flutter/material.dart';

class DetailsTraining extends StatefulWidget {

  final int idTraining;

  const DetailsTraining({Key key, this.idTraining}) : super(key: key);

  @override
  _DetailsTrainingState createState() => _DetailsTrainingState();
}

class _DetailsTrainingState extends State<DetailsTraining> {

  List<dynamic> _treinos;

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
        ),
        body: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              children: [
                _buildTituloSection("Treino"),
                FutureBuilder(
                    future: getUserTraining(),
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
                              itemCount: 1,
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
                                              "Texto",
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
                                              "Texto",
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
                                              "Texto",
                                              style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w500,
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
                                              "Texto",
                                              style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w500,
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
              ],
            )
        )
    );
  }

  Widget _buildTituloSection(String titulo) => Container(
    alignment: Alignment.bottomLeft,
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.only(left: 30, top: 30, right: 30),
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

  Future getUserTraining() async {
    var listTrainings = await APIGetUserTrainings().getAllTrainings();
    _treinos = [];
    for (var treino in listTrainings.data) {
      // _defineTypeTraining(treino.int_idftipotreino);
      _treinos.add(treino);
    }
    return _treinos;
  }

}
