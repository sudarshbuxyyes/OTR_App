class Badge {
  String id;
  String name;
  String description;
  String type;
  String sub_type;
  String createdAt;
  String updatedAt;

  Badge({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.sub_type,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Badge.fromJson(Map<String, dynamic> json) {
    return Badge(
        id: json['_id'],
        name: json['name'],
        description: json['description'],
        type: json['type'],
        sub_type: json['sub_type'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt']);
  }
}
