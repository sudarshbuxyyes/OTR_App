import 'package:app/utils/Sizer.dart';
import 'package:flutter/material.dart';

import '../models/OTREvent.dart';

class OTREventCard extends StatelessWidget {
  OTREventCard({
    Key? key,
    required OTREvent this.event,
    required bool this.displayText,
    required bool this.showCarousel,
  }) : super(key: key);
  
  final OTREvent event;
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
                    height: Sizer.sbv * 30,
                    width: Sizer.screenWidth * 0.75,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Text("Placeholder Text for Event Card Description"))
                : Container(),
            SizedBox(
              height: Sizer.sbv,
            )
          ],
        ));
  }
}
