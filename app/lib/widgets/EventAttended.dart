import 'package:app/utils/Sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EventAttendedCard extends StatelessWidget {
  const EventAttendedCard(
      {Key? key,
      required bool this.Attended,
      required bool this.ongoing,
      required bool this.registered,
      required String this.Event_type})
      : super(key: key);

  final bool Attended;
  final bool ongoing;
  final bool registered;
  final String Event_type;

  @override
  Widget build(BuildContext context) {
    String label = 'You did not attend this event';
    if (Event_type == 'OTR') {
      switch (Attended) {
        case true:
          label = 'You completed this OTR trip';
          break;
        case false:
          label = 'You did not complete this OTR trip';
          break;
      }
    } else {
      if (ongoing) {
        switch (registered) {
          case true:
            label = 'You are registered for this event';
            break;
          case false:
            label = 'You are not registered for this event';
            break;
        }
      } else{
         switch (Attended) {
        case true:
          label = 'You attended this event';
          break;
        case false:
          label = 'You did not attend this event';
          break;
      }
      }
    }
    Sizer.init(context);
    return Container(
        width: Sizer.screenWidth * 0.8,
        height: Sizer.sbv * 5,
        decoration: BoxDecoration(
            color: Attended
                ? Color.fromRGBO(56, 142, 60, 0.1)
                : Color.fromRGBO(211, 47, 47, 0.1),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: Attended
                    ? Color.fromRGBO(56, 142, 60, 1)
                    : Colors.red[700]!)),
        child: Row(children: [
          Padding(
            padding: EdgeInsets.all(Sizer.sbh),
            child: Attended
                ? Icon(
                    Icons.check_circle_outline_rounded,
                    color: Colors.green[700],
                  )
                : Icon(
                    Icons.warning_rounded,
                    color: Colors.red[700],
                  ),
          ),
          SizedBox(width: Sizer.sbh * 10),
          Padding(
              padding: EdgeInsets.all(Sizer.sbh * 2),
              child: Attended
                  ? Text(
                      label,
                      style: TextStyle(color: Colors.green[700]),
                    )
                  : Text(
                      label,
                      style: TextStyle(color: Colors.red[700]),
                    )),
        ]));
  }
}
