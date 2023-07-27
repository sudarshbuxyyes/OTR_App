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
      partnerId: json["_id"],
      name: json["name"],
      description: json["description"],
      presence: json["presence"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"]);
}
