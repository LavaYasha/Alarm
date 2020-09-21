import 'package:flutter/material.dart';

class Alarm extends StatefulWidget {
  final String title;
  final String discription;
  final Icon icon;

  Alarm({this.title, this.discription, this.icon = const Icon(Icons.alarm)});

  @override
  _AlarmState createState() => _AlarmState(title: this.title, discription: this.discription, icon: this.icon);
}

class _AlarmState extends State<Alarm> {
  bool _isChange = false;
  String title;
  String discription;
  Icon icon;

  _AlarmState({this.title, this.discription, this.icon = const Icon(Icons.alarm)});

  @override
  Widget build(BuildContext context) {
    return Container(
       child:  SwitchListTile(
              title: Text("$title"),
              subtitle: Text("$discription"),
              secondary: icon,
              onChanged: (bool value){
                setState((){
                  _isChange = value;
                });
              },
              value: _isChange,
            ),
    );
  }
}