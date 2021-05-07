import 'package:app_front/helpers/helpers.dart';
import 'package:app_front/screens/frontProfessor/profile.dart';
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

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //elevation: 80,
      child: ListView(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.1, 0.2],
                colors: [
                  Color(0xFF3594DD),
                  Color(0xFF4563DB),
                ],
              ),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Positioned(
                  child: Container(
                    padding: EdgeInsets.only(top: 15),
                    child: Column(
                      children: [
                        CircleAvatar(
                          maxRadius: 30,
                          child: Text("RB",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                              )
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("${globals.vhr_nome} ${globals.vhr_sobrenome}",
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            )
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(globals.vhr_token,
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 40,
                  right: 40,
                  bottom: 380,
                  child: Image.asset(
                    "images/2-removebg-preview.png",
                    width: 400,
                    height: 430,
                  ),
                ),
                Positioned(
                  top: 200,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.74,
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50),
                      ),
                    ),
                    child: ListView(
                      children: <Widget>[
                        TextButton(
                          onPressed: () async {
                            Navigator.of(context).pushReplacementNamed("/profile");
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
                          color: Colors.grey[100],
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
