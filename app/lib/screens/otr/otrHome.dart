import 'package:app/models/OTREvent.dart';
import 'package:app/models/OTREventModel.dart';
import 'package:app/screens/otr/otrEventPage.dart';
import 'package:app/screens/otr/otrHistoryPage.dart';
import 'package:app/services/api_services.dart';
import 'package:app/services/userProvider.dart';
import 'package:app/utils/Sizer.dart';
import 'package:app/widgets/NavBar.dart';
import 'package:app/widgets/OTREventCard.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

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
    id: "0",
    has_special_badge: false,
    otr_name: "OTR 0",
    created_date: DateTime.now().toString(),
    updated_date: DateTime.now().toString(),
    address_id: "Location 1",
    otr_end_date: DateTime.now().toString(),
    cost: 100,
    mode: 'OFFLINE',
    participant_count: 5,
    max_participant_count: 50,
    image_links: [],
    locations: [],
  );
  //list of otrs attended by the user. //for front-end use//
  final attended_otrs = [
    // OTREvent(
    //     EventID: 2,
    //     EventName: "OTR 2",
    //     EventDescription: "Description for OTR 2",
    //     EventDate: DateTime.now(),
    //     EventLocation: "Location for OTR 2",
    //     Event_attended: true,
    //     EventDistance: 123),
    OTREvent(
      id: "2",
      has_special_badge: false,
      otr_name: "OTR 1",
      created_date: DateTime.now().toString(),
      updated_date: DateTime.now().toString(),
      address_id: "Location 1",
      otr_end_date: DateTime.now().toString(),
      cost: 100,
      mode: 'OFFLINE',
      participant_count: 5,
      max_participant_count: 50,
      image_links: [],
      locations: [],
    ),
    OTREvent(
      id: "3",
      has_special_badge: false,
      otr_name: "OTR 3",
      created_date: DateTime.now().toString(),
      updated_date: DateTime.now().toString(),
      address_id: "Location 1",
      otr_end_date: DateTime.now().toString(),
      cost: 100,
      mode: 'OFFLINE',
      participant_count: 5,
      max_participant_count: 50,
      image_links: [],
      locations: [],
    ),
  ];

  //list of past otr events //for front-end use//
  final past_otrs = [
    OTREvent(
      id: "1",
      otr_name: "OTR 1",
      has_special_badge: false,
      created_date: DateTime.now().toString(),
      updated_date: DateTime.now().toString(),
      address_id: "Location 1",
      otr_end_date: DateTime.now().toString(),
      cost: 100,
      mode: 'OFFLINE',
      participant_count: 5,
      max_participant_count: 50,
      image_links: [],
      locations: [],
    ),
    OTREvent(
      id: "2",
      otr_name: "OTR 1",
      has_special_badge: false,
      created_date: DateTime.now().toString(),
      updated_date: DateTime.now().toString(),
      address_id: "Location 1",
      otr_end_date: DateTime.now().toString(),
      cost: 100,
      mode: 'OFFLINE',
      participant_count: 5,
      max_participant_count: 50,
      image_links: [],
      locations: [],
    ),
    OTREvent(
      id: "3",
      otr_name: "OTR 3",
      has_special_badge: false,
      created_date: DateTime.now().toString(),
      updated_date: DateTime.now().toString(),
      address_id: "Location 1",
      otr_end_date: DateTime.now().toString(),
      cost: 100,
      mode: 'OFFLINE',
      participant_count: 5,
      max_participant_count: 50,
      image_links: [],
      locations: [],
    ),
    OTREvent(
      has_special_badge: false,
      id: "4",
      otr_name: "OTR 4",
      created_date: DateTime.now().toString(),
      updated_date: DateTime.now().toString(),
      address_id: "Location 1",
      otr_end_date: DateTime.now().toString(),
      cost: 100,
      mode: 'OFFLINE',
      participant_count: 5,
      max_participant_count: 50,
      image_links: [],
      locations: [],
    ),
    OTREvent(
      has_special_badge: false,
      id: "5",
      otr_name: "OTR 5",
      created_date: DateTime.now().toString(),
      updated_date: DateTime.now().toString(),
      address_id: "Location 1",
      otr_end_date: DateTime.now().toString(),
      cost: 100,
      mode: 'OFFLINE',
      participant_count: 5,
      max_participant_count: 50,
      image_links: [],
      locations: [],
    ),
    OTREvent(
      id: "6",
      has_special_badge: false,
      otr_name: "OTR 6",
      created_date: DateTime.now().toString(),
      updated_date: DateTime.now().toString(),
      address_id: "Location 1",
      otr_end_date: DateTime.now().toString(),
      cost: 100,
      mode: 'OFFLINE',
      participant_count: 5,
      max_participant_count: 50,
      image_links: [],
      locations: [],
    ),
  ];

  int currentIndex = 0;
  int attended_otr_carousel_ptr = 0;
  int past_otr_carousel_ptr = 0;
  late Future<List<OTREventModel>> _events;

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    _events = ApiService().getOTREvents(userProvider.user!.access_token);
  }

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
            bottomNavigationBar: NavBar(
              selected_index: 0,
            ),
            body: FutureBuilder<List<OTREventModel>>(
                future: _events,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData) {
                    return Text('No events available.');
                  } else {
                    final _events = snapshot.data!;
                    return SingleChildScrollView(
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
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Sizer.sbh * 2),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            image: AssetImage(i),
                                            fit: BoxFit.cover)),
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
                                "Dummy Desc for OTR Adventures",
                                style: TextStyle(fontSize: Sizer.fss),
                              )),
                          SizedBox(height: Sizer.sbv * 2),
                          Container(
                              width: Sizer.screenWidth * 0.8,
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              event: _events[0],
                              displayText: true,
                              showCarousel: false),
                          SizedBox(height: Sizer.sbv * 2),
                          Container(
                              width: Sizer.screenWidth * 0.8,
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                            items: _events.map((i) {
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
                                        displayText: true,
                                        showCarousel: false),
                                  ));
                            }).toList(),
                          ),
                          DotsIndicator(
                            dotsCount: _events.length,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                            items: _events.map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: Sizer.sbh * 2),
                                      child: InkWell(
                                          onTap: () {
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) =>
                                            //             OTREventPage(
                                            //                 event: i)));
                                          },
                                          child: OTREventCard(
                                              event: i,
                                              displayText: true,
                                              showCarousel: false)));
                                },
                              );
                            }).toList(),
                          ),
                          DotsIndicator(
                            dotsCount: _events.length,
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
                    );
                  }
                })));
  }
}
