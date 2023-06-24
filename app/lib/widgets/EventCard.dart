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
    int participation_thresh1 = (event.num_limit / 2).toInt();
    int participation_thresh2 = (event.num_limit * 0.75).toInt();
    Color col;
    if (event.num_participants < participation_thresh1) {
      //green
      col = Colors.green[800]!;
    } else if (event.num_participants <= participation_thresh2) {
      //yellow
      col = Colors.yellow[800]!;
    } else {
      //red
      col = Colors.red[800]!;
    }

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
                              padding: EdgeInsets.symmetric(
                                  horizontal: Sizer.sbh * 2,
                                  vertical: Sizer.sbv),
                              child: Text(
                                "Event Name",
                                style: TextStyle(
                                    fontSize: Sizer.fss * 0.9,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Sizer.sbh * 2,
                                    vertical: Sizer.sbv),
                                child: Container(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: Colors.black87,
                                        size: Sizer.fss,
                                      ),
                                      SizedBox(width: Sizer.sbh),
                                      Text(
                                        "Location",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: Sizer.fss,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                )),
                          ],
                        ),
                        SizedBox(height: Sizer.sbv),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Sizer.sbh, vertical: Sizer.sbv),
                              child: Text("Time, Date",
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.normal,
                                      fontSize: Sizer.fss * 0.8)),
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Sizer.sbh, vertical: Sizer.sbv),
                                child: Container(
                                  child: Text(
                                      event.num_participants.toString() +
                                          "/" +
                                          "50 Participants",
                                      style: TextStyle(
                                          color: col,
                                          fontWeight: FontWeight.normal,
                                          fontSize: Sizer.fss * 0.8)),
                                )),
                          ],
                        ),
                        SizedBox(height: Sizer.sbv),
                      ],
                    )),
              ],
            )));
  }
}
