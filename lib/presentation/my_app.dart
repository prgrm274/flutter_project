import 'package:flutter/material.dart';
import 'package:project/presentation/pages/custom/row_circles.dart';
import 'package:project/presentation/pages/screen1/screen1.dart';
import 'package:project/presentation/pages/screen2/row_aa1239.dart';
import 'package:project/presentation/pages/screen2/screen2.dart';
import 'package:project/presentation/pages/screen3/screen3.dart';
import 'package:project/presentation/pages/screen4/screen4.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(elevation: 0),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        // body: Screen1(),
        // body: Screen2(),
        // body: Screen3(),
        body: Screen4(),
        // body: RowCircles(),
        // body: Email1(),
      ),
    );
  }
}