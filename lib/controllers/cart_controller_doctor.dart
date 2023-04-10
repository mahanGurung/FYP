import 'dart:convert';

import 'package:get/get.dart';
// import 'package:week_one_project/models/doctor.dart';
// import 'package:week_one_project/utils/messages.dart';

import '../models/doctor.dart';
import '../utils/messages.dart';

class CartController extends GetxController {
  var quantity = 1.obs;
  var cart = {}.obs;
  var totalCosting = 0.0.obs;

  void add({required Doctor doctor}) {
    cart[doctor.id] = jsonEncode(Doctor(
        description: doctor.description,
        price: doctor.price,
        approved: doctor.approved,
        category: doctor.category,
        merchant: doctor.merchant,
        image: doctor.image,
        quantity: quantity.value.toString()));
    quantity.value = 1;
    totalCosting.value = getTotal();

    Get.back();
    successMessage("Successfully added to Cart");
  }

  void increase() {
    quantity.value++;
  }

  getTotal() {
    var total = 0.0;
    for (var doctor in cart.values) {
      Doctor p = Doctor.fromJson(jsonDecode(doctor));
      var lineTotal = double.parse(p.price!) * double.parse(p.quantity!);
      total = total + lineTotal;
    }
    return total;
  }

  void decrease() {
    if (quantity.value != 1) {
      quantity.value--;
    }
  }
}
