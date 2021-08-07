import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/const/strings_constants.dart';
import 'package:project/presentation/pages/custom/row_circles.dart';
import 'package:project/presentation/pages/screen4/screen4.dart';

class Screen3 extends StatefulWidget {
  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  var _selected1, _selected2, _selected3;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
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
                            RowCircle(color: Colors.green, teks: '2'),
                            RowCircle(color: Colors.white, teks: '3'),
                            RowCircle(color: Colors.white, teks: '4'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Container(
                          margin: const EdgeInsets.fromLTRB(40, 0, 40, 10),
                          child: Text(
                              s3PInfo,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold))
                      ),
                      Container(
                          margin: const EdgeInsets.fromLTRB(40, 0, 40, 20),
                          child: Text(
                              s3PleaseFill,
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold))
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(40, 0, 40, 20),
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Goal for activation', textAlign: TextAlign.start,
                                  style: TextStyle(color: Colors.grey[400])),
                            ),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                isExpanded: true,
                                disabledHint: Text('disabled'),
                                focusColor: Colors.white,
                                icon: Icon(Icons.keyboard_arrow_down),
                                value: _selected1,
                                style: TextStyle(color: Colors.white),
                                iconEnabledColor: Colors.black,
                                items: <String>[
                                  'Goal A', 'Goal B', 'Goal C', 'Goal D', 'Goal E',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  );
                                }).toList(),
                                hint: Text(
                                  "- Choose Option -",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18),),
                                onChanged: (String? value) {
                                  setState(() {
                                    _selected1 = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(40, 0, 40, 20),
                        padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Monthly Income', textAlign: TextAlign.start,
                                  style: TextStyle(color: Colors.grey[400])),
                            ),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                isExpanded: true,
                                disabledHint: Text('disabled'),
                                focusColor: Colors.white,
                                icon: Icon(Icons.keyboard_arrow_down),
                                value: _selected2,
                                style: TextStyle(color: Colors.white),
                                items: <String>[
                                  '3M', '5M', '7M'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(color: Colors.black),),);
                                }).toList(),
                                hint: Text(
                                  "- Choose Option -",
                                  style: TextStyle(color: Colors.black, fontSize: 18),),
                                onChanged: (String? value) {
                                  setState(() {
                                    _selected2 = value;
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(40, 0, 40, 20),
                        padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Monthly expense', textAlign: TextAlign.start,
                              style: TextStyle(color: Colors.grey[400])),
                            ),
                            /// For monthly expense I chose to use DropdownButtonFormField
                            DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                isExpanded: true,
                                focusColor: Colors.white,
                                icon: Icon(Icons.keyboard_arrow_down),
                                value: _selected3,
                                style: TextStyle(color: Colors.white),
                                items: <String>[
                                  '1M', '2M', '3M', '>3M',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                        value,
                                        style: TextStyle(color: Colors.black)));
                                }).toList(),
                                hint: Text(
                                  "- Choose Option -",
                                  style: TextStyle(color: Colors.black, fontSize: 18),),
                                onChanged: (String? value) {
                                  setState(() {
                                    _selected3 = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        )
                      ),
                      /// Button Next
                      SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width-20,
                        child: Stack(
                          alignment: Alignment.center,
                          fit: StackFit.loose,
                          children: [
                            Positioned(
                              width: MediaQuery.of(context).size.width,
                              bottom: 10,
                              child: Container(
                                height: 50,
                                // padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_selected1 != null && _selected2 != null && _selected3 != null) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Screen4()),
                                      );
                                    }
                                  },
                                  child: Text(next),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}