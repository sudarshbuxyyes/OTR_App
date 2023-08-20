import 'dart:convert';
import 'dart:developer';
import 'dart:isolate';
import 'package:app/models/Badge.dart';
import 'package:app/models/CouponModel.dart';
import 'package:app/models/OTREvent.dart';
import 'package:app/models/OTREventModel.dart';
import 'package:app/models/PartnerModel.dart';
import 'package:app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // Future<List<CouponModel>?> getAllActiveCoupons() async {
  //   try {
  //     var url = Uri.parse(ApiConstants.baseURL +
  //         ApiConstants.partnerEndpoint +
  //         '?status=Active');
  //     var response = await http.get(url);
  //     print(response.statusCode);

  //     if (response.statusCode == 200) {
  //       List<CouponModel> _model = (json.decode(response.body) as List)
  //           .map((i) => CouponModel.fromJson(i))
  //           .toList();
  //       return _model;
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }

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

  Future<String> login(String email, String password) async {
    final String loginUrl = ApiConstants.baseURL + '/login';
    String result = "";

    Map<String, dynamic> requestData = {
      'email': email,
      'password': password,
    };

    try {
      final response = await http.put(
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
    return result;
  }

  Future<List<CouponModel>> getActiveCoupons(String access_token) async {
    try {
      print("Getting active coupons");
      var url = Uri.parse(ApiConstants.baseURL +
          ApiConstants.partnerEndpoint +
          '?status=Active');
      var response = await http
          .get(url, headers: {'Authorization': 'Bearer ${access_token}'});
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('coupons response : ${response.body.toString()}');
        List<CouponModel> _model = (json.decode(response.body) as List)
            .map((i) => CouponModel.fromJson(i))
            .toList();
        return _model;
      } else {
        throw Exception("Error in loading coupons");
      }
    } catch (e) {
      throw (e);
    }
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

  Future<List<PartnerModel>> getPartners(String access_token) async {
    try {
      print("Getting all partners");
      var url = Uri.parse(ApiConstants.baseURL + ApiConstants.partnerEndpoint);
      var response = await http
          .get(url, headers: {'Authorization': 'Bearer ${access_token}'});
      print(response.statusCode);
      if (response.statusCode == 200) {
        print("Getting all partners");
        print(response.body);
        List<PartnerModel> _model = (json.decode(response.body) as List)
            .map((i) => PartnerModel.fromJson(i))
            .toList();
        return _model;
      } else {
        throw Exception("Error in loading partners");
      }
    } catch (e) {
      throw (e);
    }
  }

  Future<List<Badge>> getBadges(String access_token) async {
    print("getting badges");
    var url = Uri.parse(ApiConstants.baseURL + ApiConstants.badgesEndpoint);
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer ${access_token}',
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      // print(response.body);
      // final jsonData = json.decode(response.body);
      String jsonResponse = '''[
      {
        "_id": "648c5bccbc2938a20717e7e5",
        "name": "OTR-STREAK-10",
        "description": "This badge is assigned when user completes the streak of 10 OTR's",
        "type": "Automated",
        "sub_type": "Streak-OTR",
        "createdAt": "2023-06-16T12:55:40.432Z",
        "updatedAt": "2023-06-16T12:55:40.432Z",
        "__v": 0
    },
    {
        "_id": "648c5c04bc2938a20717e7eb",
        "name": "OTR-STREAK-20",
        "description": "This badge is assigned when user completes the streak of 20 OTR's",
        "type": "Automated",
        "sub_type": "Streak-OTR",
        "createdAt": "2023-06-16T12:56:36.230Z",
        "updatedAt": "2023-06-16T12:58:04.946Z",
        "__v": 0
    },
    {
        "_id": "648c5c2fbc2938a20717e7ef",
        "name": "CAFE-STREAK-5",
        "description": "This badge is assigned when user completes the streak of 5 cafe's",
        "type": "Automated",
        "sub_type": "Streak-Cafe",
        "createdAt": "2023-06-16T12:57:19.013Z",
        "updatedAt": "2023-06-16T12:57:19.013Z",
        "__v": 0
    },
    {
        "_id": "648c5c4abc2938a20717e7f3",
        "name": "CAFE-STREAK-10",
        "description": "This badge is assigned when user completes the streak of 10 cafe's",
        "type": "Automated",
        "sub_type": "Streak-Cafe",
        "createdAt": "2023-06-16T12:57:46.586Z",
        "updatedAt": "2023-06-16T12:57:46.586Z",
        "__v": 0
    },
    {
        "_id": "648c5ca6bc2938a20717e7fd",
        "name": "LEVEL-1",
        "description": "This badge is assigned when user achieves some points.",
        "type": "Automated",
        "sub_type": "Level",
        "createdAt": "2023-06-16T12:59:18.714Z",
        "updatedAt": "2023-06-16T12:59:18.714Z",
        "__v": 0
    },
    {
        "_id": "648c5cbcbc2938a20717e802",
        "name": "LEVEL-2",
        "description": "This badge is assigned when user achieves some points.",
        "type": "Automated",
        "image_url": "",
        "sub_type": "Level",
        "createdAt": "2023-06-16T12:59:40.139Z",
        "updatedAt": "2023-06-16T12:59:40.139Z",
        "__v": 0
    },
    {
        "_id": "648c5cccbc2938a20717e806",
        "name": "LEVEL-3",
        "description": "This badge is assigned when user achieves some points.",
        "type": "Automated",
        "image_url": "",
        "sub_type": "Level",
        "createdAt": "2023-06-16T12:59:56.969Z",
        "updatedAt": "2023-06-16T12:59:56.969Z",
        "__v": 0
    },
    {
        "_id": "648c5d43bc2938a20717e80a",
        "name": "SPECIAL-EVENT-1",
        "description": "This badge is assigned when user attend's any special event",
        "type": "Automated",
        "image_url": "",
        "sub_type": "Event",
        "createdAt": "2023-06-16T13:01:55.932Z",
        "updatedAt": "2023-06-16T13:01:55.932Z",
        "__v": 0
    },
    {
        "_id": "648c5d79bc2938a20717e80e",
        "name": "SPECIAL-OTR-1",
        "description": "This badge is assigned when user attends any specific OTR.",
        "type": "Automated",
        "sub_type": "OTR",
        "createdAt": "2023-06-16T13:02:49.306Z",
        "updatedAt": "2023-06-16T13:02:49.306Z",
        "__v": 0
    },
    {
        "_id": "648c5dd7bc2938a20717e812",
        "name": "HOSTED-ORT's-5",
        "description": "This badge is assigned when moderator host any number of OTR's",
        "type": "Automated",
        "sub_type": "OTR",
        "createdAt": "2023-06-16T13:04:23.410Z",
        "updatedAt": "2023-06-16T13:04:23.410Z",
        "__v": 0
    },
    {
        "_id": "648c5decbc2938a20717e816",
        "name": "HOSTED-OTRs-10",
        "description": "This badge is assigned when moderator host any number of OTR's",
        "type": "Automated",
        "image_url": "",
        "sub_type": "OTR",
        "createdAt": "2023-06-16T13:04:44.203Z",
        "updatedAt": "2023-06-16T13:04:44.203Z",
        "__v": 0
    }]
    ''';

      List<dynamic> jsonList = json.decode(jsonResponse);
      return List<Badge>.from(
          jsonList.map((jsonData) => Badge.fromJson(jsonData)));
    } else {
      throw Exception("Failed to load badges");
    }
  }

  Future<void> getUserBadges(String userId, String access_token) async {
    print("Getting user badges");
    var url = Uri.parse(
        ApiConstants.baseURL + ApiConstants.badgesEndpoint + '/' + userId);
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer ${access_token}',
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print(jsonData);
    }
  }

  Future<List<OTREvent>> getOTREvents(String access_token) async {
    print("Getting all OTR Events");
    var url = Uri.parse(ApiConstants.baseURL + ApiConstants.otrEndpoint);
    var response = await http
        .get(url, headers: {'Authorization': 'Bearer ${access_token}'});

    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = json.decode(response.body)['data'];
      print(response.body.toString());
      // List<OTREvent> events = [];
      // final apiResponse = apiResponseFromJson(response.body.toString());
      // print(apiResponse);
      // print(transaction);
      return [];
    } else {
      throw Exception("Failed to fetch OTR Events");
    }
  }

  Future<void> getProducts(String access_token) async {
    print("Getting all products");
    var url = Uri.parse(
        ApiConstants.baseURL + ApiConstants.merchEndpoint + '/product');
  }

  Future<void> getAllEvents(String access_token) async {
    print("Getting all Events");
    var url = Uri.parse(ApiConstants.baseURL + ApiConstants.otrEndpoint);
    var response = await http
        .get(url, headers: {'Authorization': 'Bearer ${access_token}'});
    print(response.statusCode);
    if (response.statusCode == 201) {
      final jsonData = json.decode(response.body);
      print(jsonData);
    }
  }

  Future<void> createEvent(
      String event_name,
      List<String> locations,
      String event_start_date,
      String event_end_date,
      int participant_count,
      int max_participant,
      String mode,
      String event_chapter_id,
      double cost) async {
    print("Creating otr event");
    var url = Uri.parse(ApiConstants.baseURL + ApiConstants.eventEndpoint);
    Map<String, dynamic> requestData = {
      'event_name': event_name,
      'locations': locations,
      'event_start_date': event_start_date,
      'event_end_date': event_end_date,
      'participant_count': participant_count,
      'max_participant': max_participant,
      'mode': mode,
      'event_chapter_id': event_chapter_id,
      'cost': cost
    };
    try {
      final response = await http.post(
          headers: {'Content-Type': 'application/json'},
          url,
          body: json.encode(requestData));

      //success condition
      if (response.statusCode == 201) {
        print('Event Creation successful');
        print(response.body);
      }
      // error handling
      else {
        print(
            'Event Creation failed with status code : ${response.statusCode}');
        print(response.body);
      }
    } catch (e) {
      print("Error during creating event : ");
      print(e);
    }
  }

  Future<void> getEventWithId(String access_token, String eventId) async {
    print("Getting event with the ID");
    var url = Uri.parse(
        ApiConstants.baseURL + ApiConstants.eventEndpoint + '/' + eventId);
    var response = await http
        .get(url, headers: {'Authorization': 'Bearer ${access_token}'});
    print(response.statusCode);
    if (response.statusCode == 201) {
      final jsonData = json.decode(response.body);
      print(jsonData);
    }
  }

  Future<void> updateEventWithId(
      String access_token, String eventId, int cost) async {
    print("Updating event with Id");
    var url = Uri.parse(
        ApiConstants.baseURL + ApiConstants.otrEndpoint + '/' + eventId);
    Map<String, dynamic> requestData = {'cost': cost};
    try {
      final response = await http.post(
          headers: {'Content-Type': 'application/json'},
          url,
          body: json.encode(requestData));

      //success condition
      if (response.statusCode == 201) {
        print('Event Update successful');
        print(response.body);
      }
      // error handling
      else {
        print('Event Update failed with status code : ${response.statusCode}');
        print(response.body);
      }
    } catch (e) {
      print("Error during signup : ");
      print(e);
    }
  }

  Future<void> filterEvent(
      String chapter_id, String event_sd_get, String event_sd_lte) async {
    print("Filtering event");
    var url = Uri.parse(ApiConstants.baseURL +
        ApiConstants.eventEndpoint +
        '/filter?chapter_id=' +
        chapter_id +
        '&event_sd_gte=' +
        event_sd_get +
        '&event_sd_lte=' +
        event_sd_lte);
    var response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 201) {
      final jsonData = json.decode(response.body);
      print(jsonData);
    }
  }

  Future<void> deleteEvent(String event_id) async {
    print("Deleting event with event id");
    var url = Uri.parse(
        ApiConstants.baseURL + ApiConstants.eventEndpoint + '/' + event_id);
    final response = await http.delete(url);

    if (response.statusCode == 201) {
      // Successful response
      print('Data with ID $event_id deleted');
    } else {
      // Handle API error
      print('Request failed with status: ${response.statusCode}');
    }
  }

  Future<void> getChapter() async {
    var url = Uri.parse(ApiConstants.baseURL + ApiConstants.chapterEndpoint);
    var response = await http.get(url);
    if (response.statusCode == 201) {
      print(response.body);
    } else {
      print('Get Chapter failed with status : ${response.statusCode}');
    }
  }

  Future<void> createChapter(String chapter_name) async {
    var url = Uri.parse(ApiConstants.baseURL + ApiConstants.chapterEndpoint);
    Map<String, dynamic> requestData = {'chapter_name': chapter_name};
    try {
      final response = await http.post(
          headers: {'Content-Type': 'application/json'},
          url,
          body: json.encode(requestData));

      //success condition
      if (response.statusCode == 201) {
        print('Chapter Creation successful');
        print(response.body);
      }
      // error handling
      else {
        print(
            'Chapter Creation failed with status code : ${response.statusCode}');
        print(response.body);
      }
    } catch (e) {
      print("Error during Chapter Creation : ");
      print(e);
    }
  }

  //event Moderator Apis
  Future<void> updateEventDetails_Moderator(String event_id) async {
    var url = Uri.parse(
        ApiConstants.baseURL + ApiConstants.moderatorEndpoint + '/' + event_id);
    Map<String, dynamic> requestData = {
      'locations': [
        {'link': "${ApiConstants.baseURL}/otr-moderator/${event_id}"}
      ]
    };
    try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(requestData),
      );

      if (response.statusCode == 200) {
        // Successful login
        print('Update Successful');
        print(response.statusCode);
        print(response.body.toString());
      } else {
        // Error handling
        print('Update failed with status code: ${response.statusCode}');
        print(response.body);
      }
    } catch (e) {
      // Exception handling
      print('Error during Update: $e');
    }
  }

  Future<void> markAttendance_Moderator(
      bool unmark_attendance, String event_id, String user_id) async {
    var url = Uri.parse(ApiConstants.baseURL +
        ApiConstants.moderatorEndpoint +
        '/attendance/' +
        event_id +
        '/' +
        user_id);
    Map<String, dynamic> requestData = {'unmark-attendance': unmark_attendance};
    try {
      final response = await http.put(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(requestData),
      );

      if (response.statusCode == 200) {
        // Successful login
        print('Attendance mark Successful');
        print(response.statusCode);
        print(response.body.toString());
      } else {
        // Error handling
        print(
            'Attendance mark failed with status code: ${response.statusCode}');
        print(response.body);
      }
    } catch (e) {
      // Exception handling
      print('Error during Update: $e');
    }
  }

  Future<void> markAttendanceBulk_Moderator(
    String event_id,
  ) async {
    //TODO : Implement function for Excel sheet reading
  }

  Future<void> getOTRUsers_Moderator(String event_id) async {
    var url = Uri.parse(
        ApiConstants.baseURL + ApiConstants.moderatorEndpoint + '/' + event_id);
    var response = await http.get(url);
    if (response.statusCode == 201) {
      print(response.body);
    } else {
      print('Get OTR users failed with status : ${response.statusCode}');
    }
  }

  Future<void> cafeCreateQR(String scanner_type) async {
    var url = Uri.parse(ApiConstants.baseURL + '/cafeqr');
    Map<String, dynamic> requestData = {'scanner_type': scanner_type};
    try {
      final response = await http.post(
          headers: {'Content-Type': 'application/json'},
          url,
          body: json.encode(requestData));

      //success condition
      if (response.statusCode == 201) {
        print('Cafe QR Creation successful');
        print(response.body);
      }
      // error handling
      else {
        print(
            'Cafe QR Creation failed with status code : ${response.statusCode}');
        print(response.body);
      }
    } catch (e) {
      print("Error during Cafe QR Creation : ");
      print(e);
    }
  }

  Future<void> cafeCreateVisit(
      String user_id, String cafe_id, String qr_id) async {
    var url = Uri.parse(ApiConstants.baseURL + '/cafe');
    Map<String, dynamic> requestData = {
      'user_id': user_id,
      'cafe_id': cafe_id,
      'qr_id': qr_id
    };
    try {
      final response = await http.post(
          headers: {'Content-Type': 'application/json'},
          url,
          body: json.encode(requestData));

      //success condition
      if (response.statusCode == 201) {
        print('Cafe QR Creation successful');
        print(response.body);
      }
      // error handling
      else {
        print(
            'Cafe QR Creation failed with status code : ${response.statusCode}');
        print(response.body);
      }
    } catch (e) {
      print("Error during Cafe QR Creation : ");
      print(e);
    }
  }

  Future<void> getValidityPlans(String access_token) async {
    print("Getting validity plans ");
    var url = Uri.parse(ApiConstants.baseURL + '/validity-plan');
    var response = await http
        .get(url, headers: {'Authorization': 'Bearer ${access_token}'});
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('Get Validity Plans failed with status : ${response.statusCode}');
    }
  }

  Future<void> getAllPoints(String userID, String access_token) async {
    print("Getting all points transaction");
    var url = Uri.parse(ApiConstants.baseURL + '/points-transaction/' + userID);
    var response = await http
        .get(url, headers: {'Authorization': 'Bearer ${access_token}'});
    // print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('Get Points failed with status : ${response.statusCode}');
    }
  }
}
