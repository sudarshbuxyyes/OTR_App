import 'package:app/services/qrScanner.dart';
import 'package:app/utils/Sizer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class CafeHome extends StatefulWidget {
  const CafeHome({Key? key}) : super(key: key);

  @override
  State<CafeHome> createState() => _CafeHomeState();
}

class _CafeHomeState extends State<CafeHome> {
  final items = [
    'assets/images/off_roading.jpeg',
    'assets/images/otr_adventures.png',
    'assets/images/otr.jpeg'
  ];
  int currentIndex = 0;
  late String _scanBarcode;

  Future scanBarcodeNormal() async {
    String barcodeScanRes;

    barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Cancel", true, ScanMode.QR);
    print(barcodeScanRes);

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.2,
        title: const Text(
          "OTR Cafe",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromARGB(255, 215, 162, 3),
              letterSpacing: 0.5,
              wordSpacing: 1.2),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: Sizer.sbv * 2),
            CarouselSlider(
              options: CarouselOptions(
                height: Sizer.sbv * 40,
                autoPlay: true,
                aspectRatio: 1.5,
                enlargeCenterPage: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
              items: items.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Sizer.sbh * 2),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: Sizer.sbh * 2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(i), fit: BoxFit.cover)),
                          width: Sizer.screenWidth,
                        ));
                  },
                );
              }).toList(),
            ),
            DotsIndicator(
              dotsCount: items.length,
              position: currentIndex,
              decorator: DotsDecorator(
                activeColor: Colors.orange,
                color: Color.fromARGB(255, 212, 212, 212),
                size: Size.square(10.0),
                activeSize: Size(20.0, 10.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
            SizedBox(height: Sizer.sbv * 2),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: Sizer.sbh * 5),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10)),
                    width: Sizer.screenWidth,
                    height: Sizer.sbv * 10,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding: EdgeInsets.all(Sizer.sbh * 2),
                                child: Text("Open 9:00 AM to 5:00 PM")),
                            Padding(
                                padding: EdgeInsets.all(Sizer.sbh * 2),
                                child: Text("View Location")),

                            // Text("View Location")
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding: EdgeInsets.all(Sizer.sbh * 2),
                                child: Text("Closed on Mondays")),
                            Padding(
                                padding: EdgeInsets.all(Sizer.sbh * 2),
                                child: Text("Address line 1")),

                            // Text("View Location")
                          ],
                        )
                      ],
                    ))),
            SizedBox(height: Sizer.sbv * 2),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: Sizer.sbh * 5),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  width: Sizer.screenWidth,
                  height: Sizer.sbv * 20,
                )),
            SizedBox(height: Sizer.sbv * 2),
            InkWell(
              onTap: () {
                Fluttertoast.showToast(msg: "Opening QR Scanner");
                scanBarcodeNormal();
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
                  "Create Cafe Visit",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Sizer.fss,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
