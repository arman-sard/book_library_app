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
   statusBarColor: Colors.white, 
   statusBarBrightness: Brightness.light 
));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.deepPurple),
        dividerTheme: const DividerThemeData(space: 20, thickness: 1, color: Color.fromARGB(90, 124, 161, 154), indent: 20, endIndent: 20),
        buttonTheme: const ButtonThemeData(buttonColor: Colors.green),
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
          bodyText2: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 13),
          subtitle1: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 13),
          headline6: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 15),
          button: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w400, fontSize: 12,) ,
        ),
      ),
      home: const HomePage(),
    );
  }
}
