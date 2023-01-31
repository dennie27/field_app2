
import 'package:FieldApp/task_table.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'pending_task.dart';
import 'team_task.dart';
import 'package:flutter/material.dart';
import 'utils/themes/theme.dart';
import 'add_task.dart';
import 'package:intl/intl.dart';

class Task extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dennis  = FirebaseFirestore.instance.collection('withdrawals').get().then((value) => {
    });
    Future<int> getCount() async {
      int count = await FirebaseFirestore.instance.collection('task').get().then((value) => value.size);
      return count;
    }
    String firestore = FirebaseFirestore.instance.collection('task').snapshots().length.toString();


    var process = 0;
    var pilot = 0;
    var portfolio = 0;
    var customer = 0;
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            Container(
              constraints: BoxConstraints.expand(height: 40),
              child: TabBar(tabs: [

                Tab(text: "My Task",),
                Tab(text: "Team Task"),
                Tab(text: "Pending/Request"),
              ]),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(15),
                child: TabBarView(children: [
                  SingleChildScrollView(

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [


                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size.fromHeight(40), // fromHeight use double.infinity as width and 40 is the height
                            ),
                            onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddTask(),
                                    ));
                            },
                            child: Text("Add New Task")),
                        Card(
                          shadowColor: Colors.amber,
                          color: Colors.black,
                          child: ListTile(
                            title: Center(child: Text("Overrall Task Complete Rate 34%", style: TextStyle(fontSize: 15,color: Colors.yellow))),
                            dense: true,
                          ),
                        ),

                        TaskList(
                          task_title: 'Collection Drive',
                          priority: 'High',
                          task_complete:"9",
                          task: '5',

                        ),
                        TaskList(
                          task_title: 'Process Management',
                          priority: 'High',
                          task_complete: '45',
                          task: '5',

                        ),
                        TaskList(
                          task_title: 'Pilot Management',
                          priority: 'Normal',
                          task_complete: '45',
                          task: '5',

                        ),
                        TaskList(
                          task_title: 'Portfolio Quality',
                          priority: 'Low',
                          task_complete: '45',
                          task: '5',

                        ),
                        TaskList(
                          task_title: 'Customer Management',
                          priority: 'Normal',
                          task_complete: '45',
                          task: '5',

                        ),
                      ],
                    ),

                  ),
                  Container(
                    child: TeamTask(),
                  ),
                  Container(

                    child:PendingTask(),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class TaskList extends StatelessWidget {

  final String task_title;
  final String priority;
  final String task;
  final String task_complete;
  const TaskList({Key? key,
    required this.task_title,
    required this.priority,
    required this.task,
    required this.task_complete,

  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM').format(now);
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyTaskView(endPoint: 'tasks',title: task_title,),
            ));
      },

      child: Container(

        height: 60,
        padding:EdgeInsets.only(left: 5,right: 5,bottom: 0,top: 5),
        margin: EdgeInsets.only(left: 5,right: 5,bottom: 10,top: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColor.mycolor)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(task_title,
              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            SizedBox(height:5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(task_complete+"% Completed",style: TextStyle(color: Colors.green),),
                Text(task+" Total Task",style: TextStyle(color: Colors.red),),
                Text("4 Pending Task",style: TextStyle(color: Colors.yellow))

              ],
            ),


          ],
        ),
      ),

    );
  }
}



