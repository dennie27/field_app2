
import 'package:FieldApp/utils/themes/theme.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
          theme: AppTheme.lightTheme,
          /*darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,*/
          debugShowCheckedModeBanner: false,
          home: HomePage(

          ),
    );
  }
}




