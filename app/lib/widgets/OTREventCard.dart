import 'package:app/models/OTREventModel.dart';
import 'package:app/utils/Sizer.dart';
import 'package:flutter/material.dart';

class OTREventCard extends StatelessWidget {
  OTREventCard({
    Key? key,
    required OTREventModel this.event,
    required bool this.displayText,
    required bool this.showCarousel,
  }) : super(key: key);

  final OTREventModel event;
  final bool showCarousel;
  final bool displayText;

  var items = [
    'assets/images/off_roading.jpeg',
    'assets/images/otr_adventures.png',
    'assets/images/otr.jpeg'
  ];
  @override
  Widget build(BuildContext context) {
    Sizer.init(context);
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.grey[300]),
        width: Sizer.screenWidth * 0.8,
        child: Column(
          children: [
            showCarousel
                ? Container(
                    padding: EdgeInsets.all(Sizer.sbh),
                    height: Sizer.sbv * 20,
                    width: Sizer.screenWidth * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage('assets/images/off_roading.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Container(
                    height: Sizer.sbv * 20,
                    width: Sizer.screenWidth * 0.80,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage('assets/images/off_roading.jpeg'),
                          fit: BoxFit.cover,
                        )),
                  ),
            SizedBox(height: Sizer.sbv),
            displayText
                ? Container(
                    width: Sizer.screenWidth * 0.75,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Sizer.sbh * 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("OTR Event"),
                            Text(
                                "Ongoing till ${event.otrEndDate.substring(0, 10)}",
                                style: TextStyle(fontSize: Sizer.fss * 0.8))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Sizer.sbv * 2,
                      ),
                      Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: Sizer.sbh * 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Address : ${event.addressId}"),
                              Text(
                                  "${event.participantCount} / ${event.maxParticipant} Participants",
                                  style: TextStyle(fontSize: Sizer.fss * 0.8))
                            ],
                          )),
                      SizedBox(
                        height: Sizer.sbv * 2,
                      ),
                      Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: Sizer.sbh * 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Registrations are ${event.mode}"),
                              Text("Rs. ${event.cost.toString()} /-",
                                  style: TextStyle(fontSize: Sizer.fss * 0.8))
                            ],
                          )),
                      SizedBox(
                        height: Sizer.sbv,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: Sizer.sbh * 40,
                          height: Sizer.sbh * 9,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black,
                          ),
                          child: Text(
                            "View More",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Sizer.fss,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ]))
                : Container(),
            SizedBox(
              height: Sizer.sbv,
            )
          ],
        ));
  }
}
