import 'package:FieldApp/task_actions.dart';
import 'package:FieldApp/utils/themes/theme.dart';
import 'package:flutter/material.dart';

import '../widget/drop_down.dart';


class Collection extends StatefulWidget {
  String subtask;
  Collection(this.subtask);
  @override
  State<Collection> createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
  String? selectedSubTask;
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
  onSubTaskChanged(String? value) {
    setState(() {
      selectedSubTask = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    String? _selectedValue;
    return Column(
      children: [
        SizedBox(height: 10,),
        if(widget.subtask == 'Field Visits with low-performing Agents in Collection Score')
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
        if(widget.subtask == 'Repossession of accounts above 180')
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
        if(widget.subtask == 'Visits Tampering Home 400')
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
        if(widget.subtask == 'Work with restricted Agents')
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
        if(widget.subtask == 'Calling of special book')
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
        if(widget.subtask == 'Sending SMS to clients')
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
        if(widget.subtask == 'Table Meeting/ Collection Sensitization Training')
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
        if(widget.subtask== 'Others')
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
    );
  }
}



