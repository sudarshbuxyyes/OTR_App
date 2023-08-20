import 'package:app/models/OTREvent.dart';
import 'package:flutter/material.dart';

import '../utils/Sizer.dart';

class OTREventHistoryCard extends StatelessWidget {
  const OTREventHistoryCard({
    Key? key,
    required OTREvent this.event,
  }) : super(key: key);

  final OTREvent event;

  @override
  Widget build(BuildContext context) {
    Sizer.init(context);
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: true ? Colors.green[700]! : Colors.red[700]!)),
        child: Column(
          children: [
            SizedBox(height: Sizer.sbv),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Sizer.sbh * 5),
                  child: Text(
                    event.otr_name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Sizer.sbh * 5),
                  child: Text(event.created_date.toString()),
                )
              ],
            ),
            SizedBox(height: Sizer.sbv),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: Sizer.sbh * 5),
                    child: Text("123 km")),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: Sizer.sbh * 5),
                    child: Row(
                      children: [
                        Text(
                          event.getEventReward(true, true).toString() + " XP",
                          style: TextStyle(
                              color:
                                  true ? Colors.green[700] : Colors.red[700]!),
                        ),
                        SizedBox(width: Sizer.sbh),
                        Icon(
                          true
                              ? Icons.trending_up_rounded
                              : Icons.trending_down_rounded,
                          color: true ? Colors.green[700] : Colors.red[700],
                        ),
                      ],
                    )),
              ],
            ),
            SizedBox(
              height: Sizer.sbv,
            )
          ],
        ));
  }
}
