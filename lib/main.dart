// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:login/screens/login_page.dart';
import 'package:login/screens/signup_page.dart';
import 'package:sizer/sizer.dart';

void main() {
  //runApp(const MyApp());
  runApp(Sizer(
    builder: ((context, orientation, deviceType) {
      return MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: MyApp(),
      );
    }),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Assignment 02"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: const LoginPage(),
      ),
    );
  }
}
