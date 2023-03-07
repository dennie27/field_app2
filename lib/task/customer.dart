import 'package:FieldApp/task_actions.dart';
import 'package:FieldApp/utils/themes/theme.dart';
import 'package:flutter/material.dart';

import '../widget/drop_down.dart';


class CustomerManagement extends StatefulWidget {
  String subtask;
  CustomerManagement(this.subtask);
  @override
  State<CustomerManagement> createState() => _CustomerManagementState();
}

class _CustomerManagementState extends State<CustomerManagement> {
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
        if(widget.subtask == 'Visiting of issues raised')
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
        if(widget.subtask == 'Repossession of customers needing repossession')
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
        if(widget.subtask == 'Look at the number of replacements pending at the shops')
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
        if(widget.subtask == 'Look at the number of repossession pending at the shops')
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



