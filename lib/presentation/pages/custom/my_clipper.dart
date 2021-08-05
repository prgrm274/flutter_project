
import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    print(size.width.toString());///debugPrint

    var path = new Path();
    path.lineTo(0, size.height);

    ///1
    var start1 = Offset(size.width/5, size.height);
    var end1 = Offset(size.width/2.25, size.height-50);
    path.quadraticBezierTo(start1.dx, start1.dy, end1.dx, end1.dy);

    ///2
    var start2 = Offset(size.width - (size.width/3.24), size.height-105);
    var end2 = Offset(size.width, size.height-10);
    path.quadraticBezierTo(start2.dx, start2.dy, end2.dx, end2.dy);

    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {

    throw UnimplementedError();
  }

}