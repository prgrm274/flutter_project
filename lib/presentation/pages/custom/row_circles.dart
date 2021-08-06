import 'package:flutter/material.dart';

class RowCircles extends StatelessWidget {
  final Color color;

  RowCircles({required this.color});

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
              _circle('1', context, color),
              _circle('2', context, color),
              _circle('3', context, color),
              _circle('4', context, color),
            ],
          ),
        ],
      )
    );
  }

  Widget _circle(teks, context, color){
    return Container(
      width: MediaQuery.of(context).size.width/7,
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.black26),
          shape: BoxShape.circle
      ),
      child: Text(teks, textAlign: TextAlign.center,),
    );
  }

  Widget _lineBelowCircles(context){
    return Container(
      color: Colors.black45,
      height: 5,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
      child: Text('2'),
    );
  }
}
