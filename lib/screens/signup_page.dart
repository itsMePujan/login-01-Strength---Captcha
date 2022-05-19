// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/providers/password_strength_provider.dart';
import 'package:login/screens/login_page.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign-Up'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: ChangeNotifierProvider<PasswordStrength>(
          create: (context) => PasswordStrength(),
          child: Consumer<PasswordStrength>(
            builder: (context, value, child) {
              //  print(value.level);
              // print(value.ccolor);
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        bottom: 20, left: 10, right: 40, top: 20),
                    height: 14.h,
                    width: 50.h,
                    child: Text(
                      'Enter Your \nDetails And Start Journey With Us',
                      style: GoogleFonts.acme(
                        fontSize: 23.sp,
                        color: Color.fromARGB(255, 214, 204, 204),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      //height: 50.h,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(97, 88, 85, 74),
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: Color.fromARGB(255, 73, 66, 66)),
                      ),
                      width: 95.w,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                            height: 11.h,
                            width: 90.w,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: 'UserName',
                                prefixIcon: Icon(Icons.person),
                              ),
                            ),
                          ),
                          Container(
                            height: 10.h,
                            width: 90.w,
                            child: TextField(
                              onChanged: (val) => value.checkStrength(val),
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                hintText: 'Password',
                                prefixIcon: Icon(Icons.lock),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Container(
                                  width: 60.w,
                                  child: LinearProgressIndicator(
                                    value: value.level,
                                    color: value.ccolor,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(value.message.toString())
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 200,
                            color: Colors.red,
                            child: WebViewPlus(
                              javascriptMode: JavascriptMode.unrestricted,
                              onWebViewCreated: (controller) {
                                controller
                                    .loadUrl("assets/webpages/index.html");
                              },
                              javascriptChannels: Set.from([
                                JavascriptChannel(
                                    name: 'Captcha',
                                    onMessageReceived:
                                        (JavascriptMessage message) {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage()));
                                    })
                              ]),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 7.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 46, 43, 43),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 241, 241, 241),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 105, 103, 95),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        )),
      ),
    );
  }
}
