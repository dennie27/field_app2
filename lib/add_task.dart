import 'dart:convert';
import 'dart:core';
import 'package:FieldApp/utils/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:http/http.dart' as http;

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);
  @override
  AddTaskState createState() => AddTaskState();
}

class AddTaskState extends State<AddTask> {
  String? priority;
  List? _myActivities;
  List? _subtask;
  List? _area;
  List? _userRole;
  late String _userRoleResult;
  List? _region;
  late String _subtaskResult;
  late String _areaResult;
  late String _regionResult;
  final _text = TextEditingController();
  bool _validate = false;
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

  String? selectedTask;
  String? selectedSubTask;
  late Map<String, List<String>> dataset = {
    'Portfolio Quality': portfolio,
    'Team Management': team,
    'Collection Drive': collection,
    'Pilot/Process Management': pilot,
    'Customer Management': customer,

  };
  onTaskChanged(String? value) {

    if (value != selectedTask) selectedSubTask = null;
    setState(() {
      selectedTask = value;
    });
  }
  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  late String _myActivitiesResult;
  final formKey = GlobalKey<FormState>();
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
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
  var role = [
    'CLE',
    'EO',
    'ABM',
    'RBM',
    'CA',
  ];
  var users = [
    'Dennis',
    'Jackson',
    'Hadija',
    'Hamis',
    'Zainab',
  ];

  String taskValue = 'Select task';
  String startDate = 'date start';
  String newdate = 'Submit';

  void initState() {
    super.initState();
    _subtask = [];
    _myActivitiesResult = '';
    _userRole = [];
    _userRoleResult = '';
    _subtaskResult = '';
    _region = [];
    _regionResult = '';
    _area = [];
    _areaResult = '';
    priority = '';
  }

  formPost() async {
    if (_saveForm() ?? true) {
      Map data = {
        'task_title':
            _myActivitiesResult.toString().replaceAll("(^\\[|\\]", ""),
        'sub_task': _subtaskResult,
        'task_region': _regionResult,
        'task_area': _areaResult,
        'priority': priority.toString(),
        'task_with': _userRoleResult,
        'task_description': 'Testing',
        'task_start_date': '2022-11-04',
        'task_end_date': '2022-11-09',
        'task_status': 'Pending',
        'submited_by': 'Dennis',
        'timestamp': '23454',
        'is_approved': 'No'
      };
      var body = json.encode(data);
      var url = Uri.parse('https://sun-kingfieldapp.herokuapp.com/api/create');
      http.Response response = await http.post(url, body: body, headers: {
        "Content-Type": "application/json",
      });
    }

  }

  _saveForm() {
    var form = formKey.currentState!;
    if (form.validate()) {
      _text.text.isEmpty ? _validate = true : _validate = false;
      form.save();
      setState(() {
        _myActivitiesResult = _myActivities!.join(',').toString();
        _subtaskResult = _subtask!.join(',').toString();
        _regionResult = _region!.join(',').toString();
        _areaResult = _area!.join(',').toString();
        _userRoleResult = _userRole!.join(',').toString();
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Add new task"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                DropdownButtonFormField<String?>(
                    value: selectedTask,
                    decoration: InputDecoration(
                        filled: true,
                        labelText: "Task Title",
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "Name",
                        fillColor: Colors.white),
                    items:dataset.keys.map((e) {
                      return DropdownMenuItem<String?>(
                        value: e,
                        child: Text('$e'),
                      );
                    }).toList(),
                    onChanged: onTaskChanged,
                ),
                SizedBox(height: 10,),
                DropdownButtonFormField<String?>(
                    value: selectedSubTask,
                    decoration: InputDecoration(
                        filled: true,
                        labelText: "Sub Task",
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "Name",
                        fillColor: Colors.white),
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
                DropdownButtonFormField(
                    decoration: InputDecoration(
                        filled: true,
                        labelText: "Region",
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "Name",
                        fillColor: Colors.white),
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
                        hintText: "Name",
                        fillColor: Colors.white),
                    items:area.map((String items) {
                      return DropdownMenuItem(value: items,child: Text(items),);
                    }).toList(), onChanged: (v){}),
                SizedBox(height: 10,),
                DropdownButtonFormField(
                    decoration: InputDecoration(
                        filled: true,
                        labelText: "USer Role",
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "Name",
                        fillColor: Colors.white),
                    items:role.map((String items) {
                      return DropdownMenuItem(value: items,child: Text(items),);
                    }).toList(), onChanged: (v){}),
                SizedBox(height: 10,),
                DropdownButtonFormField(
                    decoration: InputDecoration(
                        filled: true,
                        labelText: "Who will you work with",
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "User Role",
                        fillColor: Colors.white),
                    items:users.map((String items) {
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
                SizedBox(height: 10,),
                TextFormField(
                    controller: _text,
                    maxLines: 5,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: AppColor.mycolor, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.black12, width: 1.0),
                      ),
                      errorText: _validate ? 'Value Can\'t Be Empty' : null,
                      labelText: 'Describe the task',
                    )),
                Container(
                  padding: EdgeInsets.all(8),
                  child: ElevatedButton(
                    child: const Text('Save'),
                    onPressed: formPost,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyDropDown extends StatelessWidget {
  List? data;
  String label;
  MyDropDown({Key? key, required this.data, required this.label})
      : super(key: key);
  List? _myActivities;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: const Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                blurRadius: 5) //blur radius of shadow
          ]),
      child: MultiSelectFormField(
          title: Text(
            label,
            style: TextStyle(fontSize: 20, color: Colors.black87),
          ),
          dataSource: data,
          /*[
            {
              "display": "Region 1",
              "value": "region",
            },
            {
              "display": "Region 2",
              "value": "disable15",
            },
            {
              "display": "Region 3",
              "value": "agent",
            },
            {
              "display": "Region 4",
              "value": "kazi",
            },
            {
              "display": "Region 5",
              "value": "Score",
            },
            {
              "display": "Region 6",
              "value": "repossession",
            },
          ]*/
          textField: 'display',
          valueField: 'value',
          okButtonLabel: 'OK',
          cancelButtonLabel: 'CANCEL',
          initialValue: _myActivities,
          fillColor: Colors.white,
          checkBoxCheckColor: AppColor.mycolor),
    );
  }
}
