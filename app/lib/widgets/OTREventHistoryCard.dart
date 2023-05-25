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
                color: event.Event_attended
                    ? Colors.green[700]!
                    : Colors.red[700]!)),
        child: Column(
          children: [
            SizedBox(height: Sizer.sbv),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Sizer.sbh * 5),
                  child: Text(
                    event.EventName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Sizer.sbh * 5),
                  child: Text(event.formatEventDate()),
                )
              ],
            ),
            SizedBox(height: Sizer.sbv),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: Sizer.sbh * 5),
                    child: Text(event.EventDistance.toString() + " km")),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: Sizer.sbh * 5),
                    child: Row(
                      children: [
                        Text(
                          event
                                  .getEventReward(true, event.Event_attended)
                                  .toString() +
                              " XP",
                          style: TextStyle(
                              color: event.Event_attended
                                  ? Colors.green[700]
                                  : Colors.red[700]!),
                        ),
                        SizedBox(width: Sizer.sbh),
                        Icon(
                          event.Event_attended
                              ? Icons.trending_up_rounded
                              : Icons.trending_down_rounded,
                          color: event.Event_attended
                              ? Colors.green[700]
                              : Colors.red[700],
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
