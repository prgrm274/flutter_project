import 'package:flutter/material.dart';

class MyLineClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height);/// height of container in clippath

    path.lineTo(10, size.height);

    path.lineTo(size.width/2, size.height/2);

    path.lineTo((size.width/2)-20, size.height/2);

    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {

    throw UnimplementedError();
  }

}