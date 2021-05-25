import 'package:app_front/widgets/alertCheckSalvo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CriarTreino extends StatefulWidget {

  @override
  _CriarTreinoState createState() => _CriarTreinoState();
}

class _CriarTreinoState extends State<CriarTreino> {
  DateTime _dateTime;

  // Variaveis de controle para manipular os textos dos campos
  final _controllerTextFieldDataInicio = TextEditingController();
  final _controllerTextFieldDataFim = TextEditingController();

  var _tiposDeTreino = ['Tipo de treino', 'Semanal', 'Treino A, B, C'];
  var _itemSelecionado = 'Tipo de treino';

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
                  _buildTituloSection("Exercícios"),
                  SizedBox(
                    height: 25,
                  ),
                  _buildButtonCriarExercicio(),
                  _buildButtonSalvar(),

                ],
              ),
            ),
          ),
        ));
  }

  Widget _buildTituloSection(String titulo) => Container(
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
            width: 250,
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
            child: TextButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                  firstDate: DateTime(2021),
                  lastDate: DateTime(2022),
                ).then((date) {
                  setState(() {
                    _controllerTextFieldDataInicio.text = formatDate(date.toString());
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
                    _controllerTextFieldDataFim.text = formatDate(date.toString());
                  });
                });
              },
              child: Icon(Icons.edit),
            ),
          ),
        ],
      );

  Widget _buildTipoTreino() {
    //String dropdownValue = 'Tipo de treino';
    return Row(
      children: [
        DropdownButton<String>(
            items: _tiposDeTreino.map((String dropDownStringItem) {
              return DropdownMenuItem<String>(
                value: dropDownStringItem,
                child: Text(dropDownStringItem),
              );
            }).toList(),
            onChanged: (String novoItemSelecionado) {
              _dropDownItemSelected(novoItemSelecionado);
              setState(() {
                this._itemSelecionado = novoItemSelecionado;
              });
            },
            value: _itemSelecionado),
      ],
    );
  }

  void _dropDownItemSelected(String novoItem) {
    setState(() {
      this._itemSelecionado = novoItem;
    });
  }

  // descrição
  Widget _buildObservacoes() {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLength: 255,
      maxLines: 10,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25),),
        ),
        labelText: "Observações",
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
      validator: (String value) {
        if(value.isEmpty) {
          return;
        }
        return null;
      },
    );
  }

  Widget _buildButtonCriarExercicio() => Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Container(
        padding: EdgeInsets.only(right: 20, bottom: 35),
        child: FloatingActionButton.extended(
          onPressed: () {},
          elevation: 3,
          icon: Icon(Icons.add),
          backgroundColor: Colors.green,
          label: Text(
            "Adicionar exercício",
            style: TextStyle(
              fontSize: 17.0,
            ),
          ),
        ),
      ),
    ],
  );

  Widget _buildButtonSalvar() => Container(
    width: 500.0,
    height: 50.0,
    child: ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) =>  AlertCheckSalvo(),
        );
      },
      child: Text(
        'Salvar',
        style: TextStyle(
          fontSize: 19.0
        ),
      ),
    ),
  );

  // Método para formatar a data no tipo dd/mm/yyyy
  String formatDate(String date) {
    String dia, mes, ano;

    dia = date.substring(8, 10);
    mes = date.substring(5, 7);
    ano = date.substring(0, 4);

    return "${dia}/${mes}/${ano}";
  }

}
