import 'package:FieldApp/services/auth_services.dart';
import 'package:FieldApp/utils/themes/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() async {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (contex) => GoogleAuth(),
        child: MaterialApp(
          theme: AppTheme.lightTheme,
          /*darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,*/
          debugShowCheckedModeBanner: false,
          home: AuthService().AuthState(),
        )
    );
  }
}




