// create class for OTR event
import 'dart:convert';

import 'package:intl/intl.dart';

class OTREvent {
  List<String> image_links;
  bool has_special_badge;
  String id;
  String otr_name;
  String address_id;
  String otr_end_date;
  int participant_count;
  int max_participant_count;
  String mode;
  double cost;
  String created_date;
  String updated_date;
  List<String> locations;

  OTREvent({
    required this.image_links,
    required this.id,
    required this.otr_name,
    required this.address_id,
    required this.locations,
    required this.updated_date,
    required this.created_date,
    required this.otr_end_date,
    required this.cost,
    required this.mode,
    required this.participant_count,
    required this.max_participant_count,
    required this.has_special_badge,
  });

  int getEventReward(bool isPremium, bool EventAttended) {
    if (isPremium) {
      if (EventAttended) {
        return 10;
      } else {
        return 0;
      }
    } else {
      if (EventAttended) {
        return 5;
      } else {
        return -5;
      }
    }
  }

  // String formatEventDate() {
  //   return DateFormat.yMMMEd().format(EventDate);
  // }
  factory OTREvent.fromJson(String str) => OTREvent.fromMap(json.decode(str));

  factory OTREvent.fromMap(Map<String, dynamic> json) => OTREvent(
      id: json['_id'],
      has_special_badge: json['has_special_badge'],
      otr_name: json['otr_name'] ?? 'OTR Event',
      created_date: json['created_date'],
      updated_date: json['updated_date'],
      otr_end_date: json['otr_end_date'],
      address_id: json['address_id'],
      mode: json['mode'],
      participant_count: json['participant_count'],
      max_participant_count: json['max_participant'],
      cost: json['cost'],
      locations: json['locations'],
      image_links: json['image_links']);
}
//image_links: [], has_special_badge: false, _id: 6469145fdff5bd42bdab7236, otr_name: , address_id: address_1, otr_end_date: 2023-01-02T00:00:00.000Z, participant_count: 5, max_participant: 50, mode: ONLINE, cost: 300.2, created_date: 2023-01-01T00:00:00.000Z, updated_date: 2023-01-01T00:00:00.000Z, __v: 0, locations: []