import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      //elevation: 80,
      child: ListView(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.blueAccent,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Positioned(
                  //width: MediaQuery.of(context).size.width,
                  top: MediaQuery.of(context).size.width * 0.10,
                  left: MediaQuery.of(context).size.width * 0.30,
                  right: MediaQuery.of(context).size.width * 0.30,
                  bottom: MediaQuery.of(context).size.width * 1.30,
                  child: FlutterLogo(
                    size: 500,
                  ),
                ),
                Positioned(
                  top: 200,
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.74,
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(50), topLeft: Radius.circular(50),),
                    ),
                    child: ListView(
                      children: <Widget>[
                        ListTile(
                          leading: IconButton(icon: Icon(Icons.exit_to_app_rounded),
                            onPressed: () async {
                              SharedPreferences.setMockInitialValues({});
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              String key = 'token';
                              final value = prefs.get(key) ?? 0;

                              if(value != '0') {
                                SnackBar snackbar = new SnackBar(
                                  content: Text(
                                    "Usuário Deslogado!!",
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                  backgroundColor: Colors.green[600],
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackbar);
                                print("saiu!!!");
                                Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
                              } else {
                                print("ERRO!!!!");
                              }
                            },),
                          title: Text(
                            "Sair",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
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