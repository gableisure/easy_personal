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
               begin: Alignment.topCenter,
               end: Alignment.bottomCenter,
               stops: [0.1, 0.4],
               colors: [
                 Colors.lightBlueAccent, Colors.blueAccent
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
                 backgroundColor: Colors.lightBlue,
                 valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFFFFFF)),
                 strokeWidth: 5.0,
               ),
             ],
           ),
         ),
        ],
      ),
    );
  }
}