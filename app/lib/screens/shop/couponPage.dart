import 'package:app/utils/Sizer.dart';
import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/material.dart';

class CouponPage extends StatefulWidget {
  @override
  State<CouponPage> createState() => _CouponPageState();
}

class _CouponPageState extends State<CouponPage> {
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
            children: [],
          )),
        ));
  }
}
