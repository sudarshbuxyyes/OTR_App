import 'dart:convert';

import 'package:app/screens/otr/otrHome.dart';
import 'package:app/screens/auth/signup.dart';
import 'package:app/screens/auth/verificationPage.dart';
import 'package:app/services/api_services.dart';
import 'package:app/services/userProvider.dart';
import 'package:app/utils/Sizer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _signInState();
}

class _signInState extends State<SignIn> {
  static const logo = 'assets/images/otr_adventures.png';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<bool> _handleLogin(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    bool login_response = false;
    try {
      login_response = await userProvider.login(
        emailController.text,
        passwordController.text,
      );

      // Navigate to the home screen or perform any other action after successful login
    } catch (e) {
      // Handle login failure, show error message, etc.
      print(e);
    }
    final user = userProvider.user;
    if (user != null) {
      print("not null");
      print(user.id);
      print(user.username);
      print(user.email);
      print(user.contact_number);
      print(user.password);
      print(user.access_token);
    }
    return login_response;
  }

  @override
  Widget build(BuildContext context) {
    Sizer.init(context);
    return Localizations(
        locale: Locale('en', 'US'),
        delegates: const <LocalizationsDelegate<dynamic>>[
          DefaultWidgetsLocalizations.delegate,
          DefaultMaterialLocalizations.delegate,
        ],
        child: Scaffold(
            body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            Positioned(
                top: 0,
                right: Sizer.screenWidth / 2,
                child: Stack(children: [
                  Container(
                      height: Sizer.sbv * 50,
                      width: Sizer.screenWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(175),
                          bottomRight: Radius.circular(175),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.orangeAccent,
                            Colors.orange,
                          ],
                        ),
                      )),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: Sizer.sbv * 40,
                    child: Image(
                      image: AssetImage(logo),
                    ),
                  ),
                ])),
            SizedBox(
              height: Sizer.sbh * 10,
            ),
            Container(
              width: Sizer.screenWidth * 0.7,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(243, 242, 242, 0.9),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: TextField(
                      obscureText: false,
                      textAlign: TextAlign.center,
                      controller: emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email ID',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: Sizer.fss,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Sizer.sbh * 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(243, 242, 242, 0.9),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: TextField(
                      obscureText: true,
                      textAlign: TextAlign.center,
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: Sizer.fss,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Sizer.sbh * 10,
            ),
            InkWell(
              onTap: () async {
                bool login_success = await _handleLogin(context);
                if (login_success) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return OTRHome();
                  }));
                }
                // if (responseCode == 200) {

                //   Navigator.push(context, MaterialPageRoute(builder: (context) {
                //     return OTRHome();
                //   }));
                // }
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return OTRHome();
                // }));
              },
              child: Container(
                width: Sizer.sbh * 40,
                height: Sizer.sbh * 8,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black,
                ),
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Sizer.fss,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Sizer.sbh * 5,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return VerificationPage();
                }));
              },
              child: Container(
                width: Sizer.screenWidth * 0.7,
                child: Text(
                  "Forgot Password?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: Sizer.fss,
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
            SizedBox(
              height: Sizer.sbh * 5,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignUp();
                }));
              },
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Don't have an account? Click here to register",
                  style: TextStyle(
                    color: Colors.blue[800],
                    fontSize: Sizer.fss,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Sizer.sbh * 10,
            ),
            Container(
              width: Sizer.screenWidth * 0.7,
              child: Text(
                "Privacy Policy",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: Sizer.fss,
                    decoration: TextDecoration.underline),
              ),
            ),
          ]),
        )));
  }
}
