import 'package:flutter/material.dart';
import 'package:project/presentation/bloc/email_bloc.dart';

class Email1 extends StatelessWidget {
  final EmailBloc _emailBloc = EmailBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: StreamBuilder(
            builder: (context, AsyncSnapshot<String> snapshot) {
              return TextField(
                onChanged: (String teks) => _emailBloc.updateText(teks),
                decoration: InputDecoration(
                  errorText: snapshot.hasError
                      ? snapshot.error.toString()
                      : null,
                  hintText: 'hint text',

                ),
              );
            },
            stream: _emailBloc.textStream,
          ),
        ),
      ),
    );
  }
}
