import 'dart:convert';
import 'dart:developer';

import 'package:app/models/CouponModel.dart';
import 'package:app/models/PartnerModel.dart';
import 'package:app/utils/constants.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<CouponModel>?> getAllActiveCoupons() async {
    try {
      var url = Uri.parse(ApiConstants.baseURL +
          ApiConstants.partnerEndpoint +
          '?status=Active');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<CouponModel> _model = (json.decode(response.body) as List)
            .map((i) => CouponModel.fromJson(i))
            .toList();
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<int> signUp(
      String username, String email, String contact, String password) async {
    final String signUpURL = ApiConstants.baseURL + '/signup';
    var url = Uri.parse(signUpURL);
    int result = -1;

    print(url);
    Map<String, dynamic> requestData = {
      'email': email,
      'contact_number': contact,
      'password': password,
      'name': username,
    };
    try {
      final response = await http.post(
          headers: {'Content-Type': 'application/json'},
          url,
          body: json.encode(requestData));

      //success condition
      if (response.statusCode == 201) {
        print('Signup successful');
        print(response.body);
        result = response.statusCode;
      }
      // error handling
      else {
        print('Signup failed with status code : ${response.statusCode}');
        print(response.body);
        result = response.statusCode;
      }
    } catch (e) {
      print("Error during signup : ");
      print(e);
    }
    return result;
  }

  Future<int> login(String email, String password) async {
    final String loginUrl = ApiConstants.baseURL + '/login';
    int result = -1;

    Map<String, dynamic> requestData = {
      'email': email,
      'password': password,
    };

    try {
      final response = await http.post(
        Uri.parse(loginUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(requestData),
      );

      if (response.statusCode == 200) {
        // Successful login
        print('Login successful');
        print(response.statusCode);
        print(response.body);
      } else {
        // Error handling
        print('Login failed with status code: ${response.statusCode}');
        print(response.body);
      }
      result = response.statusCode;
    } catch (e) {
      // Exception handling
      print('Error during login: $e');
    }
    return result;
  }

  Future<List<CouponModel>?> getActiveCoupons_Partner(String partnerID) async {
    try {
      var url = Uri.parse(ApiConstants.baseURL +
          ApiConstants.partnerEndpoint +
          '?id=' +
          partnerID +
          '&?status=Active');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<CouponModel> _model = (json.decode(response.body) as List)
            .map((i) => CouponModel.fromJson(i))
            .toList();
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<PartnerModel>?> getPartners() async {
    try {
      var url = Uri.parse(ApiConstants.baseURL + ApiConstants.partnerEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<PartnerModel> _model = (json.decode(response.body) as List)
            .map((i) => PartnerModel.fromJson(i))
            .toList();
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
