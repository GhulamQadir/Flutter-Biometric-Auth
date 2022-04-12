import 'package:flutter/material.dart';
import 'package:flutter_biometric_auth/screens/fingerprint.dart';
import 'package:flutter_biometric_auth/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FingerPrint_Screen(),
        routes: {
          "/finger_print_screen": (context) => FingerPrint_Screen(),
          "/home_screen": (context) => Home_Screen(),
        });
  }
}
