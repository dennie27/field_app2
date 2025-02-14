

import 'package:flutter/material.dart';


class UserNotification extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),

      ),
      body: ListView.builder(
          itemCount: 0,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                leading: const Icon(Icons.list),
                trailing: const Text(
                  "45",
                  style: TextStyle(color: Colors.green, fontSize: 15),
                ),
                title: Text("Area $index"));
          }),

    );
  }
}