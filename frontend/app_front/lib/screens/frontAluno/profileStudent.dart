import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.1, 0.4, 0.6, 0.9],
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
                        Navigator.of(context).pushReplacementNamed("/pageMainStudent");
                      },
                    ),
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    title: Text("PERFIL"),
                    centerTitle: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: Text(
                            _getIniciais('${globals.vhr_nome}', '${globals.vhr_sobrenome}').toUpperCase(),
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text("Dados do usuário", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Colors.white),),
                        SizedBox(height: 5,),
                        Text("Nome: ${globals.vhr_nome} ${globals.vhr_sobrenome}", style: TextStyle(color: Colors.white, fontSize: 14),
                          textAlign: TextAlign.center,),
                        SizedBox(height: 5,),
                        Text("Email: ${globals.vhr_email}", style: TextStyle(color: Colors.white, fontSize: 14),
                          textAlign: TextAlign.center,),
                      ],
                    ),
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
                              "Seu Professor",
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
                              "Data de Pagamentos",
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
              SizedBox(height: 30),
              Container(
                width: MediaQuery.of(context).size.width * .60,
                height: 60,
                child: SizedBox.expand(
                  child: TextButton(
                    onPressed: (){},
                    child: Text(
                      "Excluir conta",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
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