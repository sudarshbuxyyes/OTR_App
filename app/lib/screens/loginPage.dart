import 'package:app/screens/signin.dart';
import 'package:app/utils/Sizer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  static const logo = 'assets/images/otr_adventures.png';
  @override
  Widget build(BuildContext context) {
    Sizer.init(context);
    return Scaffold(
        body: SingleChildScrollView(
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
          height: Sizer.sbh * 40,
        ),
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SignIn();
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
              "Login",
              style: TextStyle(
                color: Colors.white,
                fontSize: Sizer.fss,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(
          height: Sizer.sbh * 10,
        ),
        Container(
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
      ]),
    ));
  }
}
