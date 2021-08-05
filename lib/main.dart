import 'package:flutter/material.dart';
import 'package:project/presentation/pages/custom/my_clipper.dart';
import 'package:project/presentation/pages/custom/my_clipper_base.dart';
import 'package:project/presentation/widgets/email1.dart';

void main() {
  runApp(MyApp());
}

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
        body: Email1(),
      ),
    );
  }
}
