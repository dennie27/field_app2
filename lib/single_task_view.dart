import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SingleTask extends StatefulWidget {
  SingleTask({Key? key, required this.id, required this.title})
      : super(key: key);
  final title;
  final id;
  @override
  SingleTaskState createState() => new SingleTaskState();
}

class SingleTaskState extends State<SingleTask> {
  var _key = GlobalKey();
  List data = [];
  Future<String> getData() async {
    const apiUrl = 'https://sun-kingfieldapp.herokuapp.com/api/task/12';
    final response = await http.get(Uri.parse(apiUrl,),headers:{
      "Content-Type": "application/json",});

    this.setState(() {
      data = json.decode(response.body);
      print(data);
    });


    return "Success!";
  }

  @override
  void initState() {
    this.getData();
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("dennis")
        ),
        body:  ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (context, index) => Card(

            child: InkWell(
              onTap: (){

              },
              child: ListTile(
                title: Text(data[index]['task_title'].toString(),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                subtitle: Text("Sun Task: "+
                    data[index]['sub_task'].toString()+"\n"+
                    "Date: "+data[index]['task_start_date'].toString(),
                  style: TextStyle(fontSize: 20,color: Colors.black87),),
                leading: Icon(Icons.brightness_1,color: Colors.green,),

              ),
            ),
          ),
        )
    );
  }
}

class PendingRequest extends StatelessWidget {
  Color status;
  String TittleName;
  final id;
  PendingRequest({
    Key? key,
    required this.status,
    required this.TittleName,
    required this.id,
  }) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dennis $id"),
      ),
      body: Container(
        height: 305,
        padding: EdgeInsets.only(left: 5, right: 10, bottom: 0, top: 5),
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: status, //shadow for button
                  blurRadius: 5) //blur radius of shadow
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              TittleName,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
                height: 20,
                child: ListTile(
                  title: Text(
                    "Main Task:",
                    style: TextStyle(fontSize: 13.0),
                  ),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                  dense: true,
                )),
            SizedBox(
                height: 20,
                child: ListTile(
                  title: Text(
                    "Sub Task:",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                  dense: true,
                )),
            SizedBox(
                height: 20,
                child: ListTile(
                  title: Text(
                    "Area:",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                  dense: true,
                )),
            SizedBox(
                height: 20,
                child: ListTile(
                  title: Text(
                    "Priority:",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                  dense: true,
                )),
            SizedBox(
                height: 20,
                child: ListTile(
                  title: Text(
                    "Users:",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                  dense: true,
                )),
            SizedBox(
                height: 20,
                child: ListTile(
                  title: Text(
                    "Task approved on 23/10 By Manager name:",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                  dense: true,
                )),
            SizedBox(
                height: 20,
                child: ListTile(
                  title: Text(
                    "Task Description:",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                  dense: true,
                )),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Start Date: 24/10"),
                Text("End Date:31/10"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
