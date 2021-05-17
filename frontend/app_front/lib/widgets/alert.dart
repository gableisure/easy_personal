import 'package:flutter/material.dart';
import 'package:app_front/helpers/globals.dart' as globals;

class Alert extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0),),
      ),
      titlePadding: EdgeInsets.only(top: 25, left: 40, right: 40),
      title: Text(
        "${globals.vhr_nome} ${globals.vhr_sobrenome}, tem certeza que deseja nos abandonar?",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.justify,
      ),
      contentPadding: EdgeInsets.only(top: 15, left: 40, right: 40),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(
              "Caso opte por excluir a conta definitivamente, clique em continuar. Se não, clique em cancelar e continue conosco!!!",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Cancelar",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.blueAccent,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Continuar",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.blueAccent,
                    ),
                    textAlign: TextAlign.center,
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