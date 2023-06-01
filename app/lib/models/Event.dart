class Event {
  int EventID;
  String EventName;
  DateTime EventDate;
  String EventLocation;
  String EventDescription;
  bool Event_attended;
  int num_participants;
  Event({
    required this.EventID,
    required this.EventName,
    required this.EventDate,
    required this.EventLocation,
    required this.EventDescription,
    required this.Event_attended,
    required this.num_participants,
  });
}
