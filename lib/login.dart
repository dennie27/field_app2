import 'package:FieldApp/services/auth_services.dart';
import 'package:FieldApp/utils/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home.dart';

class Login extends StatelessWidget {
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlutterLogo(size: 120,),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Hey There,\nWelcome back",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),),
          ),
          SizedBox(height: 8,),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Login to your account to continue",
              style:TextStyle(
                fontSize: 16
              ) ,),
          ),
          ElevatedButton.icon(
            icon: FaIcon(FontAwesomeIcons.google,color: Colors.red,),
              style: ElevatedButton.styleFrom(
               minimumSize: Size(double.infinity, 50)
              ),
              onPressed: AuthService().signInWithGoogle(), label: Text("Sign in with Sun King Email"))

        ],
      ),

    );
  }
}