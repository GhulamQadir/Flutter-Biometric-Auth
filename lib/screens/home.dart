// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_const_constructors
import 'package:lottie/lottie.dart';
import 'dart:async';

import 'package:flutter/material.dart';

class Home_Screen extends StatefulWidget {
  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                  child: Lottie.asset("assets/verif_comp.json", repeat: false)),
            ),
            Center(
              child: Text(
                "Verify Successfully",
                style: TextStyle(fontSize: 20, color: Colors.blue[700]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
