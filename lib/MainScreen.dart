import 'package:flutter/material.dart';
import 'package:alarm_app/AlarmGroup.dart';
import 'package:alarm_app/Alarm.dart';

class MainScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlarmGroupList()
    );
  }
}


class AlarmGroupList extends StatefulWidget {
  @override
  AlarmGroupListState createState() => AlarmGroupListState();
}

class AlarmGroupListState extends State<AlarmGroupList> {


  List<AlarmGroup> alarmGroup =  List<AlarmGroup>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          leading: Icon(Icons.alarm),
          title: Text("Alarm"),
        ),
        body:  SingleChildScrollView( 
            child: Container(
              child: _buildPanel()
            ),
          ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => addToAlarmGroup(),
        ),
      );
  }

  Widget _buildPanel(){
    if(alarmGroup == null){
      return ListTile();
    }
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded){
        setState((){
          alarmGroup[index].isExpanded = !isExpanded;
          alarmGroup.forEach((element) {
            if (element != alarmGroup[index]){
              element.isExpanded = false;
            }
          });
        });
      },
      children: alarmGroup.map<ExpansionPanel>((AlarmGroup item){
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded){
            return SwitchListTile(
              title: Text(
                  item.hederTitle,
                  style: TextStyle(fontSize: 25,  color: Colors.black),
                ), 
              secondary: IconButton(
                  icon: Icon(Icons.add_alarm), 
                  onPressed: ()=>print("button work"),
                  color: Colors.black,
                ),
              onChanged: (bool value){
                setState((){
                  item.isEnables = value;
                });
              },
              
              value: item.isEnables,
            );
          },
          body: Column(
              children: item.alarmList
            ),
          isExpanded: item.isExpanded,
          canTapOnHeader: true
        );
      }).toList()
    );
  }

  addToAlarmGroup() {
    setState(() {
      alarmGroup.add(AlarmGroup(
        alarmList: <Alarm>[
          Alarm(
            discription: "",
            icon: Icon(Icons.access_alarm),
            title: "7:00",
          ),
          Alarm(
            discription: "test dis",
            icon: Icon(Icons.add_photo_alternate),
            title: "7:15",
          ),
        ],
        isExpanded: false,
        hederTitle: "Test"
      ));
    });
  }
}