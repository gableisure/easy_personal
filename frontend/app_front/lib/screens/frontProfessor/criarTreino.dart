import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CriarTreino extends StatefulWidget {
  const CriarTreino({Key key}) : super(key: key);

  @override
  _CriarTreinoState createState() => _CriarTreinoState();
}

class _CriarTreinoState extends State<CriarTreino> {
  DateTime _dateTime;

  // Variaveis de controle para manipular os textos dos campos
  final _controllerTextFieldDataInicio = TextEditingController();
  final _controllerTextFieldDataFim = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.red,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 30, top: 25, right: 30, bottom: 80),
            color: Colors.white,
            child: Container(
              width: 100,
              // color: Colors.redAccent,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Criar treino",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.w500,
                        // fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  _buildTextFieldTitulo("Título"),
                  SizedBox(
                    height: 25,
                  ),
                  _buildTextFieldDataInicio("Data início", context),
                  SizedBox(
                    height: 25,
                  ),
                  _buildTextFieldDataFim("Data fim", context),
                  SizedBox(
                    height: 25,
                  ),
                  _buildTipoTreino(),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _buildTextFieldTitulo(String tituloTextField) => TextFormField(
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: tituloTextField,
        ),
      );

  Widget _buildTextFieldDataInicio(
          String tituloTextField, BuildContext context) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 300,
            child: TextFormField(
              controller: _controllerTextFieldDataInicio,
              enabled: false,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: tituloTextField,
                prefixIcon: Icon(Icons.calendar_today_outlined),
              ),
            ),
          ),
          Container(
            width: 50,
            child: TextButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                  firstDate: DateTime(2021),
                  lastDate: DateTime(2022),
                ).then((date) {
                  setState(() {
                    _dateTime = date;
                    _controllerTextFieldDataInicio.text = _dateTime.toString();
                  });
                });
              },
              child: Icon(Icons.edit),
            ),
          ),
        ],
      );

  Widget _buildTextFieldDataFim(String tituloTextField, BuildContext context) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 300,
            child: TextFormField(
              controller: _controllerTextFieldDataFim,
              enabled: false,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: tituloTextField,
                prefixIcon: Icon(Icons.calendar_today_outlined),
              ),
            ),
          ),
          Container(
            width: 50,
            child: TextButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                  firstDate: DateTime(2021),
                  lastDate: DateTime(2022),
                ).then((date) {
                  setState(() {
                    _dateTime = date;
                    _controllerTextFieldDataFim.text = _dateTime.toString();
                  });
                });
              },
              child: Icon(Icons.edit),
            ),
          ),
        ],
      );

  Widget _buildTipoTreino() {
    String dropdownValue = 'Tipo de treino';
    return Row(
      children: [
        DropdownButton<String>(
          value: dropdownValue,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.blueAccent),
          underline: Container(height: 2, color: Colors.blueAccent),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
            });
          },
          items: <String>['Tipo de treino', 'Semanal', 'Treino A, B, C']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );


  }



}
