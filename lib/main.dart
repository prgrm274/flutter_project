import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/presentation/my_app.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}