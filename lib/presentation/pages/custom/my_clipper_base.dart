
import 'package:flutter/material.dart';

class MyClipperBase extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    print(size.width.toString());///debugPrint

    var path = new Path();

    ///
    /// Draws a straight line from current point to the first point of the path.
    /// In this case (0, 0), since that's where the paths start by default.
    ///
    /// width and height here is of Container's

    /// Draw a straight line from current point to the bottom left corner.
    path.lineTo(0.0, size.height);

    /// Draw a straight line from current point to the top right corner.
    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {

    return false;
  }

}