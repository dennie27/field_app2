import 'dart:convert';

import 'package:FieldApp/utils/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/circular_percent_indicator.dart';
class DashView extends StatefulWidget {
  @override
  DashViewState createState() =>  DashViewState();
}
class DashViewState extends State<DashView> {
  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Abdallah", "region":"Northern", "task":5,"area":"Kahama"},
    {"id": 2, "name": "Dennis", "region":"South", "task":7,"area":"Arusha"},
    {"id": 3, "name": "Jackson", "region":"Coast", "task":9,"area":"Mwanza"},
    {"id": 4, "name": "Barbara","region":"Central", "task":12,"area":"Mbeya"},
    {"id": 5, "name": "Candy", "region":"West", "task":1,"area":"Tanga"},

  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        children: [
          CircularPercentIndicator(
            radius: 120.0,
            lineWidth: 30.0,
            animation: true,
            percent: 0.7,
            center: new Text(
              "70.0%",
              style:
              new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            footer: new Text(
              "Perfomance",
              style:
              new TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: AppColor.mycolor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(

                child: Container(
                  height: 100,
                  width: 150,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Text("80",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.green),),
                      SizedBox(height: 10,),
                      Text("Area Name"),
                      SizedBox(height: 10,),
                      Text("best performance")
                    ],
                  ),
                ),
              ),
              Card(
                child:Container(
                  height: 100,
                  width: 150,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Text("40",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.red),),
                      SizedBox(height: 10,),
                      Text("Area Name"),
                      SizedBox(height: 10,),
                      Text("Poor performance")
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      leading: const Icon(Icons.list),
                      trailing: const Text(
                        "45",
                        style: TextStyle(color: Colors.green, fontSize: 15),
                      ),
                      title: Text("Area $index"));
                }),
          ),
        ],
      ),

    );
  }
}