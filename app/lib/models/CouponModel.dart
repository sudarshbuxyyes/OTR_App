class CouponModel {
  final String id;
  final String partner_id;
  final String? coupon_description; // Nullable field
  final String? coupon_code_premium; // Nullable field
  final String? coupon_code_non_premium; // Nullable field
  final int discount_percentage_premium; // Nullable field
  final bool for_premium_users_only;
  final String validity_start_timestamp;
  final String validity_end_timestamp;
  final String createdAt;
  final String updatedAt;

  CouponModel({
    required this.id,
    required this.partner_id,
    this.coupon_description,
    this.coupon_code_premium,
    this.coupon_code_non_premium,
    required this.discount_percentage_premium,
    required this.for_premium_users_only,
    required this.validity_start_timestamp,
    required this.validity_end_timestamp,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) => CouponModel(
        id: json["_id"],
        partner_id: json["partner_id"],
        coupon_description: json["coupon_description"],
        coupon_code_premium: json["coupon_code_premium"],
        coupon_code_non_premium: json["coupon_code_non_premium"],
        discount_percentage_premium: json["discount_percentage_premium"],
        for_premium_users_only: json["for_premium_users_only"],
        validity_start_timestamp: json["validity_start_timestamp"],
        validity_end_timestamp: json["validity_end_timestamp"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );
}
