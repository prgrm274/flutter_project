import 'package:flutter/material.dart';
import 'package:project/bloc/password_bloc.dart';

class RowAa1239 extends StatelessWidget {
  final PasswordBloc _passwordBloc = PasswordBloc();

  var isCorrect = false;

  RowAa1239({required this.isCorrect});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _elemenKolom('a', 'Lowercase'),
          _elemenKolom('A', 'Uppercase'),
          _elemenKolom('123', 'Number'),
          _elemenKolom('9+', 'Characters'),
        ],
      ),
    );
  }

  Widget _elemenKolom(String teks, String casename) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isCorrect
        ? Icon(Icons.check)
        : Text(
          teks,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.blue[200],
          ),
        ),
        Text(
          casename,
          style: TextStyle(
            color: Colors.blue[200],
          ),
        ),
      ],
    );
  }
}
