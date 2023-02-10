import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class CProfile  extends StatefulWidget {
  
  final String id;
const CProfile({Key? key, required this.id}) : super(key: key);

@override
CProfileState createState() => CProfileState();
}
class CProfileState extends State<CProfile> {



  var currentUser = FirebaseAuth.instance.currentUser;
  final querySnapshot = FirebaseFirestore.instance
      .collection('new_calling').doc().get();

/*  Future<QuerySnapshot<Map<String, dynamic>>> storedata = FirebaseFirestore.instance.collection("new_calling").
  where('', isEqualTo: 44444).get().then((snapshot) {return snapshot;})*/


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.blueGrey.shade800,
              radius: 50,
              child: Text("CP"),
            ),
          ),
          Text("v"),
          Text("Customer Area"),
          Text("storedata"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              TextButton(onPressed: (){},child: Text("Customer Number")),
    TextButton(onPressed: (){},child: Text("Customer Location")),
            ],

          ),
          Card(
            shadowColor: Colors.amber,
            color: Colors.black,
            child: ListTile(
              title: Center(
                  child: Text("Last Activities",
                      style: TextStyle(fontSize: 15, color: Colors.yellow))),
              dense: true,
            ),
          ),
          Text(""),
          Text("calls history"),
          Text("visit history"),
          Text(widget.id)
          


        ],
      ),
    );
  }

}