

import 'package:FieldApp/login.dart';
import 'package:FieldApp/services/auth_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../dashboard.dart';

class AuthCheck extends StatelessWidget {
  var currentUser = FirebaseAuth.instance.currentUser!.uid;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    if(currentUser != null)
      return Home();
    else{
      return Login();
    }
  }
}
