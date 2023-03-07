import 'package:FieldApp/task/collection.dart';
import 'package:FieldApp/task/pilot_process.dart';
import 'package:FieldApp/task/portfolio.dart';
import 'package:FieldApp/widget/drop_down.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'task/customer.dart';

class StepForm extends StatefulWidget {
  @override
  _StepFormState createState() => _StepFormState();
}

class _StepFormState extends State<StepForm> {
  late String _myActivitiesResult;
  List? _myActivities;
  late bool laststep;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _myActivities = [];
    _myActivitiesResult = '';
    laststep = false;
  }

  _saveForm() {
    var form = _formKey.currentState!;
    if (form.validate()) {
      print(_myActivities);
      form.save();
      setState(() {
        _myActivitiesResult = _myActivities.toString();
        items1 = _myActivities!.toList();
        int? num = _myActivities?.toList().length;
        print(items1?.length);
        for (int i = 0; i < items1!.toString().length; i++) {
          print(items1?[i]);
        }
      });
    }
  }

  int _currentStep = 0;
  String? selectedTask;
  String? selectedSubTask;
  String? regionselected;
  String? areaselected;
  String? agentselected;
  String? priority;
  List? items1;
  StepperType stepperType = StepperType.vertical;
  bool _isSelected = false;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var currentUser = FirebaseAuth.instance.currentUser;

  Widget build(BuildContext context) {
    List<Step> stepList() => [
          Step(title: Text('Location'), content: LocationForm(
            onregionselected: (value) {
            regionselected = value;
          },onareaselected: (value) {
            areaselected = value;
          },) ),
          Step(  title: Text('Task'),
            content: TaskForm(
              onTask: (value) {
                selectedTask = value;
              },
              onSubTask: (value) {
    selectedSubTask = value;
    },
            ),
          ),
          Step(
              title: Text('Task Action'),
              content: Column(
                children: [
                  Text(selectedSubTask??''),
                  Text(_myActivities.toString())
                ],
              )),
          Step(
              title: Text('Confirm details'),
              content: Column(
                children: [
                  Text(regionselected??''),
                  Text(areaselected??''),
                  Text(selectedTask??''),
                  Text(_myActivities.toString()),
                  Text(selectedSubTask??''),
                ],
              ))
        ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new task"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
            child: Column(
          children: [
            Expanded(
                child: Stepper(
                    type: stepperType,
                    physics: ScrollPhysics(),
                    currentStep: _currentStep,
                    onStepTapped: (int index) {
                      setState(() {
                        _currentStep = index;
                      });
                    },
                    onStepContinue: () {
                      if (_currentStep < (stepList().length)) {
                        setState(() {
                          _currentStep += 1;
                          _isSelected = false;
                          if (_currentStep == (stepList().length - 1)) {
                            laststep = true;

                          } else {
                            laststep = false;
                            _isSelected = false;
                          }
                        });
                      }
                    },
                    onStepCancel: () {
                      if (_currentStep == 0) {
                        return;
                      }
                      setState(() {
                        _currentStep -= 1;

                        laststep = false;
                      });
                    },
                    controlsBuilder:
                        (BuildContext context, ControlsDetails details) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: laststep
                            ? Row(
                                children: <Widget>[
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        _formKey.currentState?.save();
                                        print(areaselected);

                                      },
                                      child:const Text('Submit'),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: details.onStepCancel,
                                      child: const Text('Back'),
                                    ),
                                  ),
                                ],
                              )
                            : Row(
                                children: <Widget>[
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: details.onStepContinue,
                                      child: const Text('Next'),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: details.onStepCancel,
                                      child: const Text('Back'),
                                    ),
                                  ),
                                ],
                              ),
                      ); /*Row(
                        children: <Widget>[
                          Expanded(
                            child: ElevatedButton(
                              onPressed: details.onStepContinue,
                              child: Text('Continue'),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: details.onStepCancel,
                              child: Text('Back'),
                            ),
                          ),
                        ],
                      );*/
                    },
                    steps: stepList()))
          ],
        )),
      ),
    );
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }
}
class LocationForm extends StatefulWidget {
  final Function(String) onregionselected;
  final Function(String) onareaselected;
  const LocationForm({super.key, required this.onregionselected,required this.onareaselected});

  @override
  _LocationFormState createState() => _LocationFormState();
}

class _LocationFormState extends State<LocationForm> {


  String? regionselected;
  String? areaselected;
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var currentUser = FirebaseAuth.instance.currentUser;
    return Column(children: <Widget>[
      SizedBox(
        height: 10,
      ),
      StreamBuilder(
          stream: firestore
              .collection("Users")
              .where('UID', isEqualTo: currentUser!.uid)
              .get()
              .asStream(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            List<String> region = List.generate(snapshot.data!.size, (index) {
              DocumentSnapshot data = snapshot.data!.docs[index];
              return data['Region'].toString();
            }).toSet().toList();
            if (snapshot.hasData) {
              return AppDropDown(
                label: 'Region',
                hint: 'Select Region',
                items: region ?? [],
                onChanged: (String value) {
                  setState(() {
                    regionselected = value;
                  });
                },
                onSave: (value) {
                  widget.onregionselected(value!);
                },
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
      SizedBox(
        height: 10,
      ),
      StreamBuilder(
          stream: firestore
              .collection("TZ_agent_welcome_call")
              .where('Region', isEqualTo: regionselected)
              .get()
              .asStream(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              List<String> area = List.generate(snapshot.data!.size, (index) {
                DocumentSnapshot data = snapshot.data!.docs[index];
                return data['Area'].toString();
              }).toSet().toList();
              return AppDropDown(
                label: 'Area',
                hint: 'Select Area',
                items: area ?? [],
                onChanged: (String value) {
                  setState(() {
                    areaselected = value;
                  });
                },
                onSave: (value) {
                  widget.onareaselected(value!);
                },
              );
            }
            return CircularProgressIndicator();
          }),
    ]);
  }
}

class TaskForm extends StatefulWidget {
  final Function(String) onTask;
  final Function(String)? onSubTask;
  TaskForm({required this.onTask,this.onSubTask});

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  String? selectedTask;

  String? selectedSubTask;

  bool _isSelected = false;
  onTaskChanged(value) {
    setState(() {
      print(value);
      selectedTask= value;

      _isSelected = true;
    });
  }

  late Map<String, List<String>> dataTask = {
    'Portfolio Quality': portfolio,
    'Team Management': team,
    'Collection Drive': collection,
    'Pilot/Process Management': pilot,
    'Customer Management': customer,
  };


  final List<String> Task = [
    'Portfolio Quality',
    'Team Management',
    'Collection Drive',
    'Pilot/Process Management',
    'Customer Management',
  ];

  final List<String> portfolio = [
    'Visiting unreachable welcome call clients',
    'Work with the Agents with low welcome calls to improve',
    'Change a red zone CSAT area to orange',
    'Attend to Fraud Cases',
    'Visit at-risk accounts',
    'Visits FPD/SPDs',
    'Other'
  ];

  final List<String> customer = [
    'Visiting of issues raised',
    'Repossession of customers needing repossession',
    'Look at the number of replacements pending at the shops',
    'Look at the number of repossession pending at the shops',
    'Other - Please Expound'
  ];

  final List<String> pilot = [
    'Conduct the process audit',
    'Conduct a pilot audit',
    'Testing the GPS accuracy of units submitted',
    'Reselling of repossessed units',
    'Repossessing qualified units for Repo and Resale',
    'Increase the Kazi Visit Percentage',
    'Other'
  ];

  final List<String> collection = [
    'Field Visits with low-performing Agents in Collection Score',
    'Repossession of accounts above 180',
    'Visits Tampering Home 400',
    'Work with restricted Agents',
    'Calling of special book',
    'Sending SMS to clients',
    'Table Meeting/ Collection Sensitization Training',
        'Others'
  ];

  final List<String> team = [
    'Assist a team member to improve the completion rate',
    'Raise a reminder to a team member',
    'Raise a warning to a team member',
    'Raise a new task to a team member',
    'Inform the team member of your next visit to his area, and planning needed',
    'Other'
  ];
  List _myActivities = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DropdownButtonFormField<String?>(
          value: selectedTask,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            labelText: "Task Title",
            border: OutlineInputBorder(),
            hintStyle: TextStyle(color: Colors.white),
            hintText: "Task Title",
          ),
          items: dataTask.keys.map((e) {
            return DropdownMenuItem<String?>(
              value: e,
              child: Text(
                '$e',
                overflow: TextOverflow.ellipsis,
              ),
            );
          }).toList(),
          onChanged: onTaskChanged,
          onSaved:(value) {
            widget.onTask(value!);
          } ,
        ),
        SizedBox(
          height: 10,
        ),
        DropdownButtonFormField<String?>(
            value: selectedSubTask,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: "Sub Task",
              border: OutlineInputBorder(),
              hintStyle: TextStyle(color: Colors.grey[800]),
              hintText: "Name",
            ),
            items: (dataTask[selectedTask] ?? []).map((e) {
              return DropdownMenuItem<String?>(
                value: e,
                child: Text(
                  '$e',
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedSubTask = value;
                _isSelected = true;
              });
            },
          onSaved: (value) {
            widget.onSubTask!(value!);
          },
        ),
        if (selectedTask == 'Portfolio Quality')
          Portfolio(onSave: (value) {
            _myActivities = value;
          },
            subtask: selectedSubTask,)
        else if (selectedTask == 'Team Management')
          Portfolio(onSave: (value) {
            _myActivities = value;
          },
            subtask: selectedSubTask??'',)
        else if (selectedTask == 'Collection Drive')
          Collection(selectedSubTask ?? '')
        else if (selectedTask == 'Pilot/Process Management')
          Pilot(selectedSubTask ?? '')
        else if (selectedTask == 'Customer Management')
          CustomerManagement(selectedSubTask ?? '')
      ],
    );
  }
}
