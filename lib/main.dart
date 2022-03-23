import 'package:book_library_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white, statusBarBrightness: Brightness.light));
    const int _blackPrimaryValue = 0xFF000000;
    const MaterialColor primaryBlack = MaterialColor(
      _blackPrimaryValue,
      <int, Color>{
        50: Color(0xFF000000),
        100: Color(0xFF000000),
        200: Color(0xFF000000),
        300: Color(0xFF000000),
        400: Color(0xFF000000),
        500: Color(_blackPrimaryValue),
        600: Color(0xFF000000),
        700: Color(0xFF000000),
        800: Color(0xFF000000),
        900: Color(0xFF000000),
      },
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: primaryBlack,
        primaryColor: const Color.fromARGB(62, 128, 161, 155),
        primaryColorLight: const Color.fromARGB(24, 177, 236, 226),
        primaryColorDark: const Color.fromARGB(255, 89, 95, 180),
        shadowColor: const Color.fromARGB(171, 171, 240, 228),
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 89, 95, 180)),
        dividerTheme: const DividerThemeData(
            space: 20,
            thickness: 1,
            color: Color.fromARGB(62, 128, 161, 155),
            indent: 20,
            endIndent: 20),
        highlightColor: Colors.green[800],
        textTheme: const TextTheme(
          bodyText1: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w400, fontSize: 13),
          bodyText2: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 12),
          subtitle1: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w400, fontSize: 12),
          headline3: TextStyle(
              color: Color.fromARGB(255, 27, 27, 27),
              fontWeight: FontWeight.w400,
              fontSize: 14),
          headline4: TextStyle(
              color: Color.fromARGB(171, 88, 105, 103),
              fontWeight: FontWeight.w400,
              fontSize: 14),
          headline5: TextStyle(
              color: Color.fromARGB(255, 59, 58, 153),
              fontWeight: FontWeight.w400,
              fontSize: 12),
          headline6: TextStyle(
              color: Color.fromARGB(255, 59, 58, 153),
              fontWeight: FontWeight.bold,
              fontSize: 13),
          button: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
