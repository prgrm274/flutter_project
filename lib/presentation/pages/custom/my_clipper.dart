
import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    print(size.width.toString());///debugPrint

    var path = new Path();
    path.lineTo(0, size.height);/// height of container in clippath

    ///1
    var control1 = Offset(17, size.height/2);
    var end1 = Offset(76, size.height/2);
    path.quadraticBezierTo(control1.dx, control1.dy, end1.dx, end1.dy);

    ///2
    path.lineTo(size.width, size.height);

    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {

    throw UnimplementedError();
  }

}