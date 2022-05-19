import 'package:flutter/material.dart';

class PasswordStrength with ChangeNotifier {
  double? level = 0;
  Color? ccolor = Color.fromARGB(255, 187, 179, 179);
  String? message = "Strength!";
  bool? showPassword = false;
  void checkStrength(String value) {
    late String _password;
    RegExp numReg = RegExp(r".*[0-9].*");
    RegExp spcReg = RegExp(r".*[!@#\$&*~].*");
    RegExp letterReg = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])$');
    _password = value.trim();
    if (_password.isEmpty) {
      level = 0;
      message = "Strength!";
      ccolor = Color.fromARGB(255, 187, 179, 179);
      notifyListeners();
    } else if (_password.length < 6) {
      level = 0.20;
      message = "Too Short";
      ccolor = Color.fromARGB(255, 236, 8, 8);
      notifyListeners();
    } else if (_password.length < 8) {
      level = 0.40;
      message = 'Weak';
      ccolor = Colors.yellow;
      notifyListeners();
    } else {
      if (spcReg.hasMatch(_password) && numReg.hasMatch(_password) ||
          letterReg.hasMatch((_password))) {
        level = 1;
        message = 'Strong';
        ccolor = Colors.green;
        notifyListeners();
      } else {
        level = 0.60;
        message = 'Acceptable';
        ccolor = Colors.blue;
        notifyListeners();
      }
    }
  }

  void sPass(bool sp) {
    if (showPassword == true) {
      showPassword = false;
    } else {
      showPassword = true;
    }
  }
}
