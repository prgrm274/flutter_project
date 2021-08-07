import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project/bloc/password_bloc.dart';
import 'package:project/const/strings_constants.dart';

class RowAa1239 extends StatefulWidget {
  // RowAa1239({required Key key}) : super(key: key);

  @override
  _RowAa1239 createState() => _RowAa1239();
}

class _RowAa1239 extends State<RowAa1239>{
  final PasswordBloc _passwordBloc = PasswordBloc();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool _containsLowercase = false;
  String? _psw;
  TextEditingController _textField1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: _passwordBloc.textStream,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width-40,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: _textField1,
                    onChanged: (String password) {
                      _passwordBloc.checkText(password);
                    },
                    decoration: InputDecoration(
                        hintText: '******'
                    ),
                  ),
                ),
                Container(
                  child: Text('Complexity'
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    validateLowercase(_textField1.text)
                    // validateStructure(_textField1.text)///
                    // _textField1.text.contains(RegExp(r'^(?=.*?[a-z])'))
                    // snapshot.data.toString().contains(RegExp(r'[a-z]'))
                    // snapshot.data.toString().contains(RegExp(r'^(?=.*?[a-z])'))
                        ? _elemenCheck('Lower') : _elemenText('a', 'Lowercase'),
                    validateUppercase(_textField1.text)
                        ? _elemenCheck('Upper') : _elemenText('A', 'Uppercase'),
                    validateNumber(_textField1.text)
                        ? _elemenCheck('Numbers') : _elemenText('123', 'Numbers'),
                    validateCharacters(_textField1.text)
                        ? _elemenCheck('Characters') : _elemenText('9+', 'Characters'),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    log('pressed');
                  },
                  child: Text(next),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  bool validateLowercase(String value) {
    String patternLowerCaseCharacters = r'^(?=.*?[a-z])';
    return RegExp(patternLowerCaseCharacters).hasMatch(value) ? true : false;
  }

  bool validateUppercase(String value) {
    String patternUpperCaseCharacters = r'^(?=.*?[A-Z])';
    return RegExp(patternUpperCaseCharacters).hasMatch(value) ? true : false;
  }

  bool validateNumber(String value) {
    String patternNumbers = r'^(?=.*?[0-9])';
    return RegExp(patternNumbers).hasMatch(value) ? true : false;
  }

  bool validateCharacters(String value) {
    return (value.length > 9) ? true : false;
  }

  Widget _elemenCheck(String casename) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.check),
        _textJenisPassword2(casename),
      ],
    );
  }

  Widget _elemenText(String teks, String casename) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _textJenisPassword2(teks),
        _textJenisPassword2(casename),
      ],
    );
  }

  Widget _textJenisPassword2(String casename){
    return Text(
      casename,
      style: TextStyle(
        color: Colors.blue[200],
      ),
    );
  }
}
