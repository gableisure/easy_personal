import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  //controller pages
  final PageController _pageController = PageController();

  Widget _pages(String _title, String _subtitle) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.4, 0.7, 0.9],
          colors: [
            Color(0xFF3594DD),
            Color(0xFF4563DB),
            Color(0xFF5036D5),
            Color(0xFF5B16D0),
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ListTile(
              title: Text(
                _title,
                style: GoogleFonts.nunitoSans(
                  fontSize: 23,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                _subtitle,
                style: GoogleFonts.sourceSansPro(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            children: <Widget>[
              _pages("FACILITE SEU TRABALHO", "Como personal, tenha total controle das suas atividades."),
              _pages("MELHORE SEU RENDIMENTO", "Como aluno, tenha fácil acesso ao seu treino."),
              _pages("POSSUA UMA MELHOR COMUNICAÇÃO", "Estabeleça uma linha direta personal/aluno."),
              _pages("VAMOS COMEÇAR", "Cadastre-se como personal ou aluno para usufruir de nossa ferramenta."),
            ],
          ),
          Positioned(
            left: 40,
            right: 40,
            bottom: 390,
            child: Image.asset(
              "images/2-removebg-preview.png",
              width: MediaQuery.of(context).size.width * .3,
              height: MediaQuery.of(context).size.height * .6,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.all(20),
                child: Container(
                alignment: Alignment.center,
                child: SmoothPageIndicator(
                    controller: _pageController,  // PageController
                    count:  4,
                    effect:  WormEffect(
                        dotColor: Colors.grey,
                        activeDotColor: Colors.white
                    ),  // your preferred effect
                    onDotClicked: (index) {
                      _pageController.animateToPage(index, duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    }
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * .9,
                height: 60,
                padding: EdgeInsets.only(bottom: 10),
                child: SizedBox.expand(
                  child: ElevatedButton(
                    child: Text(
                        "IR PARA APLICAÇÃO",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunitoSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Colors.deepPurple
                        )
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed("/login");
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      elevation: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
