import 'package:flutter/material.dart';

class TreinoSemanal extends StatefulWidget {

  const TreinoSemanal({Key key}) : super(key: key);

  @override
  _StateTreinoSemanal createState() => _StateTreinoSemanal();
}

class _StateTreinoSemanal extends State<TreinoSemanal> {

  List<String> _diasDaSemana = ["Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado", "Domingo"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 30, bottom: 10),
      shrinkWrap: true,
      itemCount: _diasDaSemana.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.only(
              bottom: 15, right: 10, left: 10, top: 5),
          height: 110,
          child: Container(
            padding: EdgeInsets.only(
                bottom: 15, right: 20, left: 20, top: 18),
            decoration: BoxDecoration(
              color: Colors.white70,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 4,
                  offset: Offset(
                      0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${_diasDaSemana[index]}",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w500),
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text("Abrir"),
                            SizedBox(width: 5.0),
                            Icon(Icons.arrow_forward_outlined),
                          ],
                        ),
                    ),
                  ],
                ),
              ],


            ),
          ),
        );
      },
    );
  }
}
