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
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          StreamBuilder(
            stream: firestore
                .collection("new_calling").doc(widget.id).snapshots(),
            builder:(context, snapshot){

              if(snapshot.hasData){

                DocumentSnapshot data = snapshot.data!;
                var agentname =  data['Responsible User'].split('(');
                var date = data['Registration Date'];
                return Column(
                  children: [



                    Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.blueGrey.shade800,
                        radius: 50,
                        child: const Text("CP"),
                      ),
                    ),
                    Text('Name:  ${data['Customer Name']}',style:const TextStyle(fontSize: 20)),
                    Text('Account: ${data['Account Number']}',style:const TextStyle(fontSize: 20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(onPressed: (){},child: Text(data['Customer Phone Number'],style:const TextStyle(fontSize: 20,color: Colors.black),),),
                        TextButton(onPressed: (){},child: Text(data['Area'].toString(),style:const TextStyle(fontSize: 20,color: Colors.black))),

                      ],

                    ),
                    const Card(
                      shadowColor: Colors.amber,
                      color: Colors.black,
                      child: ListTile(
                        title: Center(
                            child: Text("Last Activities",
                                style: TextStyle(fontSize: 15, color: Colors.yellow))),
                        dense: true,
                      ),
                    ),
                    Text('Agent Name:  ${agentname[0]}',style:const TextStyle(fontSize: 12)),
                    Text('Agent Username:  ${agentname[1]. replaceAll(')','') }',style:const TextStyle(fontSize: 12)),
                    Text('Amount to Collect:  ${data['Amount to Collect']}',style:const TextStyle(fontSize: 12)),
                    Text('Promise date:  ${data['Promise date']}',style:const TextStyle(fontSize: 12)),
                  ],
                );
              }
              else if(snapshot.hasError){
                return Column(
                  children: const [
                    CircularProgressIndicator(),
                    Text("Loading data...")
                  ],
                );
              }
              else{
                return Column(
                  children: const [
                    CircularProgressIndicator(),
                    Text("Loading data...")
                  ],
                );
              }

            },
          ),

          


        ],
      ),
    );
  }

}