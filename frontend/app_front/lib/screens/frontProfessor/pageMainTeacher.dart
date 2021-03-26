import 'package:app_front/screens/frontProfessor/tabBarWidget.dart';
import 'package:flutter/material.dart';


class PageMainTeacher extends StatefulWidget {
  @override
  _PageMainTeacherState createState() => _PageMainTeacherState();
}

class _PageMainTeacherState extends State<PageMainTeacher> {
  final List<String> items = [
    'Gabriel Ribeiro de Araújo',
    'Guilherme Silva Freitas',
    'Iago da Cunha Nogueira',
    'Lucas Sodre Menezes',
    'Rene Boaventura Junior',
    'Romario Santos Oliveira',
  ];

  @override
  Widget build(BuildContext context) => TabBarWidget(
    title: 'Easy Personal',
    tabs: [
      Tab(icon: Icon(Icons.face), text: 'Alunos'),
      Tab(icon: Icon(Icons.assignment), text: 'Treinos'),
      Tab(icon: Icon(Icons.fitness_center), text: 'Exercícios'),
      Tab(icon: Icon(Icons.date_range), text: 'Agenda'),
      Tab(icon: Icon(Icons.attach_money), text: 'Financeiro'),
    ],
    children: [
      buildAlunos(),
      buildTreinos(),
      buildExercicios(),
      buildAgenda(),
      buildFinanceiro(),
    ],
  );

  Widget buildAlunos() => Container(
    child: ListView.separated(
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
            subtitle: Text("Aluno há 3 meses"),
          ),
        );
      },
    ),
  );

  Widget buildTreinos() => Center(
    child: Text("Texto"),
  );

  Widget buildExercicios() => Center(
    child: Text("Texto"),
  );

  Widget buildAgenda() => Center(
    child: Text("Texto"),
  );

  Widget buildFinanceiro() => Center(
    child: Text("Texto"),
  );


}
