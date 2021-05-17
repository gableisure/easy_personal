import 'package:app_front/screens/frontProfessor/tabBarWidget.dart';
import 'package:flutter/material.dart';


class PageMainStudent extends StatefulWidget {
  @override
  _PageMainStudentState createState() => _PageMainStudentState();
}

class _PageMainStudentState extends State<PageMainStudent> {
  /*final List<String> items = [
    'Gabriel Ribeiro de Araújo',
    'Guilherme Silva Freitas',
    'Iago da Cunha Nogueira',
    'Lucas Sodre Menezes',
    'Rene Boaventura Junior',
    'Romario Santos Oliveira',
  ];*/

  @override
  Widget build(BuildContext context) => TabBarWidget(
    title: 'Easy Personal',
    tabs: [
      Tab(icon: Icon(Icons.fitness_center), text: 'Treinos'),
      Tab(icon: Icon(Icons.announcement), text: 'Feedback'),
      Tab(icon: Icon(Icons.inbox), text: 'Treinos Arquivados'),
      ],
    children: [
      buildTreinos(),
      buildFeedback(),
      buildTreinosArquivados(),
    ],
  );

  Widget buildTreinos() =>
      Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildContainerPesquisa(),
              _buildContainerInfo(),
              _buildListaTreinos("Treino de aquecimento", "03/05/2021",
                  "03/06/2021", "ATIVO", Colors.green),
              _buildListaTreinos("Treino de introdução", "03/04/2021",
                  "03/05/2021", "INATIVO", Colors.red),
              _buildListaTreinos("Treino teste", "25/03/2021", "01/04/2021",
                  "INATIVO", Colors.red),
            ],
          ),
        ),
      );

  Widget _buildContainerPesquisa() => Container(
    color: Colors.blue,
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.only(top: 20, right: 10, bottom: 20, left: 10),
    child: TextField(
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        fillColor: Colors.white,
        filled: true,
        labelText: 'Pesquisar treino',
      ),
    ),
  );

  Widget _buildContainerInfo() => Container(
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.only(top: 20, right: 10, left: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Container qtd. de treinos
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.bar_chart,
                color: Colors.blueAccent,
                size: 30,
              ),
              Text(
                "3 Treinos",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );

  Widget _buildListaTreinos(String nomeTreino, String dataInicio,
      String dataFim, String status, Color color) =>
      Padding(
        padding: EdgeInsets.only(right: 10, left: 10, top: 20),
        child: Container(
          padding: EdgeInsets.only(bottom: 15, left: 10, top: 5),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 4,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(15),
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
                      width: 270,
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        nomeTreino,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 18),
                      child: Chip(
                        labelPadding: EdgeInsets.all(2.0),
                        label: Text(
                          status,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: color,
                        elevation: 6.0,
                        shadowColor: Colors.grey[60],
                        padding: EdgeInsets.all(8.0),
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
                        "${dataInicio} a ${dataFim}",
                        style: TextStyle(
                          fontSize: 13.0,
                          color: Colors.blueGrey,
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
                      padding: EdgeInsets.only(left: 8),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Ver treino",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildFeedback() => Center(
    child: Text("Treino Feedbacks"),
    /*ListView.separated(
      padding: EdgeInsets.only(top: 30, left: 10, right: 10),
      separatorBuilder: (context, index) => Divider(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return TextButton(
          onPressed: () {},
          child: ListTile(
            leading: Icon(
                Icons.person,
                size: 30
            ),
            title: Text(
              '${items[index]}',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            subtitle: Text("Aluno há 2 meses"),
          ),
        );
      },
    ),*/
  );

  Widget buildTreinosArquivados() => Center(
    child: Text("Treino arquivados"),
    /*ListView.separated(
      padding: EdgeInsets.only(top: 30, left: 10, right: 10),
      separatorBuilder: (context, index) => Divider(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return TextButton(
          onPressed: () {},
          child: ListTile(
            leading: Icon(
                Icons.person,
                size: 30
            ),
            title: Text(
              '${items[index]}',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            subtitle: Text("Aluno há 2 meses"),
          ),
        );
      },
    ),*/
  );
}
