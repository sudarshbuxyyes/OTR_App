import 'package:app/utils/Sizer.dart';
import 'package:flutter/material.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({Key? key}) : super(key: key);

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
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
                    height: Sizer.sbh * 5,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "OTP sent to +91-XXXXXXXX-87",
                      style: TextStyle(
                          fontSize: Sizer.fsm, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: Sizer.sbh * 5,
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Container(
                              width: Sizer.screenWidth * 0.55,
                              height: Sizer.sbv * 9,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[300],
                              ),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: List.generate(
                                    4,
                                    (index) => SizedBox(
                                        height: Sizer.sbh * 10,
                                        width: Sizer.sbh * 9,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.white,
                                          ),
                                          child: TextField(
                                            textAlign: TextAlign.center,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                            ),
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6,
                                            keyboardType: TextInputType.number,
                                          ),
                                        )),
                                  ))),
                          SizedBox(
                            height: Sizer.sbh * 5,
                          ),
                          Container(
                              width: Sizer.screenWidth * 0.55,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "00:05",
                                    style: TextStyle(
                                        fontSize: Sizer.fss,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(166, 117, 117, 117),
                                        decoration: TextDecoration.underline),
                                  ),
                                  Text(
                                    "Resend OTP",
                                    style: TextStyle(
                                        fontSize: Sizer.fss,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(166, 117, 117, 117),
                                        decoration: TextDecoration.underline),
                                  ),
                                ],
                              )),
                        ],
                      )),
                  SizedBox(
                    height: Sizer.sbv * 5,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: Sizer.sbh * 55,
                      height: Sizer.sbh * 10,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black,
                      ),
                      child: Text(
                        "Verify",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Sizer.fss,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Sizer.sbv * 18,
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
