import 'package:meta/meta.dart';
import 'dart:convert';

ApiResponse apiResponseFromJson(String str) =>
    ApiResponse.fromJson(json.decode(str));

String apiResponseToJson(ApiResponse data) => json.encode(data.toJson());

class ApiResponse {
  bool success;
  List<OTREventModel> data;

  ApiResponse({
    required this.success,
    required this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        success: json["success"],
        data: List<OTREventModel>.from(
            json["data"].map((x) => OTREventModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class OTREventModel {
  List<dynamic> imageLinks;
  bool hasSpecialBadge;
  String id;
  String? addressId;
  String otrEndDate;
  int participantCount;
  int maxParticipant;
  String? mode;
  double cost;
  String? createdDate;
  String? updatedDate;
  List<dynamic> locations;

  OTREventModel({
    required this.imageLinks,
    required this.hasSpecialBadge,
    required this.id,
    this.addressId,
    required this.otrEndDate,
    required this.participantCount,
    required this.maxParticipant,
    required this.mode,
    required this.cost,
    required this.createdDate,
    required this.updatedDate,
    required this.locations,
  });

  factory OTREventModel.fromJson(Map<String, dynamic> json) => OTREventModel(
        imageLinks: List<dynamic>.from(json["image_links"].map((x) => x)),
        hasSpecialBadge: json["has_special_badge"],
        id: json["_id"],
        addressId: json["address_id"],
        otrEndDate: json["otr_end_date"],
        participantCount: json["participant_count"],
        maxParticipant: json["max_participant"],
        mode: json["mode"],
        cost: json["cost"]?.toDouble(),
        createdDate: json["created_date"],
        updatedDate: json["updated_date"],
        locations: List<dynamic>.from(json["locations"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "image_links": List<dynamic>.from(imageLinks.map((x) => x)),
        "has_special_badge": hasSpecialBadge,
        "_id": id,
        "address_id": addressId,
        "otr_end_date": otrEndDate,
        "participant_count": participantCount,
        "max_participant": maxParticipant,
        "mode": mode,
        "cost": cost,
        "created_date": createdDate,
        "updated_date": updatedDate,
        "locations": List<dynamic>.from(locations.map((x) => x)),
      };
}
