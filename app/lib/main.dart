import 'package:app/my_app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(home: MyApp()));
}
