import 'package:flutter/material.dart';
import 'package:project/presentation/pages/custom/row_circles.dart';
import 'package:project/presentation/pages/screen1/screen1.dart';
import 'package:project/presentation/pages/screen2/row_aa1239.dart';
import 'package:project/presentation/pages/screen2/screen2.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        // body: Screen1(),
        body: Screen2(),
        // body: RowCircles(),
        // body: Email1(),
      ),
    );
  }
}