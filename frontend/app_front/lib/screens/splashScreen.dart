import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }
  //delay for page
  startTime() async {
    var duration = Duration(seconds: 8);
    return Timer(duration, route);
  }
  //route navigation
  route() {
    Navigator.of(context).pushReplacementNamed("/login");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
         Container(
           width: MediaQuery.of(context).size.width,
           height: MediaQuery.of(context).size.height,
           decoration: BoxDecoration(
             gradient: LinearGradient(
               begin: Alignment.topLeft,
               end: Alignment.bottomRight,
               colors: [
                 Color(0xFFFF5722),
                 Color(0xfff57c00),
                 Color(0xfffb8c00),
               ]
             ),
           ),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               SizedBox(
                 child: FlutterLogo(size: 160, curve: Curves.fastOutSlowIn,),
               ),
               SizedBox(height: 60,),
               CircularProgressIndicator(
                 backgroundColor: Color(0xFFFF9800),
                 valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFFFFFF)),
                 strokeWidth: 6.0,
               ),
             ],
           ),
         ),
        ],
      ),
    );
  }
}