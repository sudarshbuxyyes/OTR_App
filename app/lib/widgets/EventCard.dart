import 'package:app/models/Event.dart';
import 'package:app/screens/events/eventDetails.dart';
import 'package:app/utils/Sizer.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  EventCard({
    Key? key,
    required Event this.event,
    required bool this.showCover,
  }) : super(key: key);
  final Event event;
  final bool showCover;
  var items = [
    'assets/images/off_roading.jpeg',
    'assets/images/otr_adventures.png',
    'assets/images/otr.jpeg'
  ];
  @override
  Widget build(BuildContext context) {
    Sizer.init(context);
    return InkWell(
        onTap: () {
          //move to event Details window
          print("Inkwell tap registered");
          Navigator.push(context, MaterialPageRoute(builder: ((context) {
            return EventDetailPage(event: event);
          })));
        },
        child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300]),
            width: Sizer.screenWidth * 0.8,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(Sizer.sbh),
                  height: Sizer.sbv * 10,
                  width: Sizer.screenWidth * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/images/off_roading.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(Sizer.sbh),
                              child: Text("Event Name"),
                            ),
                            Padding(
                                padding: EdgeInsets.all(Sizer.sbh),
                                child: Container(
                                  child: Row(
                                    children: [
                                      Icon(Icons.location_on_outlined),
                                      Text("View Location")
                                    ],
                                  ),
                                )),
                          ],
                        ),
                        SizedBox(height: Sizer.sbv),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(Sizer.sbh),
                              child: Text("Time, Date"),
                            ),
                            Padding(
                                padding: EdgeInsets.all(Sizer.sbh),
                                child: Container(
                                  child: Text("12/30 Participants"),
                                )),
                          ],
                        ),
                        SizedBox(height: Sizer.sbv),
                      ],
                    )),
                SizedBox(
                  height: Sizer.sbv,
                )
              ],
            )));
  }
}
