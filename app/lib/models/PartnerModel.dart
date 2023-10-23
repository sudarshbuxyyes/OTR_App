class PartnerModel {
  PartnerModel({
    required this.partnerId,
    required this.name,
    required this.description,
    required this.presence,
    required this.createdAt,
    required this.updatedAt,
  });
  String partnerId;
  String name;
  String description;
  String presence;
  String createdAt;
  String updatedAt;

  factory PartnerModel.fromJson(Map<String, dynamic> json) => PartnerModel(
      partnerId: json["_id"]!,
      name: json["name"]!,
      description: json["description"]!,
      presence: json["presence"]!,
      createdAt: json["createdAt"]!,
      updatedAt: json["updatedAt"]!);
}
///
///{"success":true,"data":[{"image_links":[],"has_special_badge":false,"_id":"6469145fdff5bd42bdab7236","otr_name":"","address_id":"address_1","otr_end_date":"2023-01-02T00:00:00.000Z","participant_count":5,"max_participant":50,"mode":"ONLINE","cost":300.2,"created_date":"2023-01-01T00:00:00.000Z","updated_date":"2023-01-01T00:00:00.000Z","__v":0,"locations":[]},{"image_links":[],"has_special_badge":false,"_id":"6469f6aa257728d72d1bf59e","otr_name":"","address_id":"address_1","otr_end_date":"2023-01-02T00:00:00.000Z","participant_count":5,"max_participant":50,"mode":"ONLINE","cost":300.2,"created_date":"2023-01-01T00:00:00.000Z","updated_date":"2023-01-01T00:00:00.000Z","__v":0,"locations":[]},{"image_links":[],"has_special_badge":false,"_id":"6469f6b9257728d72d1bf5a0","address_id":"address_1","otr_end_date":"2023-01-02T00:00:00.000Z","participant_count":5,"max_participant":50,"mode":"ONLINE","cost":300.2,"created_date":"2023-01-01T00:00:00.000Z","updated_date":"2023-01-01T00:00:00.000Z","__v":0,"locations":[]}]}
///