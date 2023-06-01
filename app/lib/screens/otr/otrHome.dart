import 'package:app/models/OTREvent.dart';
import 'package:app/screens/otr/otrEventPage.dart';
import 'package:app/screens/otr/otrHistoryPage.dart';
import 'package:app/utils/Sizer.dart';
import 'package:app/widgets/NavBar.dart';
import 'package:app/widgets/otrEventCard.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class OTRHome extends StatefulWidget {
  const OTRHome({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OTRHomeState();
}

class _OTRHomeState extends State<OTRHome> {
  //list of dummy images for OTR Home Carousel slider. //for front-end use//
  final items = [
    'assets/images/off_roading.jpeg',
    'assets/images/otr_adventures.png',
    'assets/images/otr.jpeg'
  ];
  //current Active OTR Event
  final OTREvent current_otr = OTREvent(
      EventID: 0,
      EventName: "OTR 1",
      EventDescription: "Description for OTR 1",
      EventDate: DateTime.now(),
      EventLocation: "Location for OTR 1",
      Event_attended: false,
      EventDistance: 123);
  //list of otrs attended by the user. //for front-end use//
  final attended_otrs = [
    OTREvent(
        EventID: 2,
        EventName: "OTR 2",
        EventDescription: "Description for OTR 2",
        EventDate: DateTime.now(),
        EventLocation: "Location for OTR 2",
        Event_attended: true,
        EventDistance: 123),
    OTREvent(
        EventID: 3,
        EventName: "OTR 3",
        EventDescription: "Description for OTR 3",
        EventDate: DateTime.now(),
        EventLocation: "Location for OTR 3",
        Event_attended: true,
        EventDistance: 123)
  ];

  //list of past otr events //for front-end use//
  final past_otrs = [
    OTREvent(
        EventID: 1,
        EventName: "OTR 1",
        EventDescription: "Description for OTR 1",
        EventDate: DateTime.now(),
        EventLocation: "Location for OTR 1",
        Event_attended: false,
        EventDistance: 123),
    OTREvent(
        EventID: 2,
        EventName: "OTR 2",
        EventDescription: "Description for OTR 2",
        EventDate: DateTime.now(),
        EventLocation: "Location for OTR 2",
        Event_attended: true,
        EventDistance: 123),
    OTREvent(
        EventID: 3,
        EventName: "OTR 3",
        EventDescription: "Description for OTR 3",
        EventDate: DateTime.now(),
        EventLocation: "Location for OTR 3",
        Event_attended: true,
        EventDistance: 123),
    OTREvent(
        EventID: 4,
        EventName: "OTR 4",
        EventDescription: "Description for OTR 4",
        EventDate: DateTime.now(),
        EventLocation: "Location for OTR 4",
        Event_attended: false,
        EventDistance: 123),
    OTREvent(
        EventID: 5,
        EventName: "OTR 5",
        EventDescription: "Description for OTR 5",
        EventDate: DateTime.now(),
        EventLocation: "Location for OTR 5",
        Event_attended: false,
        EventDistance: 123),
    OTREvent(
        EventID: 6,
        EventName: "OTR 6",
        EventDescription: "Description for OTR 6",
        EventDate: DateTime.now(),
        EventLocation: "Location for OTR 6",
        Event_attended: false,
        EventDistance: 123),
  ];

  int currentIndex = 0;
  int attended_otr_carousel_ptr = 0;
  int past_otr_carousel_ptr = 0;

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
            bottomNavigationBar: NavBar(),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
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
                    items: items.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: Sizer.sbh * 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
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
                      alignment: Alignment.center,
                      child: Text(
                        "OTR : OFF THE ROAD EVENTS",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: Sizer.fsm),
                      )),
                  SizedBox(height: Sizer.sbv * 2),
                  Container(
                      alignment: Alignment.center,
                      width: Sizer.screenWidth * 0.8,
                      height: Sizer.sbv * 20,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "Placeholder text for OTR description",
                        style: TextStyle(fontSize: Sizer.fss),
                      )),
                  SizedBox(height: Sizer.sbv * 2),
                  Container(
                      width: Sizer.screenWidth * 0.8,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Active OTR",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "View All",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: Sizer.fss,
                              ),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(height: Sizer.sbv * 2),
                  OTREventCard(
                      event: current_otr,
                      displayText: true,
                      showCarousel: false),
                  SizedBox(height: Sizer.sbv * 2),
                  Container(
                      width: Sizer.screenWidth * 0.8,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Attended OTRs",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "View All",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: Sizer.fss,
                              ),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(height: Sizer.sbv * 2),
                  CarouselSlider(
                    options: CarouselOptions(
                        height: Sizer.sbv * 40,
                        autoPlay: false,
                        aspectRatio: 1.5,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            attended_otr_carousel_ptr = index;
                          });
                        },
                        enlargeFactor: 0.0),
                    items: attended_otrs.map((i) {
                      return Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: Sizer.sbh * 2),
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            OTREventPage(event: i)));
                              },
                              child: OTREventCard(
                                  event: i,
                                  displayText: false,
                                  showCarousel: false)));
                    }).toList(),
                  ),
                  DotsIndicator(
                    dotsCount: attended_otrs.length,
                    position: attended_otr_carousel_ptr,
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
                      width: Sizer.screenWidth * 0.8,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Past OTRs",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "View All",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: Sizer.fss,
                              ),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(height: Sizer.sbv * 2),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: Sizer.sbv * 40,
                      autoPlay: true,
                      aspectRatio: 1.5,
                      enlargeCenterPage: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          past_otr_carousel_ptr = index;
                        });
                      },
                    ),
                    items: past_otrs.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Sizer.sbh * 2),
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                OTREventPage(event: i)));
                                  },
                                  child: OTREventCard(
                                      event: i,
                                      displayText: false,
                                      showCarousel: false)));
                        },
                      );
                    }).toList(),
                  ),
                  DotsIndicator(
                    dotsCount: past_otrs.length,
                    position: past_otr_carousel_ptr,
                    decorator: DotsDecorator(
                      activeColor: Colors.orange,
                      color: Color.fromARGB(255, 212, 212, 212),
                      size: Size.square(10.0),
                      activeSize: Size(20.0, 10.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                  SizedBox(height: Sizer.sbv * 5),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OTRHistory()));
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
                        "View Your OTR History",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Sizer.fss,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: Sizer.sbv * 5),
                ],
              ),
            )));
  }
}
