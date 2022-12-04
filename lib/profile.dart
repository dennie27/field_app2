import 'package:flutter/material.dart';


class Profile  extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  ProfileState createState() => ProfileState();
}
class ProfileState extends State<Profile> {
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
          Text("User name"),
          Text(" Area"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Phone Number"),
              Text("Location"),
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