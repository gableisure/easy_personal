import 'package:app_front/api/apiForgotPassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  String email;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        //reverse: true,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4],
              colors: [
                Colors.lightBlueAccent, Colors.blueAccent
              ],
            ),
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                child: AppBar(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back_rounded, color: Color(0xFFFFFFFF),),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed("/login");
                    },
                  ),
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                ),
              ),
              Positioned(
                top: 200,
                child: Container(
                  padding: EdgeInsets.only(
                    top: 60,
                    left: 40,
                    right: 40,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(60),
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
                            color: Colors.blueGrey[900],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 18,),
                        Form(
                          key: _formKey,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                              ),
                              prefixIcon: Icon(Icons.email_outlined),
                              labelText: "Digite seu E-mail",
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                              ),
                            ),
                            validator: (String val) {
                              if(val.isEmpty) {
                                return "Email Obrigatório";
                              }
                              return null;
                            },
                            onSaved: (String val) {
                              email = val;
                            },
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          height: 60,
                          child: SizedBox.expand(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.lightBlue,
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
                              onPressed: () async {
                                if(!_formKey.currentState.validate()) {
                                  return null;
                                }
                                _formKey.currentState.save();
                                var response = await APIPassword().forgotPassword(email);

                                if(response.status != "success") {
                                  print("Email de Usuário não Existe!!!!");
                                } else {
                                  print(response.data);
                                  print("Enviado com Sucesso!!!");
                                }
                              },
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