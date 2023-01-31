import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Profile  extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  ProfileState createState() => ProfileState();
}
class ProfileState extends State<Profile> {
  var currentUser = FirebaseAuth.instance.currentUser;
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
          Text("${currentUser?.displayName}"),
          Text(" Area"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(onPressed: (){},child: Text("255762628707")),
              TextButton(onPressed: (){},child: Text("Location")),

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
          ElevatedButton(onPressed: (){

          }, child: Text("user"))


        ],
      ),
    );
  }

}