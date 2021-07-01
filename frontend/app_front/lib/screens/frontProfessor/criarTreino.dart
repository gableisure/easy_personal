import 'package:app_front/api/apiAddTraining.dart';
import 'package:app_front/widgets/alertCheckSalvo.dart';
import 'package:app_front/widgets/alertCheckSaveTraining.dart';
import 'package:app_front/widgets/alertErroTraining.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CriarTreino extends StatefulWidget {

  @override
  _CriarTreinoState createState() => _CriarTreinoState();
}

class _CriarTreinoState extends State<CriarTreino> {
  DateTime _dateTime;

  // Map para salvar os dados do treino
  Map _treino = {};
  String _tipoTreino;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Variaveis de controle para manipular os textos dos campos
  final _controllerTextFieldDataInicio = TextEditingController();
  final _controllerTextFieldTitulo = TextEditingController();
  final _controllerTextFieldDataFim = TextEditingController();
  final _controllerTextFieldObservacoes = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.red,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.1, 0.4, 0.7, 0.9],
                  colors: [
                    Color(0xFF3594DD),
                    Color(0xFF4563DB),
                    Color(0xFF5036D5),
                    Color(0xFF5B16D0),
                  ]
              ),
              //borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            padding: EdgeInsets.only(left: 30, top: 25, right: 30, bottom: 80),
            color: Colors.white,
            child: Form(
              key: _formKey,
              child: Container(
                width: 100,
                // color: Colors.redAccent,
                child: Column(
                  children: [
                    _buildTituloSection("Criar treino"),
                    SizedBox(
                      height: 13,
                    ),
                    _buildTextFieldTitulo("Nome"),
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
                    SizedBox(
                      height: 25,
                    ),
                    _buildObservacoes(),
                    SizedBox(
                      height: 25,
                    ),
                    // _buildTituloSection("Exercícios"),
                    SizedBox(
                      height: 25,
                    ),
                    // _buildButtonCriarExercicio(),
                    _buildButtonSalvar(),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget _buildTituloSection(String titulo) =>
      Container(
        alignment: Alignment.bottomLeft,
        child: Text(
          titulo,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.w500,
            // fontFamily: 'Roboto',
          ),
        ),
      );

  Widget _buildTextFieldTitulo(String tituloTextField) =>
      TextFormField(
        // controller: _controllerTextFieldTitulo,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: tituloTextField,
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return "Título Obrigatória";
          }
          return null;
        },
        onSaved: (String value) {
          _treino['vhr_nome'] = value;
        },
      );

  Widget _buildTextFieldDataInicio(String tituloTextField,
      BuildContext context) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 250,
            child: TextFormField(
              controller: _controllerTextFieldDataInicio,
              enabled: false,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: tituloTextField,
                prefixIcon: Icon(Icons.calendar_today_outlined),
              ),
              validator: (String value) {
                if (value.isEmpty) {
                  return "Data Obrigatória";
                }
                return null;
              },
              onSaved: (String value) {
                _treino['dtt_inicio'] = invertDate(value);
              },
            ),
          ),
          Container(
            child: TextButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                  firstDate: DateTime(2021),
                  lastDate: DateTime(2022),
                ).then((date) {
                  setState(() {
                    _controllerTextFieldDataInicio.text =
                        formatDate(date.toString());
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
            width: 250,
            child: TextFormField(
              controller: _controllerTextFieldDataFim,
              enabled: false,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: tituloTextField,
                prefixIcon: Icon(Icons.calendar_today_outlined),
              ),
              validator: (String value) {
                if (value.isEmpty) {
                  return "Data Obrigatória";
                }
                return null;
              },
              onSaved: (String value) {
                _treino['dtt_fim'] = invertDate(value);
              },
            ),
          ),
          Container(
            child: TextButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                  firstDate: DateTime(2021),
                  lastDate: DateTime(2022),
                ).then((date) {
                  setState(() {
                    _controllerTextFieldDataFim.text =
                        formatDate(date.toString());
                  });
                });
              },
              child: Icon(Icons.edit),
            ),
          ),
        ],
      );

  // Widget _buildTipoTreino() {
  //   //String dropdownValue = 'Tipo de treino';
  //   return Row(
  //     children: [
  //       DropdownButton<String>(
  //           items: _tiposDeTreino.map((String dropDownStringItem) {
  //             return DropdownMenuItem<String>(
  //               value: dropDownStringItem,
  //               child: Text(dropDownStringItem),
  //             );
  //           }).toList(),
  //           onChanged: (String novoItemSelecionado) {
  //             _dropDownItemSelected(novoItemSelecionado);
  //             setState(() {
  //               this._itemSelecionado = novoItemSelecionado;
  //             });
  //           },
  //           value: _itemSelecionado,
  //       ),
  //     ],
  //   );
  // }


  Widget _buildTipoTreino() {
    var _list = ["Treino Semanal", "Treino A B C D E"];
    return DropdownButtonFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        prefixIcon: Icon(Icons.people_alt_rounded),
        labelText: "Tipo de treino",
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
        isDense: true,
      ),
      value: _tipoTreino,
      items: _list.map<DropdownMenuItem<String>>((String drop) {
        return DropdownMenuItem<String>(
          child: Text(drop),
          value: drop,
        );
      }).toList(),
      validator: (String value) {
        if (value == null || value.isEmpty) {
          return "Escolha um tipo de treino";
        }
        return null;
      },
      onChanged: (String value) {
        setState(() {
          _treino['int_idftipotreino'] = value;
        });
      },
      onSaved: (String value) {
        _treino['int_idftipotreino'] = value;
        print("debug treino: ${_treino['int_idftipotreino']}");
      },
    );
  }

  // descrição
  Widget _buildObservacoes() {
    return TextFormField(
      // controller: _controllerTextFieldObservacoes,
      keyboardType: TextInputType.multiline,
      maxLength: 255,
      maxLines: 10,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        labelText: "Observações",
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
      onSaved: (String value) {
        _treino['vhr_observacao'] = value;
      },
    );
  }
  //
  // Widget _buildButtonCriarExercicio() =>
  //     Column(
  //       mainAxisAlignment: MainAxisAlignment.end,
  //       crossAxisAlignment: CrossAxisAlignment.end,
  //       children: [
  //         Container(
  //           padding: EdgeInsets.only(right: 20, bottom: 35),
  //           child: FloatingActionButton.extended(
  //             onPressed: () {},
  //             elevation: 3,
  //             icon: Icon(Icons.add),
  //             backgroundColor: Colors.green,
  //             label: Text(
  //               "Adicionar exercício",
  //               style: TextStyle(
  //                 fontSize: 17.0,
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     );

  Widget _buildButtonSalvar() =>
      Container(
        width: 500.0,
        height: 50.0,
        child: ElevatedButton(
          onPressed: () async {

            if (!_formKey.currentState.validate()) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => AlertErroAddTraining(),
              );
              return;
            }

            _formKey.currentState.save();

            _defineTypeTraining();
            invertDate(_treino["dtt_inicio"]);
            invertDate(_treino["dtt_fim"]);
            var res = await APIAddTraining().addTraining(_treino);

            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => AlertCheckSaveTraining(),
            );
          },
          child: Text(
            'Salvar',
            style: TextStyle(fontSize: 19.0),
          ),
        ),
      );

  // Método para formatar a data para o tipo dd/mm/yyyy
  String formatDate(String date) {
    String dia, mes, ano;

    dia = date.substring(8, 10);
    mes = date.substring(5, 7);
    ano = date.substring(0, 4);

    return "${dia}/${mes}/${ano}";
  }

  // Método para formatar a data para o tipo aceito pela API mm/dd/yyyy
  String invertDate(String date) {
    String dia, mes, ano;

    dia = date.substring(0, 2);
    mes = date.substring(3, 5);
    ano = date.substring(6, 10);

    return "${mes}/${dia}/${ano}";
  }

  _defineTypeTraining() {
    if(_treino['int_idftipotreino'] == "Treino semanal"){
      _treino['int_idftipotreino'] = 1;
    }else{
      _treino['int_idftipotreino'] = 2;
    }
  }

}