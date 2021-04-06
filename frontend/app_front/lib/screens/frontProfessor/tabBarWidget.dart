import 'package:app_front/widgets/sideMenu.dart';
import 'package:flutter/material.dart';


class TabBarWidget extends StatelessWidget {
  final String title;
  final List<Tab> tabs;
  final List<Widget> children;

  const TabBarWidget({
    Key key,
    @required this.title,
    @required this.tabs,
    @required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: tabs.length,
    child: Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.lightBlueAccent, Colors.blueAccent],
              begin: Alignment.bottomRight,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
        bottom: TabBar(
          isScrollable: true,
          indicatorColor: Colors.white,
          indicatorWeight: 5,
          tabs: tabs,
        ),
        elevation: 20,
        titleSpacing: 20,
      ),
      drawer: SideMenu(),
      body: TabBarView(children: children),
    ),
  );
}
