

import '../acl_task.dart';
import 'appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../utils/themes/theme.dart';
import '../../task.dart';
import '../../dashboard.dart';

class NavPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return NavPagePageState();
  }

}
class NavPagePageState extends State<NavPage> {
  int _selectedIndex = 0;
  final List<Widget> _tabs = <Widget>[
    Home(),
    Task(),
    //Customer()
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:SKAppBar(height: 70,),
      body: Container(
          child: _tabs.elementAt(_selectedIndex)),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColor.mycolor,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(

              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: AppColor.mycolor,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.black87,
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Customer',
                ),
                GButton(
                  icon: Icons.task,
                  text: 'task',
                ),
                /*GButton(
                  icon: Icons.phone,
                  text: 'Customer',
                ),*/
              ],
              onTabChange: (index){
                setState(() {
                  _selectedIndex= index;
                });
              },

            ),
          ),
        ),
      ),
    );
  }
}

