import 'dart:convert';
import 'dart:core';
import 'package:FieldApp/utils/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:http/http.dart' as http;

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
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
  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  late String _myActivitiesResult;
  final formKey = new GlobalKey<FormState>();
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
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

  FormPost() async {
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
      print(body);
    }
    ;
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
        title: Text("Add new task"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      "Please select the task",
                      textAlign: TextAlign.start,
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    DropdownButtonFormField(
                        decoration: InputDecoration(
                            filled: true,
                            labelText: "Task Title",
                            border: OutlineInputBorder(),
                            hintStyle: TextStyle(color: Colors.grey[800]),
                            hintText: "Name",
                            fillColor: Colors.white),
                        items:items.map((String items) {
                          return DropdownMenuItem(value: items,child: Text(items),);
                        }).toList(), onChanged: (v){}),
                    MultiSelectFormField(
                      autovalidate: AutovalidateMode.disabled,
                      chipBackGroundColor: Colors.blue,
                      chipLabelStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                      dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                      checkBoxActiveColor: Colors.blue,
                      checkBoxCheckColor: Colors.white,
                      dialogShapeBorder: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(12.0))),
                      title: Text(
                        "Task tittle",
                        style: TextStyle(fontSize: 16),
                      ),
                      validator: (value) {
                        if (value == null || value.length == 0) {
                          return 'Please select one or task options';
                        }
                        return null;
                      },
                      dataSource: [
                        {
                          "display": "Task 1",
                          "value": "Task 1",
                        },
                        {
                          "display": "Task 2",
                          "value": "Task 2",
                        },
                      ],
                      textField: 'display',
                      valueField: 'value',
                      okButtonLabel: 'OK',
                      cancelButtonLabel: 'CANCEL',
                      hintWidget: Text('Please choose one or more'),
                      initialValue: _myActivities,
                      onSaved: (value) {
                        if (value == null) return;
                        setState(() {
                          _myActivities = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Please select the sub task",
                      textAlign: TextAlign.start,
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    MultiSelectFormField(
                      autovalidate: AutovalidateMode.disabled,
                      chipBackGroundColor: Colors.blue,
                      chipLabelStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                      dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                      checkBoxActiveColor: Colors.blue,
                      checkBoxCheckColor: Colors.white,
                      dialogShapeBorder: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(12.0))),
                      title: Text(
                        "sub task tittle",
                        style: TextStyle(fontSize: 16),
                      ),
                      validator: (value) {
                        if (value == null || value.length == 0) {
                          return 'Please select one sub task or more options';
                        }
                        return null;
                      },
                      dataSource: [
                        {
                          "display": "Sub Task 1",
                          "value": "sub Task 1",
                        },
                        {
                          "display": "Task 2",
                          "value": "sub Task 2",
                        },
                      ],
                      textField: 'display',
                      valueField: 'value',
                      okButtonLabel: 'OK',
                      cancelButtonLabel: 'CANCEL',
                      hintWidget: Text('Please choose one or more'),
                      initialValue: _subtask,
                      onSaved: (value) {
                        if (value == null) return;
                        setState(() {
                          _subtask = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Please select Region/Area",
                      textAlign: TextAlign.start,
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Color.fromRGBO(
                                          0, 0, 0, 0.57), //shadow for button
                                      blurRadius: 5) //blur radius of shadow
                                ]),
                            child: MultiSelectFormField(
                                title: Text(
                                  "Region",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black87),
                                ),
                                validator: (value) {
                                  if (value == null || value.length == 0) {
                                    return 'Please select one Region or more options';
                                  }
                                  return null;
                                },
                                dataSource: [
                                  {
                                    "display": "Region 1",
                                    "value": "Region 1",
                                  },
                                  {
                                    "display": "Region 2",
                                    "value": "Region 2",
                                  },
                                  {
                                    "display": "Region 3",
                                    "value": "Region 3",
                                  },
                                  {
                                    "display": "Region 4",
                                    "value": "Region 4",
                                  },
                                  {
                                    "display": "Region 5",
                                    "value": "Region 5",
                                  },
                                  {
                                    "display": "Region 6",
                                    "value": "Region 6",
                                  },
                                ],
                                textField: 'display',
                                onSaved: (value) {
                                  if (value == null) return;
                                  setState(() {
                                    _region = value;
                                  });
                                },
                                valueField: 'value',
                                okButtonLabel: 'OK',
                                cancelButtonLabel: 'CANCEL',
                                initialValue: _region,
                                fillColor: Colors.white,
                                checkBoxCheckColor: AppColor.mycolor),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Color.fromRGBO(
                                          0, 0, 0, 0.57), //shadow for button
                                      blurRadius: 5) //blur radius of shadow
                                ]),
                            child: MultiSelectFormField(
                                title: Text(
                                  "Area",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black87),
                                ),
                                validator: (value) {
                                  if (value == null || value.length == 0) {
                                    return 'Please select one Area or more options';
                                  }
                                  return null;
                                },
                                dataSource: [
                                  {
                                    "display": "Area 1",
                                    "value": "Area 1",
                                  },
                                  {
                                    "display": "Area 2",
                                    "value": "Area 2",
                                  },
                                  {
                                    "display": "Area 3",
                                    "value": "Area 3",
                                  },
                                  {
                                    "display": "Area 4",
                                    "value": "Area 4",
                                  },
                                  {
                                    "display": "Area 5",
                                    "value": "Area 5",
                                  },
                                  {
                                    "display": "Area 6",
                                    "value": "Area 6",
                                  },
                                ],
                                textField: 'display',
                                valueField: 'value',
                                okButtonLabel: 'OK',
                                cancelButtonLabel: 'CANCEL',
                                onSaved: (value) {
                                  if (value == null) return;
                                  setState(() {
                                    _area = value;
                                  });
                                },
                                initialValue: _area,
                                fillColor: Colors.white,
                                checkBoxCheckColor: AppColor.mycolor),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
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
                            title: Text("High"),
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
                    Text(
                      "who will you work with?",
                      textAlign: TextAlign.start,
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MultiSelectFormField(
                        title: Text(
                          "User Role",
                          style: TextStyle(fontSize: 20, color: Colors.black87),
                        ),
                        validator: (value) {
                          if (value == null || value.length == 0) {
                            return 'Please select one or Task options';
                          }
                          return null;
                        },
                        dataSource: [
                          {
                            "display": "ABM",
                            "value": "ABM",
                          },
                          {
                            "display": "EO",
                            "value": "EO",
                          },
                          {
                            "display": "RBM",
                            "value": "RBM",
                          },
                          {
                            "display": "ZBM",
                            "value": "ZBM",
                          },
                          {
                            "display": "RM",
                            "value": "RM",
                          },
                          {
                            "display": "None",
                            "value": "None",
                          }
                        ],
                        textField: 'display',
                        valueField: 'value',
                        okButtonLabel: 'OK',
                        onSaved: (value) {
                          if (value == null) return;
                          setState(() {
                            _userRole = value;
                          });
                        },
                        cancelButtonLabel: 'CANCEL',
                        initialValue: _userRole,
                        fillColor: Colors.white,
                        checkBoxCheckColor: AppColor.mycolor),
                    SizedBox(
                      height: 5,
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
                        ))
                  ],
                ),
              ),
              Container(
                child: ElevatedButton(
                  child: Text('Save'),
                  onPressed: FormPost,
                ),
              ),
            ],
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
                color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
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
