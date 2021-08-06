import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project/const/strings_constants.dart';
import 'package:project/presentation/pages/screen2/row_aa1239.dart';

class Screen2 extends StatelessWidget {

  bool isCorrect = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
    );
  }
}