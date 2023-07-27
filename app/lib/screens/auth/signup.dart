import 'package:app/services/api_services.dart';
import 'package:app/utils/Sizer.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  static const logo = 'assets/images/otr_adventures.png';
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController numberFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();
  TextEditingController firstNameFieldController = TextEditingController();
  TextEditingController lastNameFieldController = TextEditingController();

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
                          controller: emailFieldController,
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
                          controller: passwordFieldController,
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
                      SizedBox(
                        height: Sizer.sbh * 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(243, 242, 242, 0.9),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: TextField(
                          obscureText: false,
                          textAlign: TextAlign.center,
                          controller: firstNameFieldController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'First Name',
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
                          obscureText: false,
                          controller: lastNameFieldController,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Last Name',
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
                          obscureText: false,
                          controller: numberFieldController,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '+91-',
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
                  height: Sizer.sbh * 5,
                ),
                InkWell(
                  onTap: () async {
                    String username = firstNameFieldController.text +
                        ' ' +
                        lastNameFieldController.text;
                    int statusCode = await ApiService().signUp(
                        username,
                        emailFieldController.text,
                        numberFieldController.text,
                        passwordFieldController.text);

                    if (statusCode == 201) {
                      //signup successful
                      //clear all textfields.
                      firstNameFieldController.clear();
                      lastNameFieldController.clear();
                      numberFieldController.clear();
                      emailFieldController.clear();
                      passwordFieldController.clear();

                      //show successful signup toast
                      Fluttertoast.showToast(
                        msg: "Signed up successfully!",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.white70,
                        textColor: Colors.green[300],
                        fontSize: 16.0,
                      );
                    }
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
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Sizer.fss,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ])),
        ));
  }
}
