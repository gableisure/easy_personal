import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProfileTeacher extends StatefulWidget {
  final int instructorId;

  ProfileTeacher({Key key, @required this.instructorId}) : super(key: key);

  @override
  _ProfileTeacherState createState() => _ProfileTeacherState();
}

class _ProfileTeacherState extends State<ProfileTeacher> {
  //Modal PageView
  void _modalPage(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(40.0),
            topRight: const Radius.circular(40.0),
          ),
        ),
        padding: EdgeInsets.only(top: 40, left: 35, right: 35),
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Spacer(),
                IconButton(
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.orange,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.4, 0.7, 0.9],
                colors: [
                  Color(0xFF3594DD),
                  Color(0xFF4563DB),
                  Color(0xFF5036D5),
                  Color(0xFF5B16D0),
                ]
              ),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30.0),
              ),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: AppBar(
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back_rounded, color: Color(0xFFFFFFFF),),
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed("/pageMainTeacher");
                      },
                    ),
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    title: Text("PERFIL"),
                    centerTitle: true,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(top: 20,left: 30, right: 10),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 5,
                      alignment: Alignment.centerLeft,
                      child: SizedBox.expand(
                        child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFF5B16D0),
                            shape: new RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30),),
                            ),
                          ),
                          onPressed: () {
                            _modalPage(context);
                          },
                          child: Center(
                              child: Text(
                                "Alunos",
                                textAlign: TextAlign.center,
                              ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(top: 20,left: 10, right: 30),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 5,
                      alignment: Alignment.centerLeft,
                      child: SizedBox.expand(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF5B16D0),
                            shape: new RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30),),
                            ),
                          ),
                          onPressed: () {
                            _modalPage(context);
                          },
                          child: Center(
                            child: Text(
                              "Pagamentos não recebidos",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(top: 20, left: 30, right: 10),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 5,
                      alignment: Alignment.centerLeft,
                      child: SizedBox.expand(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF5B16D0),
                            shape: new RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30),),
                            ),
                          ),
                          onPressed: () {
                            _modalPage(context);
                          },
                          child: Center(
                            child: Text(
                              "Editar Senha",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(top: 20, left: 10, right: 30),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 5,
                      alignment: Alignment.centerLeft,
                      child: SizedBox.expand(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF5B16D0),
                            shape: new RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30),),
                            ),
                          ),
                          onPressed: () {
                            _modalPage(context);
                          },
                          child: Center(
                            child: Text(
                              "Editar Dados Pessoais",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * .60,
                height: 60,
                child: SizedBox.expand(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF5B16D0),
                      shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25),),
                      ),
                    ),
                    child: Text("Excluir conta"),
                    onPressed: (){},
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}