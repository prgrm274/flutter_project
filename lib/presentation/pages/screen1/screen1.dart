import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project/const/strings_constants.dart';
import 'package:project/presentation/pages/custom/my_clipper.dart';
import 'package:project/presentation/pages/custom/my_line_clipper.dart';
import 'package:project/presentation/pages/custom/row_circles.dart';
import 'package:project/presentation/pages/screen1/email1.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1 createState() => _Screen1();
}

class _Screen1 extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: Colors.blue[500],
        body: Stack(
          fit: StackFit.loose,
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                color: Colors.blue[600],
                width: MediaQuery.of(context).size.width,
                height: 200,/// height of container in clippath
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                  child: Center(
                    child: Stack(
                      fit: StackFit.loose,
                      children: [
                        Positioned(
                            top: 32,
                            width: MediaQuery.of(context).size.width-40,
                            child: Container(
                              color: Colors.black45,
                              height: 5,
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                            )
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RowCircle(color: Colors.white, teks: '1'),
                            RowCircle(color: Colors.white, teks: '2'),
                            RowCircle(color: Colors.white, teks: '3'),
                            RowCircle(color: Colors.white, teks: '4'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 120),
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Container(
                          margin: const EdgeInsets.fromLTRB(40, 40, 40, 0),
                          child: Text(
                              s1Welcome,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold))
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(40, 10, 40, 0),
                        child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                TextSpan(text: s1GIN),
                                TextSpan(text: s1Finans, style: TextStyle(
                                    color: Colors.lightBlue,
                                    fontSize: 28)),
                              ]),),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(40, 10, 40, 0),
                        decoration: BoxDecoration(
                        ),
                        child: Text(
                            s1WelcomeFuture,
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 10,
              child: Email1(),
            ),
          ],
        )
      ),
    );
  }
}
