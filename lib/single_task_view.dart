import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:camera/camera.dart';

class SingleTask extends StatefulWidget {
  SingleTask({Key? key, required this.id, required this.title})
      : super(key: key);
  final title;
  final id;

  @override
  SingleTaskState createState() => new SingleTaskState();

}

class SingleTaskState extends State<SingleTask> {
  String? selectedTask;
  String? actionTask;
  final List<String> Yes = [
    "Yes",
    "No"
  ];
  final List<String> No = [
    "Yes_no",
    "No_no"
  ];
  late Map<String, List<String>> dataset = {
    'No': No,
    'Yes': Yes,


  };
  onTaskChanged(String? value) {

    if (value != selectedTask) actionTask = null;
    setState(() {
      selectedTask = value;
    });
  }
  var _key = GlobalKey();
  List data = [];
  Future<http.Response> fetchData() async {
    const apiUrl = 'https://sun-kingfieldapp.herokuapp.com/api/task/12/';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to load data');
    }
  }


  @override
  void initState() {
    this.fetchData();
    print("response.statusCode");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<http.Response>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = json.decode(snapshot.data!.body);
          return Scaffold(
              appBar: AppBar(
                title: const Text("Update Task"),),
            body: SingleChildScrollView(
              
              child: Form(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [


                      DropdownButtonFormField<String?>(
                        value: selectedTask,
                        decoration: InputDecoration(
                          filled: true,
                          labelText: "Did we find the right customer?",
                          border: OutlineInputBorder(),
                          hintStyle: TextStyle(color: Colors.white),
                          hintText: "Name",
                        ),
                        items:dataset.keys.map((e) {
                          return DropdownMenuItem<String?>(
                            value: e,
                            child: Text('$e'),
                          );
                        }).toList(),
                        onChanged: onTaskChanged,
                      ),
                      Icon(Icons.camera_alt),
                      Icon(Icons.location_on),


                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 50)
                          ),
                          onPressed:(){
                          }, child: Text("Update"), )

                    ],
                  ),
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        return CircularProgressIndicator();
      },
    );
  }
  /*Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("title")
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
  }*/
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
