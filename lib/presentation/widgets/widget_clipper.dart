import 'package:flutter/material.dart';
import 'package:project/presentation/pages/custom/my_clipper_base.dart';

class WidgetClipper extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}