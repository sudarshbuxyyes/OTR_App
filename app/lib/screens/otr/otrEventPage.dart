import 'package:app/models/OTREvent.dart';
import 'package:app/utils/Sizer.dart';
import 'package:app/widgets/EventAttended.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class OTREventPage extends StatefulWidget {
  const OTREventPage({Key? key, required this.event}) : super(key: key);

  final OTREvent event;

  @override
  State<OTREventPage> createState() => _OTREventPageState();
}

class _OTREventPageState extends State<OTREventPage> {
  //list of dummy images for carousel
  final items = [
    'assets/images/off_roading.jpeg',
    'assets/images/otr_adventures.png',
    'assets/images/otr.jpeg'
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
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
                    widget.event.otr_name,
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
                              widget.event.address_id.toString(),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(Sizer.sbv),
                            child: Text(
                              widget.event.created_date.toString(),
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
                    "Dummy Description for OTR Event",
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              SizedBox(height: Sizer.sbv * 2),
              EventAttendedCard(
                Attended: true,
                Event_type: "OTR",
                ongoing: false,
                registered: true,
              ),
              SizedBox(height: Sizer.sbv * 2),
            ])));
  }
}
