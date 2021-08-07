import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project/const/strings_constants.dart';
import 'package:project/presentation/pages/custom/row_circles.dart';
import 'package:project/presentation/pages/screen2/row_aa1239.dart';

class Screen2 extends StatefulWidget {
  @override
  _Screen2 createState() => _Screen2();
}

class _Screen2 extends State<Screen2> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Create Account'),
          actions: [

          ],
        ),
        backgroundColor: Colors.blue[500],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RowCircles(color: Colors.green,),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Create Password'),
                  Text('Password will be used to login to account'),
                ],
              ),
            ),
            RowAa1239(),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}