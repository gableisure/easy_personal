import 'package:app_front/api/apiAddExercise.dart';
import 'package:app_front/widgets/alertCheckSalvo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CriarExercicio extends StatefulWidget {

  @override
  _CriarExercicioState createState() => _CriarExercicioState();
}

class _CriarExercicioState extends State<CriarExercicio> {

  Map _exercise = {};

  var _categoria = ['Categoria', 'Ombro', 'Peito', 'Bíceps', 'Tríceps', 'Abdômen', 'Quadríceps', 'Posterior de Coxa', 'Panturrilha'];
  var _itemSelecionado = 'Categoria';

  Future getUserTraining() async {
    _exercise["vhr_nome"] = "Exercício APP";
    _exercise["int_intervalor"] = 5;
    _exercise["vhr_seriesrepeticoes"] = "3/10";
    _exercise["int_idfcategoria"] = 1;

    var res = await APIAddExercise().addExercise(_exercise);
    print(res);
  }

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
                  _buildTituloSection("Criar exercício"),
                  SizedBox(
                    height: 13,
                  ),
                  _buildTextFieldTitulo("Nome"),
                  SizedBox(
                    height: 25,
                  ),
                  _buildTipoTreino(),
                  SizedBox(
                    height: 25,
                  ),
                  _buildTextFieldSerie("Séries"),
                  SizedBox(
                    height: 25,
                  ),
                  _buildTextFieldRepeticoes("Repetições"),
                  SizedBox(
                    height: 25,
                  ),
                  _buildTextFieldIntervalo("Intervalo p/ série"),
                  SizedBox(
                    height: 25,
                  ),
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

  Widget _buildTipoTreino() {
    return Row(
      children: [
        DropdownButton<String>(
            items: _categoria.map((String dropDownStringItem) {
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

  Widget _buildTextFieldSerie(String tituloTextField) => TextFormField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: tituloTextField,
    ),
  );

  Widget _buildTextFieldRepeticoes(String tituloTextField) => TextFormField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: tituloTextField,
    ),
  );

  Widget _buildTextFieldIntervalo(String tituloTextField) => TextFormField(
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      labelText: tituloTextField,
    ),
  );

  Widget _buildButtonSalvar() => Container(
    width: 500.0,
    height: 50.0,
    child: ElevatedButton(
      onPressed: () {

        // showDialog(
        //   context: context,
        //   barrierDismissible: false,
        //   builder: (context) =>  AlertCheckSalvo(),
        // );

        getUserTraining();
      },
      child: Text(
        'Salvar',
        style: TextStyle(
            fontSize: 19.0
        ),
      ),
    ),
  );
}
