import 'package:app_front/api/apiAddTrainingToStudent.dart';
import 'package:app_front/api/apiGetStudents.dart';
import 'package:app_front/widgets/alertCheckAddTrainingToStudent.dart';
import 'package:flutter/material.dart';
import 'package:app_front/helpers/globals.dart' as globals;
import '../../api/apiGetUserTrainings.dart';

class PageAddTrainingToStudent extends StatefulWidget {
  final int int_idatreino;

  const PageAddTrainingToStudent({Key key, this.int_idatreino})
      : super(key: key);

  @override
  _PageAddTrainingToStudentState createState() =>
      _PageAddTrainingToStudentState();
}

class _PageAddTrainingToStudentState extends State<PageAddTrainingToStudent> {
  ScrollController _scrollbar = ScrollController();


  List<dynamic> _treinos;
  List alunosData;

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
      body: FutureBuilder(
          future: getStudentsForTeacher(),
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
                    itemCount: alunosData.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.only(
                            bottom: 15, right: 10, left: 10, top: 5),

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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${alunosData[index].vhr_nome} ${alunosData[index].vhr_sobrenome}",
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green),
                                    ),
                                    onPressed: () async {

                                      var res = await APIAddTrainingToStudent().addTrainingToStudent(widget.int_idatreino, alunosData[index].int_idausuario);
                                      print("RES: $res");

                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (context) => AlertCheckAddTrainingToStudent(),
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


}
