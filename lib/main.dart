import 'package:flutter/material.dart';
import 'package:crud_app/Dashboard.dart';
import 'package:crud_app/utils/themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: defaultTheme,
      home: Dashboard(),
    );
  }
}
