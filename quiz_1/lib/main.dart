import 'package:flutter/material.dart';
import 'package:quiz_1/home_page.dart';
import 'package:quiz_1/detail_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/home': (BuildContext ctx) => HomePage(),
        '/detail': (BuildContext ctx) => DetailPage(),
      },
    );
  }
}




