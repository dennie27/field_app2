import 'package:flutter/material.dart';

import '../notification.dart';

class SKAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  SKAppBar({
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: height,
      elevation: 7,
      centerTitle: true,
      actions: [
        IconButton(onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>UserNotification(),
              ));
        }, icon: Icon(Icons.notifications)),
      ],
      leading:IconButton(onPressed: (){

      }, icon: Icon(Icons.person,)),


    );
  }
}

