
import 'package:flutter/material.dart';
import 'task_list.dart';

class FormScreenUpdate extends StatefulWidget {
  @override
  _FormScreenUpdateState createState() => _FormScreenUpdateState();
}

class _FormScreenUpdateState extends State<FormScreenUpdate> {
  onTaskChanged(String? value) {
    setState(() {
      selectedTask = value;
    });
  }
  String? selectedTask;
  String? selectedSubTask;
  String? priority;
  final List<String> portfolio = [
    'Visiting unreachable welcome call clients',
    'Work with the Agents with low welcome calls to improve',
    'Change a red zone CSAT area to orange',
    'Attend to Fraud Cases',
    'Visit at-risk accounts',
    'Visits FPD/SPDs',
    'Other - Please Expound.'
  ];
  final List<String> customer = [
    'Visiting of issues raised',
    'Repossession of customers needing repossession',
    'Look at the number of replacements pending at the shops',
    'Look at the number of repossession pending at the shops',
    'Other - Please Expound'
  ];
  final List<String> pilot = [
    'Conduct the process audit (Name the process being audited)',
    'Conduct a pilot audit( Name the pilot being audited)',
    'Testing the GPS accuracy of units submitted.',
    'Reselling of repossessed units',
    'Repossessing qualified units for Repo and Resale:',
    'Increase the Kazi Visit Percentage',
    'Other - Please Expound.'
  ];
  final List<String> collection  = [
    'Disable Rate greater than 180-365 days - Since driving Recovery Officer',
    'Disabled 15-180 days (% of accounts moving on a daily basis to this book, % of accounts shifting from this book to more than 180 days disabled, % reduction/growth of this book on a daily basis versus sales)',
    'Roll-in to 180 days Rate.',
    'Agent Restriction Rate - Total Restricted Agents/ Total Active Agents',
    'Kazi Completion Rate &/ Successful Rate',
    'Collection Score/ Repayment Speed (Regional)'
  ];
  final List<String> team   = [
    'Assist a team member to improve the completion rate',
    'Raise a reminder to a team member',
    'Raise a warning to a team member',
    'Raise a new task to a team member',
    'Inform the team member of your next visit to his area, and planning needed',
    'Other - Please expound:'
  ];

  late Map<String, List<String>> dataset = {
    'Portfolio Quality': portfolio,
    'Team Management': team,
    'Collection Drive': collection,
    'Pilot/Process Management': pilot,
    'Customer Management': customer,

  };
  var region = [
    'Region 1',
    'Region 2',
    'Region 3',
    'Region 4',
    'Region 5',
  ];
  var area = [
    'Area 1',
    'Area 2',
    'Area 3',
    'Area 4',
    'Area 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new task"),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Container(
            margin: EdgeInsets.all(15),
            child: Column(
              children: [
                DropdownButtonFormField<String?>(
                  value: selectedTask,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: "Task Title",
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: "Name",
                  ),
                  items:dataset.keys.map((e) {
                    return DropdownMenuItem<String?>(
                      value: e,
                      child: Text('$e'),
                    );
                  }).toList(),
                  onChanged: onTaskChanged,
                ),
                SizedBox(height: 10,),
                DropdownButtonFormField(
                    decoration: InputDecoration(
                      filled: true,
                      labelText: "Region",
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Region",
                    ),
                    items:region.map((String items) {
                      return DropdownMenuItem(value: items,child: Text(items),);
                    }).toList(), onChanged: (v){}),
                SizedBox(height: 10,),
                DropdownButtonFormField(
                    decoration: InputDecoration(
                      filled: true,
                      labelText: "Area",
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Area",
                    ),
                    items:area.map((String items) {
                      return DropdownMenuItem(value: items,child: Text(items),);
                    }).toList(), onChanged: (v){}),
                SizedBox(height: 10,),
                Text(
                  "What is the priority for this task?",
                  textAlign: TextAlign.start,
                  style:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        contentPadding: EdgeInsets.all(0.0),
                        title: const Text("High"),
                        value: "high",
                        dense: true,
                        groupValue: priority,
                        onChanged: (value) {
                          setState(() {
                            priority = value.toString();
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        contentPadding: EdgeInsets.all(0.0),
                        title: Text("Normal"),
                        value: "normal",
                        dense: true,
                        groupValue: priority,
                        onChanged: (value) {
                          setState(() {
                            priority = value.toString();
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        contentPadding: EdgeInsets.all(0.0),
                        title: Text("Low"),
                        value: "low",
                        dense: true,
                        groupValue: priority,
                        onChanged: (value) {
                          setState(() {
                            priority = value.toString();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                DropdownButtonFormField<String?>(
                    value: selectedSubTask,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: "Sub Task",
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Name",
                    ),
                    items:(dataset[selectedTask] ?? []).map((e) {
                      return DropdownMenuItem<String?>(
                        value: e,
                        child: Text('$e'),
                      );
                    }).toList(),  onChanged: (val) {
                  setState(() {
                    selectedSubTask = val!;
                  });
                }),
                SizedBox(height: 10,),

                if (selectedTask == "Collection Drive")
                  Collection(),

                if(selectedTask == "Team Management")
                  Team(),
                if(selectedTask == "Portfolio Quality")
                  Portfolio(),
                if(selectedTask == "Pilot/Process Management")
                  Pilot(),
                if(selectedTask == "Customer Management")
                  Customer(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
class Form1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Form 1");
  }
}

class Form2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Form 2");
  }
}