import 'package:FieldApp/task_actions.dart';
import 'package:FieldApp/utils/themes/theme.dart';
import 'package:flutter/material.dart';


class PilotUpdate extends StatefulWidget {
  @override
  State<PilotUpdate> createState() => _PilotUpdateState();
}

class _PilotUpdateState extends State<PilotUpdate> {
  String? selectedSubTask;
  onSubTaskChanged(String? value) {
    setState(() {
      selectedSubTask = value;
    });
  }
  var sub_task = [
    'Conduct the process audit',
    'Conduct a pilot audit',
    'Testing the GPS accuracy of units submitted',
    'Reselling of repossessed units',
    'Repossessing qualified units for Repo and Resale',
    'Increase the Kazi Visit Percentage',
  ];

  @override
  Widget build(BuildContext context) {
    String? _selectedValue;
    return Column(
      children: [
        DropdownButtonFormField(
            decoration: InputDecoration(
              filled: true,
              labelText: "Sub task",
              border: OutlineInputBorder(),
              hintStyle: TextStyle(color: Colors.grey[800]),
              hintText: "Sub task",
            ),
            items:sub_task.map((String items) {
              return DropdownMenuItem(value: items,child: Text(items),);
            }).toList(), onChanged: onSubTaskChanged),
        SizedBox(height: 10,),
        if(selectedSubTask == 'Conduct the process audit')
          Audity(),
        if(selectedSubTask == 'Conduct a pilot audit')
          Audity(),
        if(selectedSubTask == 'Testing the GPS accuracy of units submitted')
          Accuracy(),
        if(selectedSubTask == 'Reselling of repossessed units')
          Fraud(),
        if(selectedSubTask == 'Repossessing qualified units for Repo and Resale')
          Work(),
        if(selectedSubTask == 'Increase the Kazi Visit Percentage')
          Visiting(),
      ],
    );
  }
}