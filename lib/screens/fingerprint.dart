// ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps, avoid_unnecessary_containers, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_biometric_auth/screens/home.dart';
import 'package:local_auth/local_auth.dart';

import '../controller/local_auth_api.dart';

class FingerPrint_Screen extends StatefulWidget {
  @override
  State<FingerPrint_Screen> createState() => _FingerPrint_ScreenState();
}

class _FingerPrint_ScreenState extends State<FingerPrint_Screen> {
  authentication() async {
    final isAuthenticated = await LocalAuthApi.authenticate();

    if (isAuthenticated) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Home_Screen()),
          (route) => false);
    }
  }

  late bool isAvailable;
  late bool hasFingerPrint;
  availibility() async {
    isAvailable = await LocalAuthApi.canCheckBiometrics();
    final biometrics = await LocalAuthApi.getBiometrics();

    hasFingerPrint = biometrics.contains(BiometricType.fingerprint);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue[700],
            title: Center(
              child: Text(
                "Fingerprint Auth",
              ),
            ),
          ),
          body: SafeArea(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blue[700],
                ),
                Positioned(
                  top: 40,
                  child: Center(
                    child: Container(
                      height: 700,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25))),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15, right: 8, left: 8),
                            child: Text(
                              "Let us know it's you by one click authentication",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              child: Lottie.asset(
                            "assets/fingerprint.json",
                            repeat: true,
                            height: 200,
                          )),
                          SizedBox(
                            height: 50,
                          ),
                          FutureBuilder(
                              future: availibility(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting)
                                  return Center(
                                      child: CircularProgressIndicator());

                                return Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Fingerprint Availability ",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500)),
                                        hasFingerPrint
                                            ? Icon(Icons.check,
                                                color: Colors.green, size: 28)
                                            : Icon(Icons.close,
                                                color: Colors.red, size: 28)
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    hasFingerPrint
                                        ? TextButton.icon(
                                            onPressed: authentication,
                                            icon: Icon(
                                              Icons.fingerprint,
                                              size: 30,
                                            ),
                                            label: Text(
                                              'Verify',
                                              style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          )
                                        : Text("")
                                  ],
                                );
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
