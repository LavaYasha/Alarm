import 'package:flutter/material.dart';
import 'package:alarm_app/MainScreen.dart';

void main() => runApp(AlarmApp());

class AlarmApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Alarm",
      theme: ThemeData(
        primaryColorBrightness: Brightness.dark,
        primaryColor: Colors.black,
        accentColor: Colors.grey
      ),
      home: MainScreen(),
    );
  }
}