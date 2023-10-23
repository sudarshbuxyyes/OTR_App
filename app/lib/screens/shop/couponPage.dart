import 'dart:convert';

import 'package:app/models/CouponModel.dart';
import 'package:app/models/PartnerModel.dart';
import 'package:app/services/api_services.dart';
import 'package:app/services/userProvider.dart';
import 'package:app/utils/Sizer.dart';
import 'package:app/utils/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class CouponPage extends StatefulWidget {
  @override
  State<CouponPage> createState() => _CouponPageState();
}

class _CouponPageState extends State<CouponPage> {
  late List<CouponModel>? _coupons = [];
  late List<PartnerModel>? _partners = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    getPartners(userProvider.user!.access_token);
    getActiveCoupons(userProvider.user!.access_token);
    // _getData();
    // _partners = ApiService().getPartners(userProvider.user!.access_token)
    //     as Future<List<PartnerModel>>;
    // print(_partners);
    // _coupons = ApiService().getActiveCoupons(userProvider.user!.access_token)
    //     as Future<List<CouponModel>>;
  }

  Future<void> getPartners(String access_token) async {
    try {
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
        setState(() {
          _partners = _model;
        });
      } else {
        throw Exception("Error in loading partners");
      }
    } catch (e) {
      throw (e);
    }
  }

  Future<void> getActiveCoupons(String access_token) async {
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
        setState(() {
          _coupons = _model;
        });
      } else {
        throw Exception("Error in loading coupons");
      }
    } catch (e) {
      throw (e);
    }
  }

  // void _getData() async {
  //   final userProvider = Provider.of<UserProvider>(context, listen: false);
  //   _partners = ApiService().getPartners(userProvider.user!.access_token)
  //       as List<PartnerModel>;
  //   print(_partners!.isEmpty);
  //   print("partners first : ${_partners![0]}");
  //   _coupons = ApiService().getActiveCoupons(userProvider.user!.access_token)
  //       as List<CouponModel>;
  //   Future.delayed(const Duration(seconds: 2)).then((value) => setState(() {}));
  // }
  // void _getData(String access_token) async {
  //   // _coupons = (await ApiService().getAllActiveCoupons())!;
  //   _coupons = ApiService().getActiveCoupons() as Future<List<CouponModel>>;
  //   print("coupons : ${_coupons.toString()}");
  //   // _partners = (await ApiService().getPartners(access_token))!;
  //   Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  // }

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
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              "Coupons",
              style: TextStyle(
                color: Colors.black,
                fontSize: Sizer.fsm * 0.9,
                letterSpacing: 1.0,
              ),
            ),
            backgroundColor: Colors.white,
            leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.chevron_left_rounded, color: Colors.black)),
          ),
          body: _partners == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                  children: [
                    SizedBox(
                      height: Sizer.sbv * 3,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: Sizer.sbv),
                      child: Container(
                        width: Sizer.screenWidth * 0.8,
                        child: Row(children: <Widget>[
                          Expanded(
                            child: new Container(
                                margin: const EdgeInsets.only(
                                    left: 10.0, right: 20.0),
                                child: Divider(
                                  color: Colors.grey[400],
                                  thickness: 1.0,
                                  height: 36,
                                )),
                          ),
                          Text(
                            "Our Partners",
                            style: TextStyle(
                                fontSize: Sizer.fss,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey[500],
                                letterSpacing: 2),
                          ),
                          Expanded(
                            child: new Container(
                                margin: const EdgeInsets.only(
                                    left: 20.0, right: 10.0),
                                child: Divider(
                                  color: Colors.grey[400],
                                  thickness: 1.0,
                                  height: 36,
                                )),
                          ),
                        ]),
                      ),
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: Sizer.sbv * 40,
                        autoPlay: true,
                        aspectRatio: 1.5,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                      items: _partners!.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Sizer.sbh * 2),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: Sizer.screenWidth,
                              height: Sizer.sbh * 25,
                              child: Text(
                                i.name,
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: Sizer.sbv),
                      child: Container(
                        width: Sizer.screenWidth * 0.8,
                        child: Row(children: <Widget>[
                          Expanded(
                            child: new Container(
                                margin: const EdgeInsets.only(
                                    left: 10.0, right: 20.0),
                                child: Divider(
                                  color: Colors.grey[400],
                                  thickness: 1.0,
                                  height: 36,
                                )),
                          ),
                          Text(
                            "Best Offers for you",
                            style: TextStyle(
                                fontSize: Sizer.fss,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey[500],
                                letterSpacing: 2),
                          ),
                          Expanded(
                            child: new Container(
                                margin: const EdgeInsets.only(
                                    left: 20.0, right: 10.0),
                                child: Divider(
                                  color: Colors.grey[400],
                                  thickness: 1.0,
                                  height: 36,
                                )),
                          ),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Sizer.sbh * 10, vertical: Sizer.sbv * 3),
                      child: CouponCard(
                        height: 300,
                        curvePosition: 180,
                        curveRadius: 30,
                        borderRadius: 10,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.purple,
                              Colors.purple.shade700,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        firstChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'CHIRISTMAS SALES',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '16%',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 56,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'OFF',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        secondChild: Container(
                          width: double.maxFinite,
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(color: Colors.white),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 24, horizontal: 42),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60),
                                ),
                              ),
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                const EdgeInsets.symmetric(horizontal: 80),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.white,
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'REDEEM',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: Sizer.sbv),
                      child: Container(
                        width: Sizer.screenWidth * 0.8,
                        child: Row(children: <Widget>[
                          Expanded(
                            child: new Container(
                                margin: const EdgeInsets.only(
                                    left: 10.0, right: 20.0),
                                child: Divider(
                                  color: Colors.grey[400],
                                  thickness: 1.0,
                                  height: 36,
                                )),
                          ),
                          Text(
                            "Other Coupons",
                            style: TextStyle(
                                fontSize: Sizer.fss,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey[500],
                                letterSpacing: 2),
                          ),
                          Expanded(
                            child: new Container(
                                margin: const EdgeInsets.only(
                                    left: 20.0, right: 10.0),
                                child: Divider(
                                  color: Colors.grey[400],
                                  thickness: 1.0,
                                  height: 36,
                                )),
                          ),
                        ]),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: _coupons!.length,
                      itemBuilder: (context, index) {
                        final coupon = _coupons![index];
                        return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: Sizer.sbv * 2,
                                horizontal: Sizer.sbh * 2),
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[50]),
                                child: ListTile(
                                  title: Text(coupon.coupon_code_premium!),
                                  subtitle: Text(
                                      'Discount: ${coupon.discount_percentage_premium}%'),
                                )));
                      },
                    ),
                  ],
                )),
        ));
  }
}
