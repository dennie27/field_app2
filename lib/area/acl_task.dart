import 'dart:core';
import 'package:FieldApp/area/pending_calls.dart';
import 'package:FieldApp/services/calls_detail.dart';
import 'package:FieldApp/utils/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../services/user_detail.dart';
import 'complete_calls.dart';

class Customer extends StatefulWidget {
  const Customer({Key? key}) : super(key: key);
  @override
  CustomerState createState() => CustomerState();
}

class CustomerState extends State<Customer> {
  bool isDescending = false;

  void _statusFilter(String _status) {
    List<Map<String, dynamic>> results = [];
    switch (_status) {
      case "Complete":
        {
          results = _allUsers
              .where((user) =>
                  user["status"].toLowerCase().contains(_status.toLowerCase()))
              .toList();
        }
        break;

      case "Pending":
        {
          results = _allUsers
              .where((user) =>
                  user["status"].toLowerCase().contains(_status.toLowerCase()))
              .toList();
        }
        break;

      case "Over due":
        {
          results = _allUsers
              .where((user) =>
                  user["status"].toLowerCase().contains(_status.toLowerCase()))
              .toList();
        }
        break;
      case "All":
        {
          results = _allUsers;
        }
        break;
      default:
        {
          results = _allUsers;
        }
    }

    // Refresh the UI
    final dennis;
    setState(() {
      _foundUsers = results;
    });
  }

  final List<Map<String, dynamic>> _allUsers = [
    {
      "id": 1,
      "name": "Collection Score",
      "request": "New Request",
      "status": "Complete"
    },
    {
      "id": 2,
      "name": "Team Management",
      "request": "pending Approval",
      "status": "Complete"
    },
    {
      "id": 3,
      "name": "Customer Management",
      "request": "New Request",
      "status": "Over due"
    },
    {
      "id": 4,
      "name": "Pilot Management",
      "request": "Rejected",
      "status": "Complete"
    },
    {
      "id": 5,
      "name": "Process Management",
      "request": "New Request",
      "status": "Pending"
    },
    {
      "id": 6,
      "name": "Customer Management",
      "request": "Pending",
      "status": "Pending"
    },
    {
      "id": 7,
      "name": "Process Management",
      "request": "Rejected",
      "status": "Pending"
    },
    {
      "id": 8,
      "name": "Collection Score",
      "request": "Rejected",
      "status": "Over due"
    },
    {
      "id": 9,
      "name": "Team Management",
      "request": "Pending Approval",
      "status": "Over due"
    },
    {
      "id": 10,
      "name": "Pilot Management",
      "request": "Rejected ",
      "status": "New Request"
    },
  ];
  List<Map<String, dynamic>> _foundUsers = [];
  void _searchFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the

    setState(() async {
      _foundUsers = results;
    });
  }
  bool newuser = true;
  void userArea(){
    UserDetail().getUserArea().then((value){
      setState(() {
        newuser = false;
      });
    });
  }
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    userArea();
    print(newuser);
    super.initState();
  }

  Widget build(BuildContext context) {

    return newuser?Container(

      child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Hi! Welcome"),
          Text("You are new user please contact the admin")
        ],
      )
      ,
    ):DefaultTabController(
      length: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          KpiTittle(
            kpicolor: AppColor.mycolor,
            label: 'Calls Summary',
            txtcolor: Colors.black87,
          ),
          Row(
            children: [
              RowData(
                value: 0,
                label: 'Call Made',
                future: USerCallDetail().CountComplete('Call'),
              ),
              RowData(
                label: 'Calls Pending',
                value: 0,
                future: USerCallDetail().CountPending(),
              ),
              RowData(
                value: 0,
                label: 'Complete Rate',
                future: USerCallDetail().CompleteRate('Call'),
              ),
              RowData(
                value: 32,
                label: 'Success Calls',
                future: USerCallDetail().CountSucceful('Call'),
              ),
              RowData(
                value: 35,
                label: 'Total Collected',
                future: USerCallDetail().Amount('Call'),
              ),
            ],
          ),
          KpiTittle(
            kpicolor: AppColor.mycolor,
            label: 'Visit Summary',
            txtcolor: Colors.black87,
          ),
          Row(
            children: [
              RowData(
                value: 20,
                label: 'Visit Made',
                future: USerCallDetail().CountComplete('Visit'),
              ),
              RowData(
                value: 40,
                label: 'Visit Pending',
                future: USerCallDetail().CountPending(),
              ),
              RowData(
                value: 35,
                label: 'Complete Rate',
                future: USerCallDetail().CompleteRate('Visit'),
              ),

              RowData(
                value: 20,
                label: 'Success Visit',
                future: USerCallDetail().CountSucceful('Visit'),
              ),
              RowData(
                value: 35,
                label: 'Total Collected',
                future: USerCallDetail().Amount('Visit'),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            child: TabBar(tabs: [
              Tab(
                text: "Pending",
              ),
              Tab(text: "Completed"),
            ]),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(5),
              child: TabBarView(
                children: [PendingCalls(), CompleteCalls()],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class KpiTittle extends StatelessWidget {
  final Color kpicolor;
  final String label;
  final Color txtcolor;
  const KpiTittle(
      {Key? key,
      required this.kpicolor,
      required this.txtcolor,
      required this.label})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.amber,
      color: kpicolor,
      child: ListTile(
        title: Center(
            child:
                Text(label, style: TextStyle(fontSize: 20, color: txtcolor))),
        dense: true,
      ),
    );
  }
}

class RowData extends StatelessWidget {
  final int value;
  final String label;
  final future;

  const RowData({Key? key, required this.value, required this.label,required this.future})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<dynamic>(
          future:future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return InkWell(
                onTap: () {},
                child: Card(
                  elevation: 3,
                  child: Container(
                    height: 40,
                    width: 60,
                    child: Column(
                      children: [
                        Text(snapshot.data.toString(),
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        Text(label, style: TextStyle(fontSize: 9))
                      ],
                    ),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return InkWell(
                onTap: () {},
                child: Card(
                  elevation: 3,
                  child: Container(
                    height: 40,
                    width: 60,
                    child: Column(
                      children: [
                        Text('0',
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        Text(label, style: TextStyle(fontSize: 9))
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Column(children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 10,
                ),
                Text('run...'),
              ]);
            }
          }),
    );
  }
}
