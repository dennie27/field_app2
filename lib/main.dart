import 'package:FieldApp/home.dart';
import 'package:FieldApp/http_online.dart';
import 'package:FieldApp/login.dart';
import 'package:FieldApp/utils/themes/theme.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}




