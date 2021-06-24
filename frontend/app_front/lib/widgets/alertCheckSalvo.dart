import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertCheckSalvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        ),
      ),
      titlePadding: EdgeInsets.only(top: 20, left: 30, right: 30),
      title: Text(
        "Em desenvolvimento...",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
      contentPadding: EdgeInsets.only(top: 15, left: 30, right: 30),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Icon(
              Icons.build,
              size: 100.0,
              color: Colors.grey
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     CupertinoPageRoute(
                    //       builder: (context) => CriarTreino(),
                    //     ));
                    Navigator.of(context).pop();
                  },
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
