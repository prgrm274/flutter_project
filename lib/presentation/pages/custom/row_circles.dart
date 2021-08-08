import 'package:flutter/material.dart';

class RowCircle extends StatelessWidget {
  final Color color;
  final teks;

  RowCircle({required this.color, this.teks});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: MediaQuery.of(context).size.width/7,
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Colors.black, width: 2),
            shape: BoxShape.circle
        ),
        child: Text(teks, textAlign: TextAlign.center,),
      )
    );
  }
}
