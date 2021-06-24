import 'package:app_front/api/apiUpdateTeacher.dart';
import 'package:app_front/helpers/helpers.dart';
import 'package:app_front/widgets/alertCheckSalvo.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_front/helpers/globals.dart' as globals;

class EditDataTeacher extends StatefulWidget {
  @override
  _EditDataTeacherState createState() => _EditDataTeacherState();
}

class _EditDataTeacherState extends State<EditDataTeacher> {
  String _genero;
  Map _userEdit = {};

  // Valor do Border Radius dos inputs do formulário
  final double borderRadiusInputs = 10.0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _controllerTextFieldNome = TextEditingController();
  final _controllerTextFieldSobrenome = TextEditingController();
  final _controllerTextFieldDataNascimento = TextEditingController();
  final _controllerTextFieldTelefone = TextEditingController();
  final _controllerTextFieldCref = TextEditingController();
  final _controllerTextFieldDescricao = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controllerTextFieldNome.text = globals.vhr_nome;
    _controllerTextFieldSobrenome.text = globals.vhr_sobrenome;
    _controllerTextFieldDataNascimento.text = globals.dtt_nascimento;
    _controllerTextFieldTelefone.text = globals.vhr_whatsapp;
    _controllerTextFieldCref.text = globals.vhr_cref;
    _controllerTextFieldDescricao.text = globals.vhr_descricao;
    _genero = _setVariableGenero();
    _userEdit['int_idausuario'] = globals.int_idausuario;

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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildTituloSection("Editar dados"),
                  SizedBox(
                    height: 40,
                  ),
                  _buildNome(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildSobrenome(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildDataNascimento(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildTelefone(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildCref(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildGenero(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildDescricao(),
                  SizedBox(
                    height: 40,
                  ),
                  _buildButtonSalvar(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
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

  Widget _buildNome() {
    return TextFormField(
      keyboardType: TextInputType.name,
      controller: _controllerTextFieldNome,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadiusInputs),
          ),
        ),
        prefixIcon: Icon(Icons.account_circle_rounded),
        labelText: "Primeiro Nome",
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return "Nome Obrigatório";
        }
        return null;
      },
      onSaved: (String value) {
        _userEdit['vhr_nome'] = value;
      },
    );
  }

  Widget _buildSobrenome() {
    return TextFormField(
      keyboardType: TextInputType.name,
      controller: _controllerTextFieldSobrenome,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadiusInputs),
          ),
        ),
        prefixIcon: Icon(Icons.account_circle_rounded),
        labelText: "Sobrenome",
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return "Sobrenome Obrigatório";
        }
        return null;
      },
      onSaved: (String value) {
        _userEdit['vhr_sobrenome'] = value;
      },
    );
  }

  Widget _buildDataNascimento() {
    return TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        DataInputFormatter(),
      ],
      keyboardType: TextInputType.datetime,
      controller: _controllerTextFieldDataNascimento,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadiusInputs),
          ),
        ),
        prefixIcon: Icon(Icons.date_range_rounded),
        labelText: "Data de Nascimento",
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return "Data de Nascimento Obrigatória";
        }
        return null;
      },
      onSaved: (String value) {
        _userEdit['dtt_nascimento'] = value;
      },
    );
  }

  Widget _buildTelefone() {
    return TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        TelefoneInputFormatter(),
      ],
      keyboardType: TextInputType.phone,
      controller: _controllerTextFieldTelefone,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadiusInputs),
          ),
        ),
        prefixIcon: Icon(Icons.phone),
        hintText: "(##) 9####-####",
        labelText: "Telefone",
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return "Telefone Obrigatório";
        }
        return null;
      },
      onSaved: (String value) {
        _userEdit['vhr_whatsapp'] = value;
      },
    );
  }

  Widget _buildCref() {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: _controllerTextFieldCref,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadiusInputs),),
        ),
        prefixIcon: Icon(Icons.credit_card_rounded),
        labelText: "CREF",
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
      onSaved: (String value) {
        setState(() {
          globals.vhr_cref = value;
          _userEdit['vhr_cref'] = value;
        });

      },
    );
  }

  Widget _buildGenero() {
    var _list = ["Masculino", "Feminino", "Indefinido"];
    return DropdownButtonFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadiusInputs),
          ),
        ),
        prefixIcon: Icon(Icons.people_alt_rounded),
        labelText: "Escolha o Gênero",
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
        isDense: true,
      ),
      value: _genero,
      items: _list.map<DropdownMenuItem<String>>((String drop) {
        return DropdownMenuItem<String>(
          child: Text(drop),
          value: drop,
        );
      }).toList(),
      validator: (String value) {
        if (value == null || value.isEmpty) {
          return "Escolha de gênero Obrigatória";
        }
        return null;
      },
      onChanged: (String value) {
        setState(() {
          _userEdit['int_genero'] = value;
        });
      },
      onSaved: (String value) {
        _userEdit['int_genero'] = value;
      },
    );
  }

  Widget _buildDescricao() {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      controller: _controllerTextFieldDescricao,
      maxLength: 255,
      maxLines: 10,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadiusInputs),
          ),
        ),
        prefixIcon: Icon(Icons.text_snippet_rounded),
        labelText: "Breve Descrição",
        hintText: "Breve Descrição Sobre Você:",
        labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
      ),
      onSaved: (String value) {
        _userEdit['vhr_descricao'] = value;
      },
    );
  }

  Widget _buildButtonSalvar() => Container(
    width: 500.0,
    height: 50.0,
    child: ElevatedButton(
      onPressed: () async {
        if (!_formKey.currentState.validate()) {
          return;
        } else {
          _formKey.currentState.save();
          _defineUserEdit();
          Helpers().updateDataTeacher(_userEdit);
        }
        var res = await APIUpdateTeacher().updateTeacher(_userEdit);
        print("debug resposta: $res");

        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertCheckSalvo(),
        );

      },
      child: Text(
        'Salvar',
        style: TextStyle(fontSize: 19.0),
      ),
    ),
  );

  String _setVariableGenero() {
    if(globals.int_genero == 0) {
      return "Masculino";
    } else if (globals.int_genero == 1){
      return "Feminino";
    } else {
      return "Indefinido";
    }
  }

  _defineUserEdit() {
    if(_userEdit['int_genero'] == "Masculino") _userEdit['int_genero'] = 0;
    else if (_userEdit['int_genero'] == "Feminino") _userEdit['int_genero'] = 1;
    else _userEdit['int_genero'] = 2;

    _userEdit['int_tipo'] = 1;
  }


}
