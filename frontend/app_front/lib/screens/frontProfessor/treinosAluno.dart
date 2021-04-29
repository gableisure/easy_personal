import 'package:flutter/material.dart';

class TreinosAluno extends StatefulWidget {
  @override
  _TreinosAlunoState createState() => _TreinosAlunoState();
}

class _TreinosAlunoState extends State<TreinosAluno> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10, left: 10),
            child: Container(
              padding: EdgeInsets.all(10),
              height: 180,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 4,
                    offset:
                    Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.1, 0.8],
                  colors: [
                    Color(0xFF3594DD),
                    Color(0xFF4563DB),
                  ],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 14),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 170,
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Treino Boladão",
                            style: TextStyle(
                              fontSize: 22.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 18),
                          child: Text(
                            "Ativo",
                            style: TextStyle(
                                fontSize: 20.0
                            ),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(
                      height: 17.0,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "29/04/2021 a 29/05/2021",
                            style: TextStyle(
                                fontSize: 18.0
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 17.0,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: ElevatedButton(
                            onPressed: (){},
                            child: Text(
                              "Ver treino",
                              style: TextStyle(
                                  fontSize: 18.0
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),


                  ],

                ),
              ),
            ),
          ),
          SizedBox(
            height: 100.0,
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pushReplacementNamed("/pageMainTeacher");
                },
                child: Text(
                  "VOLTAR",
                  style: TextStyle(
                      fontSize: 18.0
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
