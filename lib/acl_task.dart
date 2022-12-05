import 'dart:convert';
import 'dart:core';
import 'package:FieldApp/customer_profile.dart';
import 'package:FieldApp/utils/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:http/http.dart' as http;

class Customer extends StatefulWidget {
  const Customer({Key? key}) : super(key: key);
  @override
  CustomerState createState() => CustomerState();
}

class CustomerState extends State<Customer> {
  bool isDescending = false;
  final List<Map> myProducts =
      List.generate(100000, (index) => {"id": index, "name": "Product $index"})
          .toList();
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
      default: {
        results = _allUsers;
      }
    }

    // Refresh the UI
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

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shadowColor: Colors.amber,
          color: Colors.black,
          child: ListTile(
            title: Center(
                child: Text("Task Complete Rate 34%",
                    style: TextStyle(fontSize: 15, color: Colors.yellow))),
            dense: true,
          ),
        ),
        KpiTittle(
          kpicolor: AppColor.mycolor,
          label: 'Calls Summary',
          txtcolor: Colors.black87,
        ),
        Row(
          children: [
            RowData(
              value: '70',
              label: 'Call Made',
            ),
            RowData(
              value: '30',
              label: 'Calls Pending',
            ),
            RowData(
              value: '70%',
              label: 'Complete rate',
            ),
            RowData(
              value: '40%',
              label: 'Success visit',
            )
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
              value: '20',
              label: 'Call Made',
            ),
            RowData(
              value: '40',
              label: 'Calls Pending',
            ),
            RowData(
              value: '35%',
              label: 'Complete rate',
            ),
            RowData(
              value: '20%',
              label: 'Success calls',
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Container(
              alignment: Alignment.center,
              child: IconButton(
                onPressed: () => setState(() => isDescending = !isDescending),
                icon: Icon(
                  isDescending ? Icons.arrow_upward : Icons.arrow_downward,
                  size: 20,
                  color: Colors.yellow,
                ),
                splashColor: Colors.lightGreen,
              ),
            ),
            PopupMenuButton(
              onSelected: (reslust) => _statusFilter(reslust),
              itemBuilder: (context) => [
                PopupMenuItem(child: Text("All"), value: "All"),
                PopupMenuItem(child: Text("Complete"), value: "Complete"),
                PopupMenuItem(child: Text("Pending"), value: "Pending"),
                PopupMenuItem(child: Text("Over Due"), value: "Over due"),
              ],
              icon: Icon(Icons.filter_list_alt, color: Colors.yellow),
            ),
            Expanded(
              child: TextField(
                onChanged: (value) => _searchFilter(value),
                decoration: const InputDecoration(
                    labelText: 'Search', suffixIcon: Icon(Icons.search)),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: _foundUsers.isNotEmpty
              ? ListView.builder(
                  itemCount: _foundUsers.length,
                  itemBuilder: (context, index) {
                    final user = _foundUsers[index];
                    final sortedItems = _foundUsers
                      ..sort((item1, item2) => isDescending
                          ? item2['name'].compareTo(item1['name'])
                          : item1['name'].compareTo(item2['name']));
                    final name = sortedItems[index]['name'];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CProfile(),
                            ));
                      },
                      key: ValueKey(_foundUsers[index]["id"]),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.blueGrey.shade800,
                            radius: 30,
                            child: Text(_foundUsers[index]["id"].toString()),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: Container(
                              width: 340,
                              height: 75,
                              child: Card(
                                elevation: 5,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(20.0, 10, 0, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Customer Name"),
                                          Text("Area"),
                                          Text("Days Disable"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.phone)),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                  Icons.location_on_outlined))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  })
              : const Text(
                  'No results found',
                  style: TextStyle(fontSize: 15),
                ),
        ),
      ],
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
  final value;
  final String label;

  const RowData({Key? key, required this.value, required this.label})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: Card(
          elevation: 3,
          child: Container(
            height: 50,
            width: 50,
            child: Column(
              children: [
                Text(value,
                    style: TextStyle(
                      fontSize: 30,
                    )),
                Text(label, style: TextStyle(fontSize: 9))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
