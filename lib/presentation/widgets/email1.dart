import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project/bloc/email_bloc.dart';
import 'package:project/const/strings_constants.dart';
import 'package:project/presentation/pages/screen2/screen2.dart';

class Email1 extends StatelessWidget {
  final EmailBloc _emailBloc = EmailBloc();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder(
        builder: (context, AsyncSnapshot<String> snapshot) {
          return Stack(
            children: [
              Positioned(
                child: Container(
                  margin: const EdgeInsets.all(40),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: TextField(
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
                  ),
                ),
              ),

              Positioned(
                width: MediaQuery.of(context).size.width,
                bottom: 0,
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                  child: ElevatedButton(
                    onPressed: () {
                      if (!snapshot.hasError) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Screen2()),
                        );
                      }
                      log('pressed');
                    },
                    child: Text(next),
                  ),
                ),
              )
            ],
          );
        },
        stream: _emailBloc.textStream,
      ),
    );
  }
}
