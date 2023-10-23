class ProductModel {
  String? sId;
  String? name;
  String? companyName;
  String? description;
  int? mrp;
  String? category;
  List<String>? images;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? discountPercentage;
  String? merchandiseType;
  int? premiumDiscountPercentage;
  int? quantity;

  ProductModel(
      {this.sId,
      this.name,
      this.companyName,
      this.description,
      this.mrp,
      this.category,
      this.images,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.discountPercentage,
      this.merchandiseType,
      this.premiumDiscountPercentage,
      this.quantity});

  ///factory PartnerModel.fromJson(Map<String, dynamic> json) => PartnerModel(
//       partnerId: json["_id"]!,
//       name: json["name"]!,
//       description: json["description"]!,
//       presence: json["presence"]!,
//       createdAt: json["createdAt"]!,
//       updatedAt: json["updatedAt"]!);
// }
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        sId: json['_id'],
        name: json['name'],
        companyName: json['company_name'],
        description: json['description'],
        mrp: json['mrp'],
        category: json['category'],
        images: json['images'].cast<String>(),
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        iV: json['__v'],
        discountPercentage: json['discount_percentage'],
        merchandiseType: json['merchandise_type'],
        premiumDiscountPercentage: json['premium_discount_percentage'],
        quantity: json['quantity'],
      );
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['company_name'] = this.companyName;
    data['description'] = this.description;
    data['mrp'] = this.mrp;
    data['category'] = this.category;
    data['images'] = this.images;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['discount_percentage'] = this.discountPercentage;
    data['merchandise_type'] = this.merchandiseType;
    data['premium_discount_percentage'] = this.premiumDiscountPercentage;
    data['quantity'] = this.quantity;
    return data;
  }
}
