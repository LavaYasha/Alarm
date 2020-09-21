import 'package:flutter/material.dart';
import 'package:alarm_app/MainScreen.dart';

void main() => runApp(AlarmApp());

class AlarmApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Alarm",
      theme: ThemeData(
        primaryColor: Color.fromRGBO(40, 45, 60, 1),
        textTheme: TextTheme(
          headline6: TextStyle(color: Colors.white)
        ),
      ),
      home: MainScreen(),
    );
  }
}