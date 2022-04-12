// ignore_for_file: deprecated_member_use

import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';

class LocalAuthApi {
  static final _auth = LocalAuthentication();

  static Future<bool> canCheckBiometrics() async {
    return await _auth.canCheckBiometrics;
  }

  static Future<List<BiometricType>> getBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } catch (e) {
      return <BiometricType>[];
    }
  }

  static Future<bool> authenticate() async {
    final isAvailable = await _auth.canCheckBiometrics;
    if (!isAvailable) return false;

    try {
      return await _auth.authenticateWithBiometrics(
          localizedReason: "Scan fingerprint to authenticate",
          useErrorDialogs: true,
          stickyAuth: true);
    } catch (e) {
      return false;
    }
  }
}
