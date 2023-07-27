import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/screens/auth/loginPage.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: LogIn(),
    );
  }
}
