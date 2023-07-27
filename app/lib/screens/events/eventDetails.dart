import 'package:app/models/Event.dart';
import 'package:app/utils/MyCustomPainter.dart';
import 'package:app/utils/Sizer.dart';
import 'package:app/widgets/EventAttended.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class EventDetailPage extends StatefulWidget {
  const EventDetailPage({Key? key, required Event this.event})
      : super(key: key);
  @override
  State<EventDetailPage> createState() => _EventDetailPageState();

  final Event event;
}

class _EventDetailPageState extends State<EventDetailPage> {
  int currentIndex = 0;
  final items = [
    'assets/images/off_roading.jpeg',
    'assets/images/otr_adventures.png',
    'assets/images/otr.jpeg'
  ];
  @override
  Widget build(BuildContext context) {
    String? scanresult; //varaible for scan result text

    @override
    void initState() {
      scanresult = "none"; //innical value of scan result is "none"
      super.initState();
    }

    Sizer.init(context);
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: Sizer.sbv * 40,
                  autoPlay: true,
                  aspectRatio: 1.5,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
                items: items.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: Sizer.sbh * 2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                                image: AssetImage(i), fit: BoxFit.cover)),
                        width: Sizer.screenWidth,
                      );
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
              Container(
                  padding: EdgeInsets.symmetric(horizontal: Sizer.sbh * 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    textAlign: TextAlign.left,
                    "EventName",
                    style: TextStyle(
                        fontSize: Sizer.sbv * 3,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
              SizedBox(height: Sizer.sbv * 2),
              Container(
                  width: Sizer.screenWidth * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[300],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(Sizer.sbv),
                            child: Text(
                              "EventLocation",
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(Sizer.sbv),
                            child: Text(
                              "EventDate",
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(Sizer.sbv),
                            child: Text(
                              'Distance : 123 km',
                              textAlign: TextAlign.left,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(Sizer.sbh),
                            child: Container(
                              child: Icon(Icons.location_on_outlined,
                                  color: Colors.grey[500]),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(Sizer.sbh),
                            child: InkWell(
                              onTap: () {},
                              child: Text(
                                "View Route",
                                style: TextStyle(
                                    fontSize: Sizer.fss,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
              SizedBox(height: Sizer.sbv * 2),
              Container(
                alignment: Alignment.center,
                width: Sizer.screenWidth * 0.8,
                height: Sizer.sbv * 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[200],
                ),
                child: Padding(
                  padding: EdgeInsets.all(Sizer.sbv),
                  child: Text(
                    "EventDescription",
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              SizedBox(height: Sizer.sbv * 2),
              EventAttendedCard(
                Attended: true,
                ongoing: true,
                Event_type: "Event",
                registered: true,
              ),
              SizedBox(height: Sizer.sbv * 2),
              InkWell(
                  onTap: () {
                    showModalBottomSheet<dynamic>(
                        isScrollControlled: true,
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (BuildContext bc) {
                          return Wrap(children: <Widget>[
                            Container(
                              width: Sizer.screenWidth,
                              decoration: new BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: new BorderRadius.only(
                                      topLeft: const Radius.circular(25.0),
                                      topRight: const Radius.circular(25.0))),
                              child: Container(
                                height: Sizer.screenHeight * 0.9,
                                decoration: new BoxDecoration(
                                    borderRadius: new BorderRadius.only(
                                        topLeft: const Radius.circular(25.0),
                                        topRight: const Radius.circular(25.0))),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.all(Sizer.sbh * 5),
                                          child: InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Icon(
                                                Icons.close_rounded,
                                                color: Colors.black54,
                                                size: Sizer.fss * 1.5,
                                              )),
                                        )
                                      ],
                                    ),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: Sizer.sbv * 2,
                                          horizontal: Sizer.sbh * 5,
                                        ),
                                        child: Container(
                                          child: Text(
                                            "Scan the Event QR to Participate",
                                            style: TextStyle(
                                                fontSize: Sizer.fssm,
                                                fontWeight: FontWeight.bold,
                                                wordSpacing: 1.0),
                                          ),
                                        )),
                                    SizedBox(
                                      height: Sizer.screenHeight * 0.5,
                                      width: Sizer.screenWidth * 0.7,
                                      child: CustomPaint(
                                        painter: MyCustomPainter(
                                            frameSFactor: .1, padding: 20),
                                        child: Center(
                                          child: Text(
                                            'With Painter',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: Sizer.sbv * 2,
                                        ),
                                        child: CircleAvatar(
                                          backgroundColor: Colors.amber[100],
                                          radius: Sizer.fss,
                                          child: Icon(
                                            Icons.flashlight_on,
                                            size: Sizer.fss,
                                            color: Colors.amberAccent[700],
                                          ),
                                        )),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: Sizer.sbv),
                                      child: Container(
                                          width: Sizer.screenWidth * 0.55,
                                          height: Sizer.sbv * 5,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5)),
                                              color: Colors.black),
                                          child: Text(
                                            "Scan QR Code",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ]);
                        });
                  },
                  child: InkWell(
                    onTap: () async {
                      scanresult = await scanner.scan();
                      //code to open camera and start scanning,
                      //the scan result is stored to "scanresult" varaible.
                      setState(() {
                        //refresh UI to show the result on app
                      });
                    },
                    child: Container(
                        width: Sizer.screenWidth * 0.55,
                        height: Sizer.sbv * 5,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.black),
                        child: Text(
                          "Scan QR Code",
                          style: TextStyle(color: Colors.white),
                        )),
                  )),
              SizedBox(height: Sizer.sbv * 5),
            ])));
  }
}
