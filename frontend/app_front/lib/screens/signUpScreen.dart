import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
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
                   onPressed: (){
                     Navigator.of(context).pushReplacementNamed("/login");
                   },
                 ),
               ),
             ),
              Positioned(
                top: 190,
                child: Container(
                  padding: EdgeInsets.only(
                    top: 30,
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
                    //reverse: false,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(25),),
                            ),
                            prefixIcon: Icon(Icons.account_circle_outlined),
                            labelText: "Nome Completo",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(25),),
                            ),
                            prefixIcon: Icon(Icons.email_outlined),
                            labelText: "E-mail",
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
                        TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            TelefoneInputFormatter(),
                          ],
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(25),),
                            ),
                            prefixIcon: Icon(Icons.phone),
                            labelText: "Celular",
                            hintText: "(##) ####-##### ",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            DataInputFormatter(),
                          ],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(25,)),
                            ),
                            prefixIcon: Icon(Icons.date_range_outlined),
                            labelText: "Data de Nascimento",
                            hintText: "dd/mm/aaaa",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
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
                                    "Cadastrar",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}