import 'package:app_front/helpers/helpers.dart';
import 'package:app_front/screens/frontProfessor/profileTeacher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../helpers/globals.dart' as globals;

class SideMenu extends StatefulWidget {

  @override
  _SideMenuState createState() => _SideMenuState();

}

class _SideMenuState extends State<SideMenu> {
  //Iniciais do nome de  usuário
  String _getIniciais(String nome, String sobrenome) {
    if(sobrenome.substring(0, 3) == "da " || sobrenome.substring(0, 3) == "de ") {
      return nome[0] + sobrenome[3];
    }
    return nome[0] + sobrenome[0];
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //elevation: 80,
      child: ListView(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            padding: EdgeInsets.all(20),
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
                  ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50.0),
              ),
            ),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
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
                    Spacer(),
                    IconButton(
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "${globals.vhr_nome} ${globals.vhr_sobrenome}",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 8,),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "${globals.vhr_email}",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            //color: Colors.white,
            padding: EdgeInsets.all(20),
            child: ListView(
              children: <Widget>[
                /*Positioned(
                  left: 40,
                  right: 40,
                  bottom: 380,
                  child: Image.asset(
                    "images/2-removebg-preview.png",
                    width: 400,
                    height: 430,
                  ),
                ),*/
                TextButton(
                  onPressed: () {
                    if(globals.int_tipo == 0) {
                      Navigator.of(context).pushReplacementNamed("/profileStudent");
                    } else {
                      Navigator.of(context).pushReplacementNamed("/profileTeacher");
                    }
                  },
                  child: Container(
                    height: 50,
                    alignment: Alignment.centerLeft,
                    child: SizedBox.expand(
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        //CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.account_circle_outlined,
                          ),
                          Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: 4.0),
                          ),
                          Text(
                            "PERFIL",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey[300],
                  thickness: 2,
                  indent: 5,
                  endIndent: 5,
                ),
                TextButton(
                  onPressed: () async {
                    SharedPreferences.setMockInitialValues({});
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    String key = 'token';
                    final value = prefs.get(key) ?? 0;

                    if (value != '0') {

                      // Apaga os dados do usuário que deslogou
                      Helpers().deleteDataUser();

                      SnackBar snackbar = new SnackBar(
                        content: Text(
                          "Usuário Deslogado!!",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: Colors.green[600],
                      );
                      ScaffoldMessenger.of(context)
                          .showSnackBar(snackbar);
                      // print("saiu!!!");

                      Navigator.pushNamedAndRemoveUntil(
                          context, "/login", (route) => false);
                    } else {
                      print("ERRO!!!!");
                    }
                  },
                  child: Container(
                    height: 50,
                    alignment: Alignment.centerLeft,
                    child: SizedBox.expand(
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.exit_to_app_rounded,
                          ),
                          Padding(
                            padding:
                            EdgeInsets.symmetric(horizontal: 4.0),
                          ),
                          Text(
                            "SAIR",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
