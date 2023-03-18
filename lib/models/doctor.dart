import 'dart:convert';

List<Doctor?>? productFromJson(String str) => json.decode(str) == null
    ? []
    : List<Doctor?>.from(json.decode(str)!.map((x) => Doctor.fromJson(x)));

String productToJson(List<Doctor?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));

class Doctor {
  Doctor({
    this.id,
    this.name,
    this.image,
    this.description,
    this.price,
    this.quantity,
    this.approved,
    this.merchant,
    this.category,
  });

  String? id;
  String? name;
  String? image;
  String? description;
  String? price;
  String? quantity;
  String? approved;
  String? category;
  String? merchant;

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["Id"],
        name: json["name"],
        image: json["image"],
        description: json["description"],
        price: json["price"],
        quantity: json["quantity"],
        approved: json["approved"],
        merchant: json["Merchant_Id"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "name": name,
        "image": image,
        "description": description,
        "price": price,
        "quantity": quantity,
        "approved": approved,
        "Merchant_ID": merchant,
        "category": category,
      };
}
