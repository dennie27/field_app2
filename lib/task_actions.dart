

import 'package:FieldApp/utils/themes/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Visiting extends StatefulWidget {
  @override
  State<Visiting> createState() => _Visiting();
}

class _Visiting extends State<Visiting> {
  String? selectedSubTask;
  String? selectedaction;
  var taskaction =["No","Yes"];
  onSubTaskChanged(String? value) {
    setState(() {
      selectedSubTask = value;
    });
  }
  taskAction(String? value) {
    setState(() {
      selectedaction = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter Account number',
          ),
        ),
        SizedBox(height: 10,),
        DropdownButtonFormField(
            decoration: InputDecoration(
              filled: true,
              labelText: "Did we find the right customer?",
              border: OutlineInputBorder(),
              hintStyle: TextStyle(color: Colors.grey[800]),
              hintText: "Did we find the right customer?",
            ),
            items:taskaction.map((String items) {
              return DropdownMenuItem(value: items,child: Text(items),);
            }).toList(), onChanged: taskAction),
        SizedBox(height: 10,),

        if(selectedaction == 'No')
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter Account number',
            ),
          ),
        Text("If it related to frud please rise it through fraud App"),

        TextFormField(
            maxLines: 5,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: AppColor.mycolor, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.black12, width: 1.0),
              ),
              labelText: 'Additional details',
            )),
        if(selectedaction == 'Yes')
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter Account number',
            ),

          ),
        SizedBox(height: 10,),
        Icon(Icons.camera_alt),
        SizedBox(height: 10,),
        Icon(Icons.location_on),
        SizedBox(height: 10,),
        SizedBox(height: 10,),
      ],
    );
  }
}

//Work With agent
class Work extends StatefulWidget {
  @override
  State<Work> createState() => _Work();
}
class _Work extends State<Work> {
  String? selectedSubTask;
  String? selectedaction;
  var taskaction =["No","Yes"];
  onSubTaskChanged(String? value) {
    setState(() {
      selectedSubTask = value;
    });
  }
  taskAction(String? value) {
    setState(() {
      selectedaction = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter Account number',
          ),
        ),
        SizedBox(height: 10,),
        DropdownButtonFormField(
            decoration: InputDecoration(
              filled: true,
              labelText: "Did you manage to work with the Agent?",
              border: OutlineInputBorder(),
              hintStyle: TextStyle(color: Colors.grey[800]),
              hintText: "Did you manage to work with the Agent?",
            ),
            items:taskaction.map((String items) {
              return DropdownMenuItem(value: items,child: Text(items),);
            }).toList(), onChanged: taskAction),
        SizedBox(height: 10,),

        if(selectedaction == 'No')
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter Account number',
            ),
          ),
        Text("If it related to frud please rise it through fraud App"),

        TextFormField(
            maxLines: 5,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: AppColor.mycolor, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.black12, width: 1.0),
              ),
              labelText: 'Additional details',
            )),
        if(selectedaction == 'Yes')
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter Account number',
            ),

          ),
        SizedBox(height: 10,),
        Icon(Icons.camera_alt),
        SizedBox(height: 10,),
        Icon(Icons.location_on),
        SizedBox(height: 10,),
        SizedBox(height: 10,),
      ],
    );
  }
}