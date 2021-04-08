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

  Widget buildTreinos() => Center(
    child: Text("Treino"),
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
