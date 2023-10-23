import 'dart:convert';

import 'package:app/models/ProductModel.dart';

class Cart {
  String? sId;
  String? userId;
  ProductModel? productId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Cart(
      {this.sId,
      this.userId,
      this.productId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Cart.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['user_id'];
    productId = json['product_id'] != null
        ? new ProductModel.fromJson(json['product_id'])
        : null;

    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user_id'] = this.userId;
    if (this.productId != null) {
      data['product_id'] = this.productId!.toJson();
    }

    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
