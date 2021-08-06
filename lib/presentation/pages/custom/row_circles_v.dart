import 'package:flutter/material.dart';

class RowCirclesV extends StatelessWidget {
  final teks;

  RowCirclesV({this.teks});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        fit: StackFit.loose,
        children: [
          Positioned(
              top: 30,
              child: _lineBelowCircles(context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _circle(teks),
              _circle(teks),
              _circle(teks),
              _circle(teks),
              _circle(teks),
            ],
          ),
        ],
      )
    );
  }

  Widget _circle(teks){
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black26),
          shape: BoxShape.circle
      ),
      child: Text(teks),
    );
  }

  Widget _lineBelowCircles(context){
    return Container(
      height: 4,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.black26,
        border: Border.all(color: Colors.black26),
        shape: BoxShape.rectangle,
      ),
      child: Text('2'),
    );
  }
}
