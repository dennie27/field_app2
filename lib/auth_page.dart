

import 'package:FieldApp/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'dashboard.dart';

class AuthCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return Home();
          }else{
            return Login();
          }
        },
      ),
    );
  }
}