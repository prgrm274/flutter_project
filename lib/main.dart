import 'package:flutter/material.dart';
import 'package:project/presentation/pages/custom/my_clipper.dart';
import 'package:project/presentation/pages/custom/my_clipper_base.dart';

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
        body: Container(
          child: Stack(
            children: [
              Opacity(
                opacity: 0.5,
                child: ClipPath(
                  clipper: MyClipperBase(),
                  child: Container(
                    color: Colors.greenAccent,
                    height: 400,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
