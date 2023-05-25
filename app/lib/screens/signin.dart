import 'package:app/screens/otr/otrHome.dart';
import 'package:app/screens/signup.dart';
import 'package:app/screens/verificationPage.dart';
import 'package:flutter/material.dart';
import '../utils/Sizer.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _signInState();
}

class _signInState extends State<SignIn> {
  static const logo = 'assets/images/otr_adventures.png';
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return OTRHome();
                }));
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
