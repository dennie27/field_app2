
import 'dart:core';
import 'package:FieldApp/utils/themes/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';
import 'package:getwidget/getwidget.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);


  _AddTaskState createState() => _AddTaskState();
}
class _AddTaskState extends State<AddTask> {

  String taskValue = 'Select Task';
  String startDate ='date start';
  String newdate ='Submit';

  String? priority;
  List? _myActivities;
  List<String> tasklist = [
    'Select Task',
    'Portfolio Quality',
    'Collection Drive',
    'Process Management',
    'Pilot Management',
    'Customer Management',
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Add New Task"),
      ),
      body: SingleChildScrollView(
        reverse: true,

        child: Container(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom),
          margin: EdgeInsets.only(left: 20,right: 20,bottom: 0,top: 5),
          color: Colors.white,
          child: Form(

            child: Column(

              children: [
                Text("Please Choose the Task",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),


                MyDropDown(
                    label: 'Main Task',
                    data: [
                      {
                        "display": "Region 55",
                        "value": "disable180",
                      },
                      {
                        "display": "Region 2",
                        "value": "disable15",
                      },
                      {
                        "display": "Region 3",
                        "value": "agent",
                      },
                      {
                        "display": "Region 4",
                        "value": "kazi",
                      },
                      {
                        "display": "Region 5",
                        "value": "Score",
                      },
                      {
                        "display": "Region 6",
                        "value": "repossession",
                      },
                    ]),

                SizedBox(height: 15,),

                DecoratedBox(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                            blurRadius: 5) //blur radius of shadow
                      ]
                  ),
                  child: MultiSelectFormField(
                      title: Text("Sub Task",style: TextStyle(fontSize: 20, color:Colors.black87 ),),
                      dataSource: [
                        {
                          "display": "Region 1",
                          "value": "disable180",
                        },
                        {
                          "display": "Region 2",
                          "value": "disable15",
                        },
                        {
                          "display": "Region 3",
                          "value": "agent",
                        },
                        {
                          "display": "Region 4",
                          "value": "kazi",
                        },
                        {
                          "display": "Region 5",
                          "value": "Score",
                        },
                        {
                          "display": "Region 6",
                          "value": "repossession",
                        },
                      ],
                      textField: 'display',
                      valueField: 'value',
                      okButtonLabel: 'OK',
                      cancelButtonLabel: 'CANCEL',
                      initialValue: _myActivities,
                      fillColor: Colors.white,
                      checkBoxCheckColor:AppColor.mycolor
                  ),
                ),
                SizedBox(height: 5,),
                Text("Please select Region/Area",
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Expanded(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                                  blurRadius: 5) //blur radius of shadow
                            ]
                        ),

                        child: MultiSelectFormField(
                            title: Text("Region",style: TextStyle(fontSize: 20, color:Colors.black87 ),),
                            dataSource: [
                              {
                                "display": "Region 1",
                                "value": "disable180",
                              },
                              {
                                "display": "Region 2",
                                "value": "disable15",
                              },
                              {
                                "display": "Region 3",
                                "value": "agent",
                              },
                              {
                                "display": "Region 4",
                                "value": "kazi",
                              },
                              {
                                "display": "Region 5",
                                "value": "Score",
                              },
                              {
                                "display": "Region 6",
                                "value": "repossession",
                              },
                            ],
                            textField: 'display',
                            valueField: 'value',
                            okButtonLabel: 'OK',
                            cancelButtonLabel: 'CANCEL',
                            initialValue: _myActivities,
                            fillColor: Colors.white,
                            checkBoxCheckColor:AppColor.mycolor
                        ),
                      ),
                    ),

                    SizedBox(width: 10,),
                    Expanded(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                                  blurRadius: 5) //blur radius of shadow
                            ]
                        ),

                        child: MultiSelectFormField(
                            title: Text("Area",style: TextStyle(fontSize: 20, color:Colors.black87 ),),
                            dataSource: [
                              {
                                "display": "Area 1",
                                "value": "disable180",
                              },
                              {
                                "display": "Area 2",
                                "value": "disable15",
                              },
                              {
                                "display": "Area 3",
                                "value": "agent",
                              },
                              {
                                "display": "Area 4",
                                "value": "kazi",
                              },
                              {
                                "display": "Area 5",
                                "value": "Score",
                              },
                              {
                                "display": "Area 6",
                                "value": "repossession",
                              },
                            ],
                            textField: 'display',
                            valueField: 'value',
                            okButtonLabel: 'OK',
                            cancelButtonLabel: 'CANCEL',
                            initialValue: _myActivities,
                            fillColor: Colors.white,
                            checkBoxCheckColor:AppColor.mycolor
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 15,),

                //task Row
                Text("Priority",textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        contentPadding: EdgeInsets.all(0.0),
                        title: Text("High"),
                        tileColor: Colors.cyan,
                        value: "high",
                        dense: true,
                        groupValue: priority,
                        onChanged: (value){
                          setState(() {
                            priority = value.toString();

                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        contentPadding: EdgeInsets.all(0.0),
                        title: Text("Normal"),
                        tileColor: Colors.red.shade50,
                        value: "normal",
                        dense: true,
                        groupValue: priority,
                        onChanged: (value){
                          setState(() {
                            priority = value.toString();
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        contentPadding: EdgeInsets.all(0.0),
                        title: Text("Low"),
                        tileColor: Colors.red.shade50,
                        value: "low",
                        dense: true,
                        groupValue: priority,
                        onChanged: (value){
                          setState(() {
                            priority = value.toString();
                          });
                        },
                      ),
                    ),

                  ],
                ),
                Text("People Involve",textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 15,),
                DecoratedBox(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                            blurRadius: 5) //blur radius of shadow
                      ]
                  ),

                  child: MultiSelectFormField(
                      title: Text("User Role",style: TextStyle(fontSize: 20, color:Colors.black87 ),),
                      dataSource: [
                        {
                          "display": "ABM",
                          "value": "disable180",
                        },
                        {
                          "display": "EO",
                          "value": "disable15",
                        },
                        {
                          "display": "RBM",
                          "value": "agent",
                        },
                        {
                          "display": "ZBM",
                          "value": "kazi",
                        },
                        {
                          "display": "RM",
                          "value": "Score",
                        },
                      ],
                      textField: 'display',
                      valueField: 'value',
                      okButtonLabel: 'OK',
                      cancelButtonLabel: 'CANCEL',
                      initialValue: _myActivities,
                      fillColor: Colors.white,
                      checkBoxCheckColor:AppColor.mycolor
                  ),
                ),
                SizedBox(height: 10,),
                Text("Task Description",textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                TextFormField(

                    maxLines: 5,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.mycolor, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12, width: 1.0),
                      ),
                      labelText: 'Describe the task',

                    )

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GFButton(onPressed:  () async {
                      DateTime? startDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2022),
                          lastDate: DateTime(2030));

                    },
                      text: startDate,
                      textColor: Colors.black87,
                      color: AppColor.mycolor,
                    ),

                    GFButton(onPressed: () {
                      showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2022),
                          lastDate: DateTime(2030));
                    },
                      text: 'End date',
                      color: AppColor.mycolor,
                      textColor: Colors.black87,
                    )
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(40), // fromHeight use double.infinity as width and 40 is the height
                  ),
                  onPressed: () {
                    print("object");
                  },
                  child: Text(newdate),
                )

              ],
            ),


          ),
        ),
      ),


    );
  }

}

class MyDropDown extends StatelessWidget {

  List? data;
  String label;
  MyDropDown({Key? key,
    required this.data,
    required this.label
  })
      : super(key: key);
  List? _myActivities;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                blurRadius: 5) //blur radius of shadow
          ]
      ),
      child: MultiSelectFormField(
          title: Text(label,style: TextStyle(fontSize: 20, color:Colors.black87 ),),
          dataSource: data,/*[
            {
              "display": "Region 1",
              "value": "region",
            },
            {
              "display": "Region 2",
              "value": "disable15",
            },
            {
              "display": "Region 3",
              "value": "agent",
            },
            {
              "display": "Region 4",
              "value": "kazi",
            },
            {
              "display": "Region 5",
              "value": "Score",
            },
            {
              "display": "Region 6",
              "value": "repossession",
            },
          ]*/
          textField: 'display',
          valueField: 'value',
          okButtonLabel: 'OK',
          cancelButtonLabel: 'CANCEL',
          initialValue: _myActivities,
          fillColor: Colors.white,
          checkBoxCheckColor:AppColor.mycolor
      ),
    );
  }
}