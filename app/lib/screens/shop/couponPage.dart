import 'package:app/models/CouponModel.dart';
import 'package:app/models/PartnerModel.dart';
import 'package:app/services/api_services.dart';
import 'package:app/services/userProvider.dart';
import 'package:app/utils/Sizer.dart';
import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CouponPage extends StatefulWidget {
  @override
  State<CouponPage> createState() => _CouponPageState();
}

class _CouponPageState extends State<CouponPage> {
  late Future<List<CouponModel>> _coupons;
  late Future<List<PartnerModel>> _partners;
  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    _partners = ApiService().getPartners(userProvider.user!.access_token)
        as Future<List<PartnerModel>>;
    print(_partners);
    _coupons = ApiService().getActiveCoupons(userProvider.user!.access_token)
        as Future<List<CouponModel>>;


  }

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
          body: SingleChildScrollView(
              child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: Sizer.sbv),
                child: Container(
                  width: Sizer.screenWidth * 0.8,
                  child: Row(children: <Widget>[
                    Expanded(
                      child: new Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 20.0),
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
                          margin:
                              const EdgeInsets.only(left: 20.0, right: 10.0),
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60),
                          ),
                        ),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
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
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 20.0),
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
                          margin:
                              const EdgeInsets.only(left: 20.0, right: 10.0),
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
                    height: Sizer.sbv * 15,
                    backgroundColor: Colors.transparent,
                    clockwise: true,
                    curvePosition: 135,
                    curveRadius: 30,
                    curveAxis: Axis.vertical,
                    borderRadius: 10,
                    firstChild: Container(
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '10 %',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'OFF',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Divider(color: Colors.white54, height: 0),
                          Expanded(
                            child: Center(
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: Sizer.sbh),
                                child: Text(
                                  'CITIZENHR PARTNER CODE',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    secondChild: Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.all(18),
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Coupon Code',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'EARLYBIRD',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Sizer.sbh * 10, vertical: Sizer.sbv * 3),
                  child: CouponCard(
                    height: Sizer.sbv * 15,
                    backgroundColor: Colors.transparent,
                    clockwise: true,
                    curvePosition: 135,
                    curveRadius: 30,
                    curveAxis: Axis.vertical,
                    borderRadius: 10,
                    firstChild: Container(
                      decoration: const BoxDecoration(
                        color: Colors.purpleAccent,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '5 %',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'OFF',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Divider(color: Colors.white54, height: 0),
                          Expanded(
                            child: Center(
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: Sizer.sbh),
                                child: Text(
                                  'ACIS BANK PARTNER CODE',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    secondChild: Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.all(18),
                      decoration: const BoxDecoration(
                        color: Colors.purple,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Coupon Code',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'ACSBNK',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  )),
            ],
          )),
        ));
  }
}
