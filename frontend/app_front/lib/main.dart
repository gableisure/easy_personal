import 'package:app_front/screens/frontAluno/pageMainStudent.dart';
import 'package:app_front/screens/frontAluno/profileStudent.dart';
import 'package:app_front/screens/frontProfessor/pageMainTeacher.dart';
import 'package:app_front/screens/frontProfessor/profileTeacher.dart';
import 'package:app_front/screens/frontProfessor/treinosAluno.dart';
import 'package:app_front/screens/profileScreen.dart';
import 'package:app_front/screens/signUpScreenTeacher.dart';
import 'package:app_front/screens/splashScreen.dart';
import 'package:app_front/widgets/alertSignUp.dart';
import 'package:flutter/material.dart';
import 'screens/loginScreen.dart';
import 'screens/signUpScreen.dart';
import 'screens/forgotPasswordScreen.dart';
import 'screens/splashScreen.dart';
import 'screens/listPage.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  Paint.enableDithering = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(primary: Color(0XFF454545)),
        ),
      ),
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget),
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          //ResponsiveBreakpoint.resize(1440, name: MOBILE),
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          //ResponsiveBreakpoint.autoScale(800, name: TABLET),
          //ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          //ResponsiveBreakpoint.autoScale(1200, name: DESKTOP),
        ],
        //background: Container(color: Color(0xFFF5F5F5))
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => SplashScreen(),
        "/login": (context) => LoginScreen(),
        "/signUpScreen": (context) => SignUp(),
        "/signUpScreenTeacher": (context) => SignUpScreenTeacher(),
        "/forgotPassword": (context) => ForgotPassword(),
        "/pageMainTeacher": (context) => PageMainTeacher(),
        "/pageMainStudent": (context) => PageMainStudent(),
        "/listPage": (context) => ListPage(),
        "/treinosAluno": (context) => TreinosAluno(),
        "/profileScreen":(context) => ProfileScreen(),
        "/profileTeacher": (context) => ProfileTeacher(),
        "/profileStudent":(context) => ProfileStudent(),
        "/showSignUp":(context) => AlertSignUp(),

      },
    );
  }
}

