import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/painting.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color(0xFFFD5C01),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 200,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.only(
                    top: 110,
                    left: 40,
                    right: 40,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(70),
                    ),
                  ),
                  child: SingleChildScrollView(
                    reverse: false,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(25),),
                            ),
                            prefixIcon: Icon(Icons.email_outlined),
                            labelText: "Email",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(25),),
                            ),
                            prefixIcon: Icon(Icons.vpn_key_outlined),
                            labelText: "Senha",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Container(
                          height: 40,
                          child: TextButton(
                            child: Text(
                              "Esqueceu a Senha?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0xFF012777),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushReplacementNamed("/forgotPassword");
                            },
                          ),
                          alignment: Alignment.centerRight,
                        ),
                        SizedBox(height: 20,),
                       Container(
                         height: 60,
                         decoration: BoxDecoration(
                           //color: Colors.deepOrange,
                           //borderRadius: BorderRadius.all(Radius.circular(25))
                         ),
                         child: SizedBox.expand(
                           child: ElevatedButton(
                             style: ElevatedButton.styleFrom(
                               primary: Color(0xFFFD5C01),
                               shape: new RoundedRectangleBorder(
                                 borderRadius: BorderRadius.all(Radius.circular(25),),
                               ),
                             ),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: <Widget>[
                                 Text(
                                   "Login",
                                   style: TextStyle(
                                     fontWeight: FontWeight.normal,
                                     fontSize: 20,
                                     color: Color(0xFFFFFFFF),
                                   ),
                                 ),
                                 Container(
                                   width: 28,
                                   height: 28,
                                   child: Icon(
                                     Icons.fitness_center,
                                     color: Color(0xFFFFFFFF),
                                   ),
                                 ),
                               ],
                             ),
                             onPressed: () => {},
                           ),
                         ),
                       ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                "Não tem uma conta?",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                  color:Color(0xFFFD5C01),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Container(
                                height: 40,
                                child: TextButton(
                                  child: Text(
                                    "Cadastrar-se",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Color(0xFF012777),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pushReplacementNamed("/signUp");
                                  },
                                ),
                              ),
                            ],
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
    );
  }
}
