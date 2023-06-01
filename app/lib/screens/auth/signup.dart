import 'package:app/utils/Sizer.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                      height: Sizer.sbv * 20,
                      child: Image(
                        image: AssetImage(logo),
                        alignment: Alignment.topCenter,
                      ),
                    )),
                SizedBox(height: Sizer.sbv * 5),
                Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Welcome to OTR Adventures",
                      style: TextStyle(
                        fontSize: Sizer.fsm,
                        fontWeight: FontWeight.normal,
                      ),
                    )),
              ])),
        ));
  }
}
