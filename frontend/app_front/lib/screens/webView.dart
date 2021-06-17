import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class WebViewLoad extends StatefulWidget {
  WebViewLoadUI createState() => WebViewLoadUI();
}

class WebViewLoadUI extends State<WebViewLoad>{

  final pdfController = PdfController(
    viewportFraction: 1.0,
    document: PdfDocument.openAsset("images/tutorialApp.pdf"),
  );


  Widget pdfView() => PdfView(
    controller: pdfController,
    scrollDirection: Axis.vertical,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: Colors.white,),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed("/login");
          },
        ),
        title: const Text('Easy Personal Tutorial'),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: pdfView(),
      ),
    );
  }
}


