import 'package:app/screens/auth/emailVerification.dart';
import 'package:app/screens/auth/otpVerification.dart';
import 'package:app/utils/Sizer.dart';
import 'package:flutter/material.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
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
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.chevron_left_rounded,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              Positioned(
                  top: 0,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    height: Sizer.sbv * 30,
                    child: Image(
                      image: AssetImage('assets/images/otr_adventures.png'),
                      alignment: Alignment.topCenter,
                    ),
                  )),
              SizedBox(height: Sizer.sbv * 10),
              Container(
                alignment: Alignment.center,
                child: Text("Activate account with ",
                    style: TextStyle(
                        fontSize: Sizer.fssm,
                        fontWeight: FontWeight.normal,
                        color: Colors.black)),
              ),
              SizedBox(height: Sizer.sbv * 5),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const EmailVerification();
                  }));
                },
                child: Container(
                    alignment: Alignment.center,
                    height: Sizer.sbv * 6,
                    width: Sizer.screenWidth * 0.7,
                    child: Text("Email ID",
                        style: TextStyle(
                            fontSize: Sizer.fssm,
                            fontWeight: FontWeight.normal,
                            color: Colors.white)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black,
                    )),
              ),
              SizedBox(height: Sizer.sbv * 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Expanded(
                    child: Divider(
                      indent: 20.0,
                      endIndent: 10.0,
                      thickness: 2,
                      color: Color.fromRGBO(83, 82, 82, 0.621),
                    ),
                  ),
                  Text(
                    "or",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 10.0,
                      endIndent: 20.0,
                      thickness: 2,
                      color: Color.fromRGBO(83, 82, 82, 0.621),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Sizer.sbv * 5),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const OTPVerification();
                  }));
                },
                child: Container(
                    alignment: Alignment.center,
                    width: Sizer.screenWidth * 0.7,
                    height: Sizer.sbv * 6,
                    child: Text("Phone Number",
                        style: TextStyle(
                            fontSize: Sizer.fssm,
                            fontWeight: FontWeight.normal,
                            color: Colors.white)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black,
                    )),
              ),
              SizedBox(
                height: Sizer.sbv * 15,
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
          ),
        ));
  }
}
