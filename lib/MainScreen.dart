import 'package:flutter/material.dart';
import 'package:alarm_app/AlarmGroup.dart';
import 'package:alarm_app/Alarm.dart';
class MainScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          leading: Icon(Icons.alarm),
          title: Text("Alarm"),
        ),
        body: AlarmGroupList()
      )
    );
  }

  List<Widget> _AlarmGroup() {
    return List<Widget>();
  }
}
class AlarmGroupList extends StatefulWidget {

  @override
  AlarmGroupListState createState() => AlarmGroupListState();
}

class AlarmGroupListState extends State<AlarmGroupList> {

  final _alarmGroups = <AlarmGrop>[
    AlarmGrop(title: "Test1", discriptions: "Test", isOpen: false),
    AlarmGrop(title: "Test2", discriptions: "Test", isOpen: false),
    AlarmGrop(title: "Test3", discriptions: "Test", isOpen: false),
    AlarmGrop(title: "Test4", discriptions: "Test", isOpen: false)
  ];
  
  final _alarms = <Alarm>[
          Alarm(title: "alarm1", discription: "test dis", icon: Icon(Icons.airline_seat_flat_angled)),
          Alarm(title: "alarm1", discription: "test dis", icon: Icon(Icons.airport_shuttle)),
          Alarm(title: "alarm1"),
          Alarm(title: "alarm1", discription: "test dis")
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( 
      child: Container(
        child: _buildPanel(alarmList: _alarms)
      )
    );
  }

  Widget _buildPanel({List<Alarm> alarmList}){
    return ExpansionPanelList(
      expansionCallback: (int index, bool isOpen){
        setState((){
          _alarmGroups[index].isOpen = !isOpen;
        });
      },
      children: _alarmGroups.map((AlarmGrop item){
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isOpen){
            return ListTile(
              title: Text(item.title)
            );
          },
          body: Container(
            child: Column(
              children: _alarms.toList(),
            ),
          ),
          
          isExpanded: item.isOpen,
          canTapOnHeader: true
        );
      }).toList(),
    );
  }
}