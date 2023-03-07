import 'package:FieldApp/task_actions.dart';
import 'package:FieldApp/utils/themes/theme.dart';
import 'package:flutter/material.dart';


class PortfolioUpdate extends StatefulWidget {
  String title;
  PortfolioUpdate(this.title);
  @override
  State<PortfolioUpdate> createState() => _PortfolioUpdateState();
}

class _PortfolioUpdateState extends State<PortfolioUpdate> {
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
        DropdownButtonFormField(
            decoration: InputDecoration(
              filled: true,
              labelText: "Sub task",
              border: OutlineInputBorder(),
              hintStyle: TextStyle(color: Colors.grey[800]),
              hintText: "Sub task",
            ),
            items:[widget.title].map((String items) {
              return DropdownMenuItem(value: items,child: Text(items),);
            }).toList(), onChanged: onSubTaskChanged),
        SizedBox(height: 10,),
        if(selectedSubTask == 'Visiting unreachable welcome call clients')
          Visiting(),
        if(selectedSubTask == 'Work with the Agents with low welcome calls to improve')
          Work(),
        if(selectedSubTask == 'Change a red zone CSAT area to orange')
          RedZone(),
        if(selectedSubTask == 'Attend to Fraud Cases')
          Fraud(),
        if(selectedSubTask == 'Visit at-risk accounts')
          Work(),
        if(selectedSubTask == 'Visits FPD/SPDs')
          Work(),
      ],
    );
  }
}



