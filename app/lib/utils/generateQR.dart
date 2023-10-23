import 'dart:convert';

import 'package:app/services/userProvider.dart';
import 'package:app/utils/Sizer.dart';
import 'package:app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class GenerateQR extends StatefulWidget {
  const GenerateQR({Key? key}) : super(key: key);

  @override
  State<GenerateQR> createState() => _GenerateQRState();
}

class _GenerateQRState extends State<GenerateQR> {
  late String access_token = "";
  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    access_token = userProvider.user!.access_token;
  }

  Future<void> generateCafeQR(String access_token) async {
    final String loginUrl = ApiConstants.baseURL + '/cafeqr';
    String result = "";

    Map<String, dynamic> requestData = {'scanner-type': "Cafe"};

    try {
      final response = await http.put(
        Uri.parse(loginUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${access_token}'
        },
        body: json.encode(requestData),
      );

      if (response.statusCode == 200) {
        // Successful login
        print('QR Code generated');
        print(response.statusCode);
        print(response.body.toString());
        result = response.body.toString();
      } else {
        // Error handling
        print('Login failed with status code: ${response.statusCode}');
        print(response.body);
      }
    } catch (e) {
      // Exception handling
      print('Error during login: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Sizer.sbh * 10, vertical: Sizer.sbh * 10),
              child: Center(
                child: InkWell(
                  onTap: () async {
                    generateCafeQR(access_token);
                  },
                  child: Container(
                    width: Sizer.sbh * 40,
                    height: Sizer.sbh * 9,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.black,
                    ),
                    child: Text(
                      "Generate QR Code",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Sizer.fss,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
