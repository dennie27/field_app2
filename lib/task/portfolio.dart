import 'package:FieldApp/task_actions.dart';
import 'package:FieldApp/utils/themes/theme.dart';
import 'package:FieldApp/widget/drop_down.dart';
import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';


class Portfolio extends StatefulWidget {
  List<dynamic>? Function(List) onSave;
  String? subtask;

  Portfolio({required this.subtask,required this.onSave});
  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  List<dynamic>? _myActivities;
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
    return Column(
      children: [
        SizedBox(height: 10,),
        if(widget.subtask == 'Visiting unreachable welcome call clients')
          AppMultselect(
            title: widget.subtask!,
            onSave: (value) {
              if (value == null) return;
              setState(() {
                widget.onSave = value;
              });
            },
            items: data,


          ),
        if(widget.subtask == 'Work with the Agents with low welcome calls to improve')
          AppMultselect(
            title: widget.subtask!,
            onSave: (value) {
              if (value == null) return;
              setState(() {
                widget.onSave = value;
              });
            },
            items: data,


          ),
        if(widget.subtask == 'Change a red zone CSAT area to orange')
          AppMultselect(
            title: widget.subtask!,
            onSave: (value) {
              if (value == null) return;
              setState(() {
                widget.onSave = value;
              });
            },
            items: data,


          ),
        if(widget.subtask == 'Attend to Fraud Cases')
          AppMultselect(
            title: widget.subtask!,
            onSave: (value) {
              if (value == null) return;
              setState(() {
                widget.onSave = value;
              });
            },
            items: data,


          ),
        if(widget.subtask == 'Visit at-risk accounts')
          AppMultselect(
            title: widget.subtask!,
            onSave: (value) {
              if (value == null) return;
              setState(() {
                widget.onSave = value;
              });
            },
            items: data,


          ),
        if(widget.subtask== 'Visits FPD/SPDs')
          AppMultselect(
            title: widget.subtask!,
            onSave: (value) {
              if (value == null) return;
              setState(() {
                widget.onSave = value;
              });
            },
            items: data,


          ),
        if(widget.subtask== 'Others')
          AppMultselect(
            title: widget.subtask!,
            onSave: (value) {
              if (value == null) return;
              setState(() {
                widget.onSave = value;
              });
            },
            items: data,


          ),
      ],
    );
  }
}



