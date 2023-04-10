// To parse this JSON data, do
//
//     final merchant = merchantFromJson(jsonString);

import 'dart:convert';

List<RoleMerchant> merchantFromJson(String str) => List<RoleMerchant>.from(
    json.decode(str).map((x) => RoleMerchant.fromJson(x)));

String merchantToJson(List<RoleMerchant> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RoleMerchant {
  RoleMerchant({
    required this.merchantId,
    required this.userId,
    required this.image,
  });

  String merchantId;
  String userId;
  String image;

  factory RoleMerchant.fromJson(Map<String, dynamic> json) => RoleMerchant(
        merchantId: json["Merchant_ID"],
        userId: json["user_id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "Merchant_ID": merchantId,
        "user_id": userId,
        "image": image,
      };
}
