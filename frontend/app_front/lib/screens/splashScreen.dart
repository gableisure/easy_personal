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
    var duration = Duration(seconds: 5);
    return Timer(duration, route);
  }
  //route navigation
  route() {
    Navigator.of(context).pushReplacementNamed("/listPage");
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
               stops: [0.1, 0.4, 0.7, 0.9],
               colors: [
                 Color(0xFF3594DD),
                 Color(0xFF4563DB),
                 Color(0xFF5036D5),
                 Color(0xFF5B16D0),
               ]
             ),
           ),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               Image.asset("images/2-removebg-preview.png"),
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