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
        body: Stack(
          fit: StackFit.loose,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Center(
                    child: Stack(
                      fit: StackFit.loose,
                      children: [
                        Positioned(
                            top: 30,
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
                            RowCircle(color: Colors.green, teks: '1'),
                            RowCircle(color: Colors.white, teks: '2'),
                            RowCircle(color: Colors.white, teks: '3'),
                            RowCircle(color: Colors.white, teks: '4'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,//-40,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Container(
                          margin: const EdgeInsets.fromLTRB(40, 0, 40, 10),
                          child: Text(
                              s2CreatePassword,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold))
                      ),
                      Container(
                          margin: const EdgeInsets.fromLTRB(40, 0, 40, 20),
                          child: Text(
                              s2PasswordLogin,
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold))
                      ),
                    ],
                  ),
                ),
                RowAa1239(),
              ],
            )
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}