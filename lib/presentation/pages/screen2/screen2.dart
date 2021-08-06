import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project/const/strings_constants.dart';
import 'package:project/presentation/pages/custom/row_circles.dart';
import 'package:project/presentation/pages/screen2/row_aa1239.dart';

class Screen2 extends StatelessWidget {
  bool isCorrect = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Create Account'),
          actions: [

          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RowCircles(color: Colors.green,),
            Text('Create Password'),
            Text('Password will be used to login to account'),
            /// text password
            Text('Complexity'),
            Text(''),
            RowAa1239(isCorrect: isCorrect,),
            ElevatedButton(
              onPressed: () {
                log('pressed');
              },
              child: Text(next),
            )
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}