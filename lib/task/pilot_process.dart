import 'package:FieldApp/task_actions.dart';
import 'package:FieldApp/utils/themes/theme.dart';
import 'package:flutter/material.dart';

import '../widget/drop_down.dart';


class Pilot extends StatefulWidget {


  String subtask;
  Pilot(this.subtask);
  @override
  State<Pilot> createState() => _PilotState();
}

class _PilotState extends State<Pilot> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List? _myActivities;
  late String _myActivitiesResult;
  List? data =   [
    {
      "display": "Running",
      "value": "Running",
    },
    {
      "display": "Climbing",
      "value": "Climbing",
    },
    {
      "display": "Walking",
      "value": "Walking",
    },
    {
      "display": "Swimming",
      "value": "Swimming",
    },
    {
      "display": "Soccer Practice",
      "value": "Soccer Practice",
    },
    {
      "display": "Baseball Practice",
      "value": "Baseball Practice",
    },
    {
      "display": "Football Practice",
      "value": "Football Practice",
    },
  ];


  @override
  Widget build(BuildContext context) {
    String? _selectedValue;
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(height: 10,),
          if(widget.subtask == 'Conduct the process audit')
            AppMultselect(
              title: widget.subtask,
              onSave: (value) {
                if (value == null) return;
                setState(() {
                  _myActivities = value;
                });
              },
              items: data,


            ),
          if(widget.subtask == 'Conduct a pilot audit')
            AppMultselect(
              title: widget.subtask,
              onSave: (value) {
                if (value == null) return;
                setState(() {
                  _myActivities = value;
                });
              },
              items: data,


            ),
          if(widget.subtask == 'Testing the GPS accuracy of units submitted')
            AppMultselect(
              title: widget.subtask,
              onSave: (value) {
                if (value == null) return;
                setState(() {
                  _myActivities = value;
                });
              },
              items: data,


            ),
          if(widget.subtask == 'Reselling of repossessed units')
            AppMultselect(
              title: widget.subtask,
              onSave: (value) {
                if (value == null) return;
                setState(() {
                  _myActivities = value;
                });
              },
              items: data,


            ),
          if(widget.subtask == 'Repossessing qualified units for Repo and Resale')
            AppMultselect(
              title: widget.subtask,
              onSave: (value) {
                if (value == null) return;
                setState(() {
                  _myActivities = value;
                });
              },
              items: data,


            ),
          if(widget.subtask == 'Increase the Kazi Visit Percentage')
            AppMultselect(
              title: widget.subtask,
              onSave: (value) {
                if (value == null) return;
                setState(() {
                  _myActivities = value;
                });
              },
              items: data,


            ),
        ],
      ),
    );
  }
}



