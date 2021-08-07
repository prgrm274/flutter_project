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
                /*ElevatedButton(
                  onPressed: () {
                    log('pressed');
                  },
                  child: Text(next),
                )*/
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

  bool validateStructure(String value) {
    String patternUpperCaseCharacters = r'^(?=.*?[A-Z])';
    String patternLowerCaseCharacters = r'^(?=.*?[a-z])';
    String patternNumbers = r'^(?=.*?[0-9])';
    String patternSpecialCharacters = r'^(?=.*?[!@#\$&*~£])';

    RegExp regEx1 = new RegExp(patternLowerCaseCharacters);
    RegExp regEx2 = new RegExp(patternUpperCaseCharacters);
    RegExp regEx3 = new RegExp(patternNumbers);
    RegExp regEx4 = new RegExp(patternSpecialCharacters);
    if (regEx1.hasMatch(value) | regEx2.hasMatch(value) | regEx3.hasMatch(value) |
    regEx4.hasMatch(value)) {
      return true;
    }/* else if (regEx2.hasMatch(value)) {
      return true;
    } else if (regEx3.hasMatch(value)) {
      return true;
    } else if (regEx4.hasMatch(value)) {
      return true;
    }*/
    return false;
  }

  String validateStructureStr(String value) {
    String patternUpperCaseCharacters = r'^(?=.*?[A-Z])';
    String patternLowerCaseCharacters = r'^(?=.*?[a-z])';
    String patternNumbers = r'^(?=.*?[0-9])';
    String patternSpecialCharacters = r'^(?=.*?[!@#\$&*~£])';

    RegExp regEx = new RegExp(patternUpperCaseCharacters);
    if (regEx.hasMatch(value)) {
      regEx = new RegExp(patternLowerCaseCharacters);
      if (regEx.hasMatch(value)) {
        return "More errors";
      } else {
        return "You need at least one lowercase letter";
      }
    } else {
      return "You need at least one capital letter";
    }
  }

  void _validateInputs() {
    if (_formKey.currentState!.validate()) {
      //    If all data are correct then save data to out variables
      _formKey.currentState!.save();
    } else {
      //    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }

  String? validateLowercaseStr(String? value){
    if (RegExp(r'[a-z]').hasMatch(value!)) {
      _containsLowercase = true;
      return '';
    } else return null;
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

  Widget _elemenKolom(bool isCorrect, String teks, String casename) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isCorrect
            ? Icon(Icons.check)
            : _textJenisPassword(isCorrect, teks),
        _textJenisPassword2(casename),
      ],
    );
  }

  Widget _textJenisPassword(bool isCorrect, String teks){
    return Text(
      isCorrect ? '' : teks,
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
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
