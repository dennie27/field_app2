import 'package:flutter/material.dart';


class CProfile  extends StatefulWidget {
const CProfile({Key? key}) : super(key: key);
@override
CProfileState createState() => CProfileState();
}
class CProfileState extends State<CProfile> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.blueGrey.shade800,
              radius: 50,
              child: Text("CP"),
            ),
          ),
          Text("Customer name"),
          Text("Customer Area"),
          Text("Product"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              TextButton(onPressed: (){},child: Text("Customer Number")),
    TextButton(onPressed: (){},child: Text("Customer Location")),
            ],

          ),
          Card(
            shadowColor: Colors.amber,
            color: Colors.black,
            child: ListTile(
              title: Center(
                  child: Text("Last Activities",
                      style: TextStyle(fontSize: 15, color: Colors.yellow))),
              dense: true,
            ),
          ),
          Text("Payments"),
          Text("data"),


        ],
      ),
    );
  }

}