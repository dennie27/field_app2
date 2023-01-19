import 'package:FieldApp/task_actions.dart';
import 'package:FieldApp/utils/themes/theme.dart';
import 'package:flutter/material.dart';

class CollectionUpdate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Collection");
  }
}
class PortfolioUpdate extends StatefulWidget {
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
  var sub_task = [
    'Visiting unreachable welcome call clients',
    'Work with the Agents with low welcome calls to improve',
    'Change a red zone CSAT area to orange',
    'Attend to Fraud Cases',
    'Visit at-risk accounts',
    'Visits FPD/SPDs',
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
        if(selectedSubTask == 'Visiting unreachable welcome call clients')
          Visiting(),
        if(selectedSubTask == 'Work with the Agents with low welcome calls to improve')
          Work(),
      ],
    );
  }
}
class TeamUpdate extends StatefulWidget {
  @override
  State<TeamUpdate> createState() => _TeamUpdateState();
}

class _TeamUpdateState extends State<TeamUpdate> {
  late String _selectedOption;
  void initState() {
    super.initState();
    _selectedOption = '';
  }

  @override
  Widget build(BuildContext context) {
    return  DropdownButtonFormField(
        decoration: InputDecoration(labelText: 'Select an option'),
        value: "option1",
        onChanged: (newValue) {
          setState(() {
            var value = newValue!;
          });
        },
        items: [
          DropdownMenuItem(
            child: Text("Option 1"),
            value: "option1",
          ),
          DropdownMenuItem(
            child: Text("Option 2"),
            value: "option2",
          ),
        ]
    );
  }
}
class PilotUpdate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Pilot");
  }
}
class CustomerUpdate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Customer");
  }
}