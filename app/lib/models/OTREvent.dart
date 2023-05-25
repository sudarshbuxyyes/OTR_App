// create class for OTR event
import 'package:intl/intl.dart';

class OTREvent {
  int EventID;
  String EventName;
  DateTime EventDate;
  String EventLocation;
  String EventDescription;
  bool Event_attended;
  int EventDistance;
  OTREvent(
      {required this.EventID,
      required this.EventName,
      required this.EventDate,
      required this.EventLocation,
      required this.EventDescription,
      required this.Event_attended,
      required this.EventDistance});

  int getEventReward(bool isPremium, bool Event_attended) {
    if (isPremium) {
      if (Event_attended) {
        return 10;
      } else {
        return 0;
      }
    } else {
      if (Event_attended) {
        return 5;
      } else {
        return -5;
      }
    }
  }

  String formatEventDate() {
    return DateFormat.yMMMEd().format(EventDate);
  }
}
