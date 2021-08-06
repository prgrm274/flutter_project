import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project/bloc/email_bloc.dart';

class Email1 extends StatelessWidget {
  final EmailBloc _emailBloc = EmailBloc();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder(
        builder: (context, AsyncSnapshot<String> snapshot) {
          return TextField(
            onChanged: (String teks) {
              if (teks.contains(r"[A-a]")) {
                log("A-a");
              } else if (teks.contains(r"[0-9]")) {
                log("0-9");
              }
              _emailBloc.checkText(teks);
            },
            // onChanged: (String teks) => _emailBloc.checkText(teks),///
            decoration: InputDecoration(
              errorText: snapshot.hasError
                  ? snapshot.error.toString()
                  : null,
              hintText: 'example a@gmail.com',

            ),
          );
        },
        stream: _emailBloc.textStream,
      ),
    );
  }
}
