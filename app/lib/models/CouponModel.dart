class CouponModel {
  CouponModel({
    required this.id,
    required this.partner_id,
    required this.coupon_description,
    required this.coupon_code_premium,
    required this.discount_percentage_premium,
    required this.coupon_code_non_premium,
    required this.for_premium_users_only,
    required this.validity_start_timestamp,
    required this.validity_end_timestamp,
    required this.createdAt,
    required this.updatedAt,
  });
  String id;
  String partner_id;
  String coupon_description;
  String coupon_code_premium;
  int discount_percentage_premium;
  String coupon_code_non_premium;
  bool for_premium_users_only;
  String validity_start_timestamp;
  String validity_end_timestamp;
  String createdAt;
  String updatedAt;

  factory CouponModel.fromJson(Map<String, dynamic> json) => CouponModel(
      id: json["_id"],
      partner_id: json["partner_id"],
      coupon_description: json["coupon_description"],
      coupon_code_premium: json["coupon_code_premium"],
      discount_percentage_premium: json["discount_percentage_premium"],
      coupon_code_non_premium: json["coupon_code_non_premium"],
      for_premium_users_only: json["for_premium_users_only"],
      validity_start_timestamp: json["validity_start_timestamp"],
      validity_end_timestamp: json["validity_end_timestamp"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"]);
}
