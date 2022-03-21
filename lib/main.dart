import 'package:book_library_app/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.deepPurple),
        dividerTheme: const DividerThemeData(space: 10, thickness: 1, color: Color.fromARGB(90, 124, 161, 154), indent: 20, endIndent: 20),
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
          bodyText2: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 13),
          subtitle1: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 13),
          headline6: TextStyle(fontSize: 15, color: Colors.deepPurple, fontWeight: FontWeight.bold),
          button: TextStyle(fontSize: 12, fontWeight: FontWeight.w400) ,
        ),
      ),
      home: const HomePage(),
    );
  }
}
