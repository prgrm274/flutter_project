import 'package:flutter/material.dart';
import 'package:project/presentation/pages/custom/row_circles.dart';
import 'package:project/presentation/pages/screen3/row_aa1239.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  bool isCorrect = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Screen 1'),
          backgroundColor: Colors.indigo,
        ),
        body: RowAa1239(isCorrect: isCorrect,),
        // body: RowCircles(),
        // body: Email1(),
      ),
    );
  }
}