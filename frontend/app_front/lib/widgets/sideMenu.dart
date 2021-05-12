import 'package:app_front/helpers/helpers.dart';
import 'package:app_front/screens/frontProfessor/profileTeacher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_front/widgets/clipper.dart';
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
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ClipPath(
            clipper: Clipper(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                padding: EdgeInsets.all(35),
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
                    ],
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
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: TextButton(
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
                ),
                Divider(
                  color: Colors.grey[300],
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: TextButton(
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
