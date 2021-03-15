import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
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
              Container(
                padding: EdgeInsets.only(
                  top: 70,
                  left: 20,
                  right: 20,
                ),
                child: SizedBox(
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_rounded, color: Color(0xFFFFFFFF),),
                    iconSize: 30,
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed("/login");
                    },
                  ),
                ),
              ),
              Positioned(
                top: 200,
                child: Container(
                  padding: EdgeInsets.only(
                    top: 110,
                    left: 40,
                    right: 40,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
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
                       Text(
                         "Esqueceu Sua Senha?",
                         style: TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 20,
                           color:  Color(0xFF012777)
                         ),
                       ),
                        SizedBox(height: 15,),
                        Text(
                          "Não se precupe, enviaremos as informações necessárias para seu e-mail para que possa recuperar a senha.",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.5,
                            color: Color(0xFF012777),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 13.5,),
                        SizedBox(
                          child: Icon(
                            Icons.arrow_circle_down,
                            color:  Colors.deepOrange,
                            size: 70,
                          ),
                        ),
                        SizedBox(height: 15,),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              )
                            ),
                            prefixIcon: Icon(Icons.email_outlined),
                            labelText: "Digite seu E-mail",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Container(
                          height: 60,
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
                                    "Enviar",
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
                                  )
                                ],
                              ),
                              onPressed: () => {},
                            ),
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