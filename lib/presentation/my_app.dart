import 'package:flutter/material.dart';
import 'package:project/presentation/pages/custom/row_circles.dart';

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
        appBar: AppBar(
          title: Text('Screen 1'),
          backgroundColor: Colors.indigo,
        ),
        body: RowCircles(),
        // body: Email1(),
      ),
    );
  }
}