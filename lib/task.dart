import 'package:FieldApp/http_online.dart';
import 'package:FieldApp/single_task_view.dart';
import 'package:FieldApp/task_table.dart';

import 'pending_task.dart';
import 'team_task.dart';
import 'package:FieldApp/task_view.dart';
import 'package:flutter/material.dart';
import 'utils/themes/theme.dart';
import 'add_task.dart';
import 'package:intl/intl.dart';

class Task extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            Container(
              constraints: BoxConstraints.expand(height: 40),
              child: TabBar(tabs: [
                Tab(text: "My Task"),
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
                          ahq_name: 'Arusha',
                          date: '32/04/22',
                          task_complete: '45',
                          task: '5',

                        ),
                        TaskList(
                          task_title: 'Process Management',
                          priority: 'High',
                          ahq_name: 'Arusha',
                          date: '32/04/22',
                          task_complete: '45',
                          task: '5',

                        ),
                        TaskList(
                          task_title: 'Pilot Management',
                          priority: 'Normal',
                          ahq_name: 'Morogoro',
                          date: '32/04/22',
                          task_complete: '45',
                          task: '5',

                        ),
                        TaskList(
                          task_title: 'Portfolio Quality',
                          priority: 'Low',
                          ahq_name: 'Singida',
                          date: '32/04/22',
                          task_complete: '45',
                          task: '5',

                        ),
                        TaskList(
                          task_title: 'Customer Management',
                          priority: 'Normal',
                          ahq_name: 'Moshi',
                          date: '32/04/22',
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
  final String ahq_name;
  final String date;
  final String task;
  final String task_complete;
  const TaskList({Key? key,
    required this.task_title,
    required this.priority,
    required this.ahq_name,
    required this.date,
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
          color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                  blurRadius: 5) //blur radius of shadow
            ]
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
            SizedBox(height:5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [




              ],
            ),
          ],
        ),
      ),

    );
  }
}



