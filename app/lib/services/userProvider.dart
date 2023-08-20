import 'dart:convert';
import 'package:app/models/User.dart';
import 'package:app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;

  Future<bool> login(String email, String password) async {
    bool result = false;
    final String loginUrl = ApiConstants.baseURL + '/login';

    final response = await http.put(
      Uri.parse(loginUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print("json Data :${jsonData['user']}");
      _user = User.fromJson(jsonData['user']);
      print(_user!.id);
      notifyListeners();
      print("user created");
      if (_user != null) {
        result = true;
      }
      // Notify listeners that the user has changed
    } else {
      // Handle login failure here, show error message, etc.
      throw Exception('Login failed');
    }
    return result;
  }
}
