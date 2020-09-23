import 'package:flutter/material.dart';
import 'package:alarm_app/Alarm.dart';

class AlarmGroup {
  AlarmGroup({this.hederTitle, this.alarmList, this.isExpanded});

  String hederTitle; 
  List<Alarm> alarmList;
  bool isExpanded;
  bool isEnables = false;
}


