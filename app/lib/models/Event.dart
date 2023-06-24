class Event {
  int EventID;
  String EventName;
  DateTime EventDate;
  String EventLocation;
  String EventDescription;
  bool Event_attended;
  bool Event_ongoing;

  int num_participants;
  int num_limit;
  Event({
    required this.EventID,
    required this.EventName,
    required this.EventDate,
    required this.EventLocation,
    required this.EventDescription,
    required this.Event_attended,
    required this.num_participants,
    required this.num_limit,
    required this.Event_ongoing,
  });
}
