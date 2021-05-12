import 'package:app_front/api/apiGetTeachers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app_front/widgets/alert.dart';
import 'package:app_front/widgets/clipper.dart';
import '../../helpers/globals.dart' as globals;

class ProfileStudent extends StatefulWidget {
  final int instructorId;

  ProfileStudent({Key key, @required this.instructorId}) : super(key: key);

  @override
  _ProfileStudentState createState() => _ProfileStudentState();
}

class _ProfileStudentState extends State<ProfileStudent> {
  //Iniciais do nome de  usuário
  String _getIniciais(String nome, String sobrenome) {
    if(sobrenome.substring(0, 3) == "da " || sobrenome.substring(0, 3) == "de ") {
      return nome[0] + sobrenome[3];
    }
    return nome[0] + sobrenome[0];
  }

  List alunosData;
  Future getStudentsForTeacher() async {
    var listStudents = await APIGetTeachers().getAllTeachers();
    alunosData = [];
    for (var aluno in listStudents.data) {
      if (aluno.instructor_id == globals.int_idfprofessor) {
        alunosData.add(aluno);
      }
    }
    return alunosData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ClipPath(
              clipper: Clipper(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
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
                ),
                child: Column(
                  children: <Widget>[
                    _appBar(),
                    SizedBox(height: 20),
                    Padding(
                        padding: EdgeInsets.only(left: 23),
                        child: Row(
                          children: [
                            _avatarCircle(),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: _contador(),
                              ),
                            ),
                          ],
                        )
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: _informationUser(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            Column(
              children: <Widget>[
                Text(
                  "Descrição",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 50, right: 50),
                  child: Text(
                    "${globals.vhr_descricao}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.only( top: 90, left: 40, right: 40,),
              child:buttons(context),
            ),
          ],
        ),
      ),
    );
  }
  //appbar
  Widget _appBar() {
    return Stack(
      children: [
        Positioned(
          child:AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: (){
                Navigator.of(context).pushReplacementNamed("/pageMainStudent");
              },
            ),
            title: Align(
              alignment: Alignment.centerRight,
              child:Text(
                "${globals.vhr_nome} ${globals.vhr_sobrenome}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.end,
              ),
            ),
          ),
        ),
      ],
    );
  }
  //circleAvatar
  Widget _avatarCircle() {
    return CircleAvatar(
      radius: 40,
      backgroundColor: Colors.white,
      child: Text(
        _getIniciais("${globals.vhr_nome}", "${globals.vhr_sobrenome}").toUpperCase(),
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w400,
          color: Colors.blue,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
  //User
  Widget _informationUser() {
    return Column(
      children: [
        Text(
          "${globals.vhr_email}",
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 10),
        Text(
          "${globals.vhr_whatsapp}",
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
  //alunos e data de pagamento
  Widget _contador() {
    return Container(
      height: 50,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("SEUS TREINOS", style: TextStyle(color: Colors.white),),
              SizedBox(height: 10),
              Text("4",style: TextStyle(color: Colors.white),),
            ],
          ),
          VerticalDivider(
            thickness: 2.0,
            color: Colors.white,
            indent: 3,
            endIndent: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("DATA DE PAGAMENTO",style: TextStyle(color: Colors.white),),
              SizedBox(height: 10),
              Text("30/5/2021", style: TextStyle(color: Colors.white),),
            ],
          ),
        ],
      ),
    );
  }
  //button
  Widget buttons(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        ElevatedButton(
          onPressed: (){
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) =>  Alert(),
            );
          },
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF4563DB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0),),
            ),
          ),
          child: Text("Excluir Conta", textAlign: TextAlign.center,),
        ),
        Spacer(
          flex: 2,
        ),
        ElevatedButton(
          onPressed: (){},
          style: ElevatedButton.styleFrom(
            primary:Color(0xFF4563DB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0),),
            ),
          ),
          child: Text("Editar Dados", textAlign: TextAlign.center,),
        ),
      ],
    );
  }
}