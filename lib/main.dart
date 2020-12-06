import 'package:flutter/material.dart';
import 'package:mks_racing/screens/loginScreen.dart';

main() => runApp(MyApp());

double devHeight;
double devWidth;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
