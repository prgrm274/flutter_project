import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project/bloc/email_bloc.dart';
import 'package:project/const/strings_constants.dart';
import 'package:project/presentation/pages/screen2/screen2.dart';

class Email1 extends StatefulWidget {
  @override
  _Email1 createState() => _Email1();
}

class _Email1 extends State<Email1> {
  final EmailBloc _emailBloc = EmailBloc();

  TextEditingController _textEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/2,
      margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
      child: StreamBuilder(
          stream: _emailBloc.textStream,
          builder: (context, AsyncSnapshot<String> snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,),
                  /// TextField Email
                  child: Container(
                    width: MediaQuery.of(context).size.width-80,
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.grey[200],),
                    child: TextField(
                      controller: _textEmail,
                      onChanged: (String teks) {
                        _emailBloc.checkText(teks);
                        if (teks.contains(r"[A-a]")) {
                          log("A-a");
                        } else if (teks.contains(r"[0-9]")) {
                          log("0-9");
                        }
                      },
                      // onChanged: (String teks) => _emailBloc.checkText(teks),///
                      decoration: InputDecoration(
                        icon: Icon(Icons.email),
                        errorText: snapshot.hasError
                            ? snapshot.error.toString()
                            : null,
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ),
                /// Button Next
                Container(
                  width: MediaQuery.of(context).size.width-40,
                  height: 50,
                  // padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_textEmail.text.isEmpty) {
                        log('pressed');
                      } else if (snapshot.hasError) {
                        log('pressed');
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Screen2()),
                        );
                      }
                    },
                    child: Text(next),
                  ),
                )
              ],
            );
          }
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailBloc.dispose();
  }
}
