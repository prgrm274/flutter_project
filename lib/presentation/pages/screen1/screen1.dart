import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project/const/strings_constants.dart';
import 'package:project/presentation/pages/custom/row_circles.dart';
import 'package:project/presentation/pages/screen1/email1.dart';

class Screen1 extends StatelessWidget {

  bool isCorrect = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[500],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RowCircles(color: Colors.green,),
            Container(
              margin: const EdgeInsets.fromLTRB(40, 40, 40, 0),
              child: Text(s1Welcome)
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(40, 10, 40, 0),
              child: RichText(
                text: TextSpan(
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 28),
                    children: <TextSpan>[
                      TextSpan(text: s1GIN),
                      TextSpan(text: s1Finans, style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 28)),
                    ]
                ),
              ),
            ),
            Text(s1WelcomeFuture),
            Email1(),
          ],
        ),
      ),
    );
  }
}
