import 'package:app/models/Event.dart';
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
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.grey[300]),
        width: Sizer.screenWidth * 0.8,
        child: Column(
          children: [
            Container(
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
            ),
            SizedBox(height: Sizer.sbv),
            Container(
                height: Sizer.sbv * 30,
                width: Sizer.screenWidth * 0.75,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Text("Placeholder Text for Event Card Description")),
            SizedBox(
              height: Sizer.sbv,
            )
          ],
        ));
  }
}
