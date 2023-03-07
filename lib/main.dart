
import 'package:FieldApp/add_task.dart';
import 'package:FieldApp/firebase.dart';
import 'package:FieldApp/services/auth_page.dart';
import 'package:FieldApp/dashboard.dart';
import 'package:FieldApp/services/auth_services.dart';
import 'package:FieldApp/step_form.dart';
import 'package:FieldApp/utils/themes/theme.dart';
import 'package:call_log/call_log.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'routing/bottom_nav.dart';
import 'login.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}



class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  bool isLogin = false;
  @override
  void initState() {
    user = _auth.currentUser;
    if(user != null){
      isLogin = true;
    }else{
      isLogin = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
          theme: AppTheme.lightTheme,
          /*darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,*/
          debugShowCheckedModeBanner: false,
          home: isLogin?NavPage():Login(),
    );
  }
}


