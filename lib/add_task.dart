
import 'dart:core';
import 'package:FieldApp/pending_task.dart';
import 'package:FieldApp/routing/bottom_nav.dart';
import 'package:FieldApp/utils/themes/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';


class AddTask extends StatefulWidget {

  const AddTask({Key? key}) : super(key: key);
  @override
  AddTaskState createState() => AddTaskState();
}

class AddTaskState extends State<AddTask> {
  var currentUser = FirebaseAuth.instance.currentUser;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
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
  final _taskdetailtext = TextEditingController();
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
    'Testing the GPS accuracy of units submitted',
    'Reselling of repossessed units',
    'Repossessing qualified units for Repo and Resale',
    'Increase the Kazi Visit Percentage',
    'Other - Please Expound.'
  ];
  final List<String> collection = [
    'Field Visits with low-performing Agents in Collection Score',
    'Repossession of accounts above 180',
    'Visits Tampering Home 400',
    'Work with restricted Agents',
    'Calling of special book',
    'Sending SMS to clients',
    'Table Meeting/ Collection Sensitization Training'
  ];
  final List<String> team = [
    'Assist a team member to improve the completion rate',
    'Raise a reminder to a team member',
    'Raise a warning to a team member',
    'Raise a new task to a team member',
    'Inform the team member of your next visit to his area, and planning needed',
    'Other - Please expound:'
  ];

  String? selectedTask;
  String? selectedSubTask;
  String? regionselected;
  String? customerselected;
  String? areaselected;
  String? agentselected;
  String? caseselected;
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
  var customerCase = [
    'Case 1',
    'Case 2',
    'Case 3',
    'Case 4',
    'Case 5',
  ];
  var customerList = [
    'customer 1',
    'customer 2',
    'customer 3',
    'customer 4',
    'customer 5',
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
    print(selectedSubTask);
    CollectionReference users = firestore.collection("task");
    var currentUser = FirebaseAuth.instance.currentUser;
    await users.add({
      "task_title": selectedTask,
      "User UID": currentUser?.uid,
      "sub_task": selectedSubTask,
      "task_description": _text.text.toString(),
      "process_audit":_taskdetailtext.text.toString(),
      "task_start_date": "2023-01-15",
      "task_end_date": "2023-01-17",
      "task_status": "Pending",
      "task_with": agentselected,
      "task_area": areaselected.toString(),
      "task_region": regionselected,
      "submited_by":currentUser?.displayName ,
      "case_name":caseselected,
      "Customer": customerselected,
      "submited_role": null,
      "task_country": "Tanzania",
      "priority": priority,
      "timestamp": DateTime.now(),
      "is_approved": "pending"
    }

    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NavPage()),
    );
    /* Map data = {
        'task_title': _myActivitiesResult.toString().replaceAll("(^\\[|\\]", ""),
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
      print(response.body);*/
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
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: "Name",
                  ),
                  items: dataset.keys.map((e) {
                    return DropdownMenuItem<String?>(
                      value: e,
                      child: Text('$e'),
                    );
                  }).toList(),
                  onChanged: onTaskChanged,
                ),
                SizedBox(
                  height: 10,
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
                    items: (dataset[selectedTask] ?? []).map((e) {
                      return DropdownMenuItem<String?>(
                        value: e,
                        child: Text('$e'),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedSubTask = val!;
                      });
                    }),
                SizedBox(
                  height: 10,
                ),
                if (selectedSubTask ==
                        'Visiting unreachable welcome call clients' ||
                    selectedSubTask == 'Reselling of repossessed units' ||
                    selectedSubTask == 'Visit at-risk accounts' ||
                    selectedSubTask == 'Visits FPD/SPDs' ||
                    selectedSubTask ==
                        'Testing the GPS accuracy of units submitted' ||
                    selectedSubTask ==
                        'Repossessing qualified units for Repo and Resale' ||
                    selectedSubTask == 'Repossession of accounts above 180' ||
                    selectedSubTask == 'Visits Tampering Home 400' ||
                    selectedSubTask == 'Visiting of issues raised' ||
                    selectedSubTask ==
                        'Repossession of customers needing repossession')
                  DropdownButtonFormField(
                      value: customerselected,
                      decoration: InputDecoration(
                        filled: true,
                        labelText: "Select the customer to visit",
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "Castomer name",
                      ),
                      items: customerList.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          customerselected = val!;
                        });
                      }),
                SizedBox(
                  height: 10,
                ),
                if (selectedSubTask == 'Work with the Agents with low welcome calls to improve' ||
                    selectedSubTask == 'Increase the Kazi Visit Percentage' ||
                    selectedSubTask ==
                        'Field Visits with low-performing Agents in Collection Score' ||
                    selectedSubTask == 'Work with restricted Agents')
                  DropdownButtonFormField(
                      value: agentselected,
                      decoration: InputDecoration(
                        filled: true,
                        labelText: "Who will you work with",
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "Agent name",
                      ),
                      items: users.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          agentselected = val!;
                        });
                      }),
                if (selectedSubTask ==
                        'Change a red zone CSAT area to orange' ||
                    selectedSubTask == 'Attend to Fraud Cases')
                  DropdownButtonFormField(
                      value: caseselected,
                      decoration: InputDecoration(
                        filled: true,
                        labelText: "which case you will attend",
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(color: Colors.grey[800]),
                        hintText: "case name",
                      ),
                      items: customerCase.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          caseselected = val!;
                        });
                      }),
                if (selectedSubTask == 'Conduct the process audit (Name the process being audited)' ||
                    selectedSubTask ==
                        'Conduct a pilot audit( Name the pilot being audited)' ||
                    selectedSubTask == 'Calling of special book' ||
                    selectedSubTask == 'Sending SMS to clients' ||
                    selectedSubTask ==
                        'Table Meeting/ Collection Sensitization Training' ||
                    selectedSubTask == 'Other - Please Expound.')
                  TextFormField(
                      controller: _taskdetailtext,
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
                      )),
                SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField(
                    value: regionselected,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: "Region",
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Name",
                    ),
                    items: region.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        regionselected = val!;
                      });
                    }),
                SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField(
                    decoration: InputDecoration(
                      filled: true,
                      labelText: "Area",
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Name",
                    ),
                    items: area.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        areaselected = val!;
                      });
                    }),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "What is the priority for this task?",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                SizedBox(
                  height: 10,
                ),
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
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(
                          40), // fromHeight use double.infinity as width and 40 is the height
                    ),
                    child: const Text('Submit'),
                    onPressed: () => formPost()),
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
