import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widget_theme/text_themes.dart';


class AppTheme{
  static ThemeData lightTheme = ThemeData(
   primarySwatch:  AppColor.mycolor,
    brightness: Brightness.light,
    textTheme:GoogleFonts.robotoSerifTextTheme(),
    appBarTheme: AppBarTheme(),
    floatingActionButtonTheme: FloatingActionButtonThemeData(),

    elevatedButtonTheme: ElevatedButtonThemeData(style:ElevatedButton.styleFrom())
  );
  static ThemeData darkTheme = ThemeData(
    primarySwatch: AppColor.mycolor,
    brightness: Brightness.dark,
      textTheme:GoogleFonts.robotoSerifTextTheme(),
    appBarTheme: AppBarTheme(),
    floatingActionButtonTheme: FloatingActionButtonThemeData(),
    elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom())
  );
}
class AppColor {
  static const MaterialColor mycolor = const MaterialColor(
    0xffffea00,
    const <int, Color>{
      50: const Color(0xffffec1a ),//10%
      100: const Color(0xffffee33),//20%
      200: const Color(0xfffff04d),//30%
      300: const Color(0xfffff266),//40%
      400: const Color(0xfffff580	),//50%
      500: const Color(0xfffff799),//60%
      600: const Color(0xfffff9b3),//70%
      700: const Color(0xfffffbcc),//80%
      800: const Color(0xfffffde6),//90%
      900: const Color(0xffffffff),//100%
    },
  );
}