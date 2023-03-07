import 'package:FieldApp/task_actions.dart';
import 'package:FieldApp/utils/themes/theme.dart';
import 'package:flutter/material.dart';


class Team extends StatefulWidget {
  String subtask;
  Team(this.subtask);
  @override
  State<Team> createState() => _TeamState();
}

class _TeamState extends State<Team> {
  String? selectedSubTask;
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
        if(widget.subtask == 'Visiting unreachable welcome call clients')
          Visiting(),
        if(widget.subtask == 'Work with the Agents with low welcome calls to improve')
          Work(),
        if(widget.subtask == 'Change a red zone CSAT area to orange')
          RedZone(),
        if(widget.subtask == 'Attend to Fraud Cases')
          Fraud(),
        if(widget.subtask == 'Visit at-risk accounts')
          Work(),
        if(widget.subtask== 'Visits FPD/SPDs')
          Work(),
        if(widget.subtask== 'Others')
          Work(),
      ],
    );
  }
}



