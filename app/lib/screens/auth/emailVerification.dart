import 'package:app/utils/Sizer.dart';
import 'package:flutter/material.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({Key? key}) : super(key: key);

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  static const logo = 'assets/images/otr_adventures.png';

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
          appBar: AppBar(
            leading: Icon(
              Icons.chevron_left_rounded,
              color: Colors.black,
            ),
            backgroundColor: Colors.orangeAccent,
            elevation: 0,
          ),
          body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Positioned(
                      top: 0,
                      right: Sizer.screenWidth / 2,
                      child: Stack(children: [
                        Container(
                            height: Sizer.sbv * 35,
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
                          height: Sizer.sbv * 30,
                          child: Image(
                            image: AssetImage(logo),
                          ),
                        ),
                      ])),
                  SizedBox(
                    height: Sizer.sbv * 10,
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        textAlign: TextAlign.center,
                        "Please verify your Email ID by clicking on the verification link sent to your registered email address",
                        style: TextStyle(
                            fontSize: Sizer.fsm,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      )),
                  SizedBox(
                    height: Sizer.sbv * 5,
                  ),
                  Container(
                      width: Sizer.screenWidth * 0.55,
                      height: Sizer.sbv * 5,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.black),
                      child: Text(
                        "Resend Link",
                        style: TextStyle(color: Colors.white),
                      )),
                  SizedBox(
                    height: Sizer.sbv * 20,
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
                ],
              )),
        ));
  }
}
