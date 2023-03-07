import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseData extends StatefulWidget{
  @override
  State<FirebaseData> createState() => _FirebaseDataState();
}

class _FirebaseDataState extends State<FirebaseData> {
  String? selectedTask;
  String? selectedSubTask;
  onTaskChanged(String? value) {
    if (value != selectedTask) selectedSubTask = null;
    setState(() {
      selectedTask = value;
    });
  }
FirebaseFirestore firestore = FirebaseFirestore.instance;

@override
  Widget build(BuildContext context){


    return Scaffold(
      appBar: AppBar(
        title: Text("Dennis"),
      ),
      body: Column(
        children: [

          ElevatedButton(onPressed: ()async {
            CollectionReference users = firestore.collection("Users");
            await users.add({
              'Firstname':'Monday',
              'Lastname':'Juma',
              'Role':'user',
              'Area':'Sekei'
            });
          },
              child:   Text("data")),
          ElevatedButton(onPressed: ()async {
            CollectionReference task = firestore.collection("task");
            QuerySnapshot allresults = await task.get();
            allresults.docs.forEach((DocumentSnapshot result) {
              print(allresults.docs.length);
            });

          },
              child:   Text("Pull Data")),
         StreamBuilder(
             stream: firestore.collection("task").snapshots(),
             builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
               List<String> dennis =  List.generate(snapshot.data!.size,
                       (index) {
                     DocumentSnapshot data = snapshot.data!.docs[index];
                     return data['task_area'].toString();
                   }).toSet().toList();
               print(dennis);
               if (!snapshot.hasData) {

                 return CircularProgressIndicator();
               }return Expanded(

                 child:Column(
                   children: [
                     DropdownButtonFormField(
                       value:selectedTask,
                       decoration: InputDecoration(
                         filled: true,
                         labelText: "Task Title",
                         border: OutlineInputBorder(),
                         hintStyle: TextStyle(color: Colors.white),
                         hintText: "Name",
                       ),
                       items: dennis.map((String items) {
                         return DropdownMenuItem(
                           value: items,
                           child: Text(items,  overflow: TextOverflow.ellipsis,),

                         );
                       }).toList(),
                       onChanged:onTaskChanged,
                     )
                   ],
                 ), /*ListView.separated(
                   itemCount: snapshot.data!.docs.length,
  itemBuilder: (BuildContext context, int index) {
    DocumentSnapshot data = snapshot.data!.docs[index];

    return InkWell(
      onTap: () {},
      key: ValueKey(data["task_status"]),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blueGrey.shade800,
            radius: 35,
            child: Text(
                "dd"
          )),
          SizedBox(
            width: 5,
          ),
      Flexible(
        child: Container(
          width: 350,
          height: 90,
          child: Card(
              elevation: 5,
              child: Padding(
                padding:
                EdgeInsets.fromLTRB(20.0, 10, 0, 0),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                    Text(data["task_title"]),
                    Text(data["task_title"]),
                    Text(data["task_title"]),
                    Text(data["task_title"]),
                  ],
                ),
              )
          )
        ),
      ),
        ],
      ),
    );
  }, separatorBuilder: (BuildContext context, int index) => Divider(),

                 )*/
               );
             })

        ],
      ),
    );
  }
}