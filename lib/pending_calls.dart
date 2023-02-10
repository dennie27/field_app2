// main.dart
import 'package:FieldApp/services/calls_detail.dart';
import 'package:FieldApp/services/user_detail.dart';
import 'package:call_log/call_log.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'customer_profile.dart';

class PendingCalls extends StatefulWidget {
  const PendingCalls({Key? key}) : super(key: key);

  @override
  PendingCallsState createState() => PendingCallsState();
}
class PendingCallsState extends State<PendingCalls> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var currentUser = FirebaseAuth.instance.currentUser;
  var fnumberupdate;
  var cmnumberupdate;
  var number1update;
  var name1update;
  var calltypeupdate;
  var timedateupdate;
  var duration1update;
  var accidupdate;
  var simnameupdate;

  void callLogs(String docid) async {
    String _docid = docid;

    Iterable<CallLogEntry> entries = await CallLog.get();

    fnumberupdate = entries.elementAt(0).formattedNumber;
    cmnumberupdate = entries.elementAt(0).cachedMatchedNumber;
    number1update = entries.elementAt(0).number;
    name1update = entries.elementAt(0).name;
    calltypeupdate = entries.elementAt(0).callType;
    timedateupdate = entries.elementAt(0).timestamp;
    duration1update = entries.elementAt(0).duration;
    accidupdate = entries.elementAt(0).phoneAccountId;
    simnameupdate = entries.elementAt(0).simDisplayName;
    if(duration1update<30) {
      CollectionReference newCalling = firestore.collection("new_calling");
      await newCalling.doc(_docid).update({
        'Duration': duration1update,
        "User UID": currentUser?.uid,
        "date": DateTime.now(),
        "call Type": "Called",
        "Status": "Complete"
      });
    }else{
      print("call duration is less than required seconds");
    }
  }
  String? feedbackselected;
  var feedback = [
    'Customer will bay',
    'system will be repossessed',
    'at the shop for replacement',
    'EO take and resale',
    'not the owner',
  ];

  _callNumber(String phoneNumber, String docid) async {
    String number = phoneNumber;
    String _docid = docid;
    await FlutterPhoneDirectCaller.callNumber(number);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Customer Feedback'),
          content: Container(
          height: 200,
          child: Column(
              children: <Widget>[
                DropdownButtonFormField(
                    decoration: InputDecoration(
                      filled: true,
                      labelText: "feedback",
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Name",
                    ),
                    items: feedback.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        feedbackselected = val!;
                      });
                    }),
                SizedBox(
                  height: 20,
                ),
                Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
                      ElevatedButton(
                        onPressed: () {
                         callLogs(_docid);
                        },
                        child: Text('Submit'),
                      ),
                    ]

                )
              ]
          )
          )
          );
        }
    );

  }

  bool isDescending = false;

  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Collection Score", "request": "New Request","status":"Complete"},
    {"id": 2, "name": "Team Management", "request": "pending Approval","status":"Complete"},
    {"id": 3, "name": "Customer Management", "request": "New Request","status":"Over due"},
    {"id": 4, "name": "Pilot Management", "request": "Rejected","status":"Complete"},
    {"id": 5, "name": "Process Management", "request": "New Request","status":"Pending"},
    {"id": 6, "name": "Customer Management", "request": "Pending","status":"Pending"},
    {"id": 7, "name": "Process Management", "request": "Rejected","status":"Pending"},
    {"id": 8, "name": "Collection Score", "request": "Rejected","status":"Over due"},
    {"id": 9, "name": "Team Management","request": "Pending Approval","status":"Over due"},
    {"id": 10, "name": "Pilot Management", "request": "Rejected ","status":"New Request"},
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
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
  void _statusFilter(String _status) {
    List<Map<String, dynamic>> results = [];
    switch(_status) {

      case "Complete": { results = _allUsers.where((user) =>
          user["status"].toLowerCase().contains(_status.toLowerCase()))
          .toList(); }
      break;

      case "Pending": {  results = _allUsers
          .where((user) =>
          user["status"].toLowerCase().contains(_status.toLowerCase()))
          .toList(); }
      break;

      case "Over due": {  results = _allUsers
          .where((user) =>
          user["status"].toLowerCase().contains(_status.toLowerCase()))
          .toList(); }
      break;
      case "All": {  results = _allUsers; }
    }


    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
          children: [
            Row(
              children: [
               /* Container(
                  alignment: Alignment.center,
                  child: IconButton(
                    onPressed: () =>
                        setState(() => isDescending = !isDescending),
                    icon: Icon(
                      isDescending ? Icons.arrow_upward : Icons.arrow_downward,
                      size: 20,
                      color: Colors.yellow,
                    ),
                    splashColor: Colors.lightGreen,
                  ),
                ),
                PopupMenuButton(
                onSelected:(reslust) =>_statusFilter(reslust),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                        child: Text("All"),
                        value: "All"
                    ),
                    PopupMenuItem(
                        child: Text("Complete"),
                        value: "Complete"
                    ),
                    PopupMenuItem(
                        child: Text("Pending"),
                        value: "Pending"
                    ),
                    PopupMenuItem(
                        child: Text("Over Due"),
                        value: "Over due"
                    ),
                  ],
                  icon: Icon(
                    Icons.filter_list_alt,color: Colors.yellow
                  ),

                ),*/
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
              height: 10,
            ),
    StreamBuilder<QuerySnapshot>(
    stream:firestore.collection("new_calling").where("Area",isEqualTo:"Mwanza").snapshots() ,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Column(
                   children: [
                     CircularProgressIndicator(),
                     SizedBox(height: 10,),
                     Text('Loading...'),
                   ],
                 );
                }return Expanded(
                  child: snapshot.hasData
                      ? ListView.separated(
                      itemCount: snapshot.data!.size,
                    itemBuilder: (context, index) {
                        DocumentSnapshot data = snapshot.data!.docs[index];

                        /*final sortedItems = _foundUsers
                          ..sort((item1, item2) => isDescending
                              ? item2['name'].compareTo(item1['name'])
                              : item1['name'].compareTo(item2['name']));
                        final name = sortedItems[index]['name'];*/
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CProfile(id: data.id),
                                ));
                          },
                          key: ValueKey(snapshot.data!.docs[index]),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.blueGrey.shade800,
                                radius: 20,
                                child: Text(snapshot.data!.docs[index].toString()),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Flexible(
                                child: Container(
                                  height: 80,
                                  child: Card(
                                    elevation: 5,
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(5.0, 5, 0, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(data['Customer Name']),
                                              Text(data['Account Number'].toString()),

                                            ],
                                          ),
                                          Row(
                                            children: [

                                                IconButton(
                                                  onPressed: () {
                                                    _callNumber(data['Customer Phone Number'],data.id);
                                                  },
                                                  icon: Icon(Icons.phone)),
                                                IconButton(
                                                  onPressed: () {
                                                  },
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
                      }, separatorBuilder: (BuildContext context, int index) => Divider(),)
                      : const Text(
                    'No results found',
                    style: TextStyle(fontSize: 15),
                  ),
                );
              }
            ),
          ],
        );
  }
}
