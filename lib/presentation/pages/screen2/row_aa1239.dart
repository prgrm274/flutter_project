import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project/bloc/password_bloc.dart';
import 'package:project/const/strings_constants.dart';
import 'package:project/presentation/pages/screen3/screen3.dart';

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
  TextEditingController _textPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/2,
      margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
      child: StreamBuilder(
        stream: _passwordBloc.textStream,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.white,),
                  child: TextField(
                    controller: _textPassword,
                    onChanged: (String password) {
                      _passwordBloc.checkText(password);
                    },
                    decoration: InputDecoration(hintText: '******'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          child: Text('Complexity')),
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Builder(
                            builder: (context) {
                              return (validateLowercase(_textPassword.text) &
                              validateUppercase(_textPassword.text) &
                              validateNumber(_textPassword.text)) &
                              !validateCharacters(_textPassword.text)
                                  ?
                              Text('Very Weak', style: TextStyle(color: Colors.orange,))
                                  :
                              (validateLowercase(_textPassword.text) &
                              validateUppercase(_textPassword.text) &
                              validateNumber(_textPassword.text) &
                              validateCharacters(_textPassword.text)
                                  ?
                              Text('Strong', style: TextStyle(color: Colors.greenAccent,))
                                  :
                              (validateLowercase(_textPassword.text) &
                              validateUppercase(_textPassword.text) &
                              validateNumber(_textPassword.text) &
                              validateCharactersVeryStrong(_textPassword.text)
                                  ?
                              Text('Very Strong', style: TextStyle(color: Colors.lightGreenAccent,))
                                  :
                              Text('Strong', style: TextStyle(color: Colors.greenAccent,))
                                  //Text('(Please fill the password field)'))
                              ));
                            },
                          )

                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      validateLowercase(_textPassword.text)
                      // validateStructure(_textField1.text)///
                      // _textField1.text.contains(RegExp(r'^(?=.*?[a-z])'))
                      // snapshot.data.toString().contains(RegExp(r'[a-z]'))
                      // snapshot.data.toString().contains(RegExp(r'^(?=.*?[a-z])'))
                          ? _elemenCheck('Lower') : _elemenText('a', 'Lowercase'),
                      validateUppercase(_textPassword.text)
                          ? _elemenCheck('Upper') : _elemenText('A', 'Uppercase'),
                      validateNumber(_textPassword.text)
                          ? _elemenCheck('Numbers') : _elemenText('123', 'Numbers'),
                      validateCharacters(_textPassword.text)
                          ? _elemenCheck('Characters') : _elemenText('9+', 'Characters'),
                    ],
                  ),
                ),
                /// Button Next
                SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width-20,
                  child: Stack(
                    alignment: Alignment.center,
                    fit: StackFit.loose,
                    children: [
                      Positioned(
                        width: MediaQuery.of(context).size.width,
                        bottom: 10,
                        child: Container(
                          height: 50,
                          // padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                          child: ElevatedButton(
                            onPressed: () {
                              if (validateLowercase(_textPassword.text) &
                              validateUppercase(_textPassword.text) &
                              validateNumber(_textPassword.text) &
                              validateCharacters(_textPassword.text)) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Screen3()),
                                );
                              } else {
                                log('error');
                              }
                            },
                            child: Text(next),
                          ),
                        ),
                      )
                    ],
                  ),
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

  bool validateCharactersVeryStrong(String value) {
    return (value.length > 10) ? true : false;
  }

  bool isVeryStrongPassword(String value){
    return (
        validateNumber(value) &
        validateUppercase(value) &
        validateLowercase(value) &
        (value.length > 11)
    ) ? true : false;
  }

  bool isStrongPassword(String value){
    return (
        validateNumber(value) &
        validateUppercase(value) &
        validateLowercase(value) &
        (value.length > 10)
    ) ? true : false;
  }

  bool isWeakPassword(String value){
    return (
        validateNumber(value) &
        validateUppercase(value) &
        validateLowercase(value) &
        (value.length > 9)
    ) ? true : false;
  }

  bool isVeryWeakPassword(String value){
    return (
        validateCharacters(value) &
        validateNumber(value) &
        validateUppercase(value) &
        validateLowercase(value)
    ) ? true : false;
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
