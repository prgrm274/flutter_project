import 'package:flutter/material.dart';
import 'dart:async';

class EmailPassword extends StatefulWidget {
  @override
  _EmailPasswordState createState() => _EmailPasswordState();
}

class _EmailPasswordState extends State<EmailPassword> {
  FocusNode nameFocus = new FocusNode();
  FocusNode passwordFocus = new FocusNode();

  late StreamController<String> nameStreamController;
  late StreamController<String> passwordStreamController;

  TextEditingController nameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    nameStreamController = StreamController<String>.broadcast();
    passwordStreamController = StreamController<String>.broadcast();

    nameController.addListener(() {
      nameStreamController.sink.add(nameController.text.trim());
    });
    passwordController.addListener(() {
      passwordStreamController.sink.add(passwordController.text.trim());
    });
  }

  @override
  void dispose() {
    super.dispose();
    nameStreamController.close();
    passwordStreamController.close();
  }

  Color getColor(String text, FocusNode focus) {
    if (focus.hasFocus && text == null) {
      return Color.fromRGBO(161, 161, 161, 1.0);
    }
    if (focus.hasFocus && text.isEmpty) {
      return Colors.redAccent;
    } else if (focus.hasFocus && text.isNotEmpty) {
      return Colors.blueAccent;
    } else {
      return Color.fromRGBO(161, 161, 161, 1.0);
    }
  }

  String errorMessage(String text, String message) {
    /// Email validation
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(text);

    if (text == null) {
      return '';

    } else if (text.isEmpty) {
      return message;

    } else if (emailValid){
      return 'VALID';

    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Streams"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            StreamBuilder(
                stream: nameStreamController.stream,
                builder: (context, snapshot) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(2),
                          border: new Border.all(
                            color: getColor(snapshot.data.toString(), nameFocus),
                            width: 1.0,
                          ),
                        ),
                        child: TextFormField(
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.emailAddress,/// Input type
                          controller: nameController,
                          focusNode: nameFocus,
                          cursorColor: Colors.blueGrey,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "Enter Name",
                            labelStyle: TextStyle(
                              color: getColor(snapshot.data.toString(), nameFocus),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          errorMessage(snapshot.data.toString(), "Name is required"),
                          style: TextStyle(color: Colors.redAccent),
                        ),
                      )
                    ],
                  );
                }),
            SizedBox(
              height: 20,
            ),
            StreamBuilder(
                stream: passwordStreamController.stream,
                builder: (context, snapshot) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(2),
                          border: new Border.all(
                            color: getColor(snapshot.data.toString(), passwordFocus),
                            width: 1.0,
                          ),
                        ),
                        child: TextFormField(
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.number,
                          controller: passwordController,
                          focusNode: passwordFocus,
                          cursorColor: Colors.blueGrey,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "Enter Password",
                            labelStyle: TextStyle(
                              color: getColor(snapshot.data.toString(), passwordFocus),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          errorMessage(snapshot.data.toString(), "Password is required"),
                          style: TextStyle(color: Colors.redAccent),
                        ),
                      )
                    ],
                  );
                }),
            Container(
              alignment: Alignment.center,
              child: RaisedButton(
                color: Colors.blueAccent,
                onPressed: () {
                  if (nameController.text.trim().isEmpty)
                    nameStreamController.sink.add(nameController.text.trim());
                  if (passwordController.text.trim().isEmpty)
                    passwordStreamController.sink
                        .add(passwordController.text.trim());
                  else
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new Text('')));
                },
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}