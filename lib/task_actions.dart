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
  var taskaction = ["No", "Yes"];
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
        SizedBox(
          height: 10,
        ),
        DropdownButtonFormField(
            decoration: InputDecoration(
              filled: true,
              labelText: "Did we find the right customer?",
              border: OutlineInputBorder(),
              hintStyle: TextStyle(color: Colors.grey[800]),
              hintText: "Did we find the right customer?",
            ),
            items: taskaction.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: taskAction),
        SizedBox(
          height: 10,
        ),
        if (selectedaction == 'No')
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
                borderSide: BorderSide(color: AppColor.mycolor, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12, width: 1.0),
              ),
              labelText: 'Additional details',
            )),
        if (selectedaction == 'Yes')
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter Account number',
            ),
          ),
        SizedBox(
          height: 10,
        ),
        Icon(Icons.camera_alt),
        SizedBox(
          height: 10,
        ),
        Icon(Icons.location_on),
        SizedBox(
          height: 10,
        ),
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
  var taskaction = ["No", "Yes"];
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


        DropdownButtonFormField(
            decoration: InputDecoration(
              filled: true,
              labelText: "Did you manage to work with the Agent?",
              border: OutlineInputBorder(),
              hintStyle: TextStyle(color: Colors.grey[800]),
              hintText: "Did you manage to work with the Agent?",
            ),
            items: taskaction.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: taskAction),
        SizedBox(
          height: 10,
        ),
        if (selectedaction == 'No')
        Column(
          children: [
            Text("If it related to frud please rise it through fraud App"),
            TextFormField(
                maxLines: 5,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.mycolor, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12, width: 1.0),
                  ),
                  labelText: 'Additional details',
                )),
          ],
        ),
        if (selectedaction == 'Yes')
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter Agent name',
            ),
          ),
        SizedBox(
          height: 10,
        ),
        Icon(Icons.camera_alt),
        SizedBox(
          height: 10,
        ),
        Icon(Icons.location_on),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

//Change a red zone CSAT area to orange
class RedZone extends StatefulWidget {
  @override
  State<RedZone> createState() => _RedZone();
}

class _RedZone extends State<RedZone> {
  String? selectedSubTask;
  String? selectedaction;
  var taskaction = ["No", "Yes"];
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
            hintText: 'Issues highlighted',
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
            maxLines: 5,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.mycolor, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12, width: 1.0),
              ),
              labelText: 'Additional details',
            )),




        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

//Attend to Fraud Cases
class Fraud extends StatefulWidget {
  @override
  State<Fraud> createState() => _Fraud();
}

class _Fraud extends State<Fraud> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Issues highlighted',
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
            maxLines: 5,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.mycolor, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12, width: 1.0),
              ),
              labelText: 'Feedback from the client',
            )),




        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class Audity extends StatefulWidget {
  @override
  State<Audity> createState() => _Audity();
}
class _Audity extends State<Audity>{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
              labelText: 'Takeaway',
            )),
        SizedBox(height: 10,),
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
              labelText: 'Recommendation',
            )),
        SizedBox(height: 10,),
        Icon(Icons.attach_file)
      ],
    );
  }

}

class  FieldVisit extends StatefulWidget {
  @override
  State<FieldVisit> createState() => _FieldVisit();
}
class _FieldVisit extends State< FieldVisit>{
  String? selectedaction;
  var taskaction = ["No", "Yes"];
  taskAction(String? value) {
    setState(() {
      selectedaction = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        DropdownButtonFormField(
            decoration: InputDecoration(
              filled: true,
              labelText: "Did you manage to work with the Agent?",
              border: OutlineInputBorder(),
              hintStyle: TextStyle(color: Colors.grey[800]),
              hintText: "Did you manage to work with the Agent?",
            ),
            items: taskaction.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: taskAction),

        if (selectedaction == 'No')

        Column(
          children: [
            Text("If it related to frud please rise it through fraud App"),
            TextFormField(
                maxLines: 5,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.mycolor, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12, width: 1.0),
                  ),
                  labelText: 'Additional details',
                )),
          ],
        ),
        if (selectedaction == 'Yes')
          Column(
            children: [
              SizedBox(height: 10,),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter agent name',
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.mycolor, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12, width: 1.0),
                    ),
                    labelText: 'What issues is the Agent Experiencing?',
                  )),
              Icon(Icons.camera_alt_outlined)
            ],
          ),




      ],
    );
  }

}


class Accuracy extends StatefulWidget {
  @override
  State<Accuracy> createState() => _Accuracy();
}
class _Accuracy extends State<Accuracy>{
  var taskaction = ["Correct location", "Wrong location","Not found"];
  var froud = ["No", "Yes"];
  String? selectedaction;
  String? selectedfroud;

  froudAction(String? value) {
    setState(() {
      selectedfroud = value;
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
        DropdownButtonFormField(
            decoration: InputDecoration(
              filled: true,
              labelText: "Did we find the location?",
              border: OutlineInputBorder(),
              hintStyle: TextStyle(color: Colors.grey[800]),
              hintText: "Did we find the location?",
            ),
            items: taskaction.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: taskAction),
        SizedBox(height: 10,),
        if(selectedaction == 'Correct location')
          Column(
            children: [
              Icon(Icons.camera_alt_rounded),
              Icon(Icons.location_on),
            ],
          ),

        if(selectedaction == 'Wrong location' )
          Column(
            children: [
              Icon(Icons.camera_alt_rounded),
              Icon(Icons.location_on),
              DropdownButtonFormField(
                  decoration: InputDecoration(
                    filled: true,
                    labelText: "Does it relate with froud?",
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Does it relate with froud?",
                  ),
                  items: froud.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: froudAction),
              if(selectedfroud == 'No')
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
                      labelText: 'Reason for moving',
                    )),
              SizedBox(height: 10,),
              if(selectedfroud == 'Yes')
                Text("Please record the case to the froud app"),
            ],
          ),
          SizedBox(height: 10,),
        if(selectedaction == 'Not found' )
          Column(
            children: [
              Text("Please rise a froud case")
            ],
          ),


      ],
    );
  }

}

class Repo extends StatefulWidget {
  @override
  State<Repo> createState() => _Repo();
}
class _Repo extends State<Repo>{
  String? selectedaction;
  var taskaction = ["No", "Yes"];
  taskAction(String? value) {
    setState(() {
      selectedaction = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
            decoration: InputDecoration(
              filled: true,
              labelText: "Did you get the customers, Yes?",
              border: OutlineInputBorder(),
              hintStyle: TextStyle(color: Colors.grey[800]),
              hintText: "Did you get the customers, Yes?",
            ),
            items: taskaction.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: taskAction),
        SizedBox(height: 10,),
        if(selectedaction == 'Yes')
          Column(
            children: [
              Icon(Icons.camera_alt_rounded),
              Icon(Icons.location_on),
            ],
          ),
        SizedBox(height: 10,),
        if(selectedaction == 'No' )
          Column(
            children: [
              Text("Please rise a froud case")
            ],
          ),


      ],
    );
  }

}
class TVcostomers extends StatefulWidget {
  @override
  State<TVcostomers> createState() => _TVcostomers();
}
class _TVcostomers extends State<TVcostomers>{
  String? selectedaction;
  var taskaction = ["No", "Yes"];
  taskAction(String? value) {
    setState(() {
      selectedaction = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
            decoration: InputDecoration(
              filled: true,
              labelText: "Did you get the customers, Yes?",
              border: OutlineInputBorder(),
              hintStyle: TextStyle(color: Colors.grey[800]),
              hintText: "Did you get the customers, Yes?",
            ),
            items: taskaction.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: taskAction),
        SizedBox(height: 10,),
        if(selectedaction == 'Yes')
          Column(
            children: [
              Icon(Icons.camera_alt_rounded),
              Icon(Icons.location_on),
            ],
          ),
        SizedBox(height: 10,),
        if(selectedaction == 'No' )
          Column(
            children: [
              Text("Please rise a froud case")
            ],
          ),


      ],
    );
  }

}

class Campaign extends StatefulWidget {
  @override
  State<Campaign> createState() => _Campaign();
}
class _Campaign extends State<Campaign>{
  String? selectedaction;
  var taskaction = ["I Will do by myself", "I will assign someone"];
  taskAction(String? value) {
    setState(() {
      selectedaction = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
            decoration: InputDecoration(
              filled: true,
              labelText: "Did you get the customers?",
              border: OutlineInputBorder(),
              hintStyle: TextStyle(color: Colors.grey[800]),
              hintText: "Did you get the customers, Yes?",
            ),
            items: taskaction.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: taskAction),
        SizedBox(height: 10,),
        if(selectedaction == 'I Will do by myself')
          Column(
            children: [
              Icon(Icons.camera_alt_rounded),
              Icon(Icons.location_on),
            ],
          ),
        SizedBox(height: 10,),
        if(selectedaction == 'I will assign someone' )
          Column(
            children: [
              Text("Please rise a froud case")
            ],
          ),


      ],
    );
  }

}

class TableMeeting extends StatefulWidget {
  @override
  State<TableMeeting> createState() => _TableMeeting();
}
class _TableMeeting extends State<TableMeeting>{
  String? selectedaction;
  var taskaction = ["No", "Yes"];
  taskAction(String? value) {
    setState(() {
      selectedaction = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
            decoration: InputDecoration(
              filled: true,
              labelText: "Did you get the customers?",
              border: OutlineInputBorder(),
              hintStyle: TextStyle(color: Colors.grey[800]),
              hintText: "Did you get the customers, Yes?",
            ),
            items: taskaction.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: taskAction),
        SizedBox(height: 10,),
        if(selectedaction == 'I Will do by myself')
          Column(
            children: [
              Icon(Icons.camera_alt_rounded),
              Icon(Icons.location_on),
            ],
          ),
        SizedBox(height: 10,),
        if(selectedaction == 'I will assign someone' )
          Column(
            children: [
              Text("Please rise a froud case")
            ],
          ),


      ],
    );
  }

}