import 'dart:convert';
import 'dart:io';

import 'package:final_year_project/models/booking.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:final_year_project/utils/api.dart';

import '../models/doctor.dart';
import '../services/auth_service.dart';

class BookingController extends GetxController {
  AuthService authService = AuthService();
  var isLoading = false.obs;
  List<Booking> bookingList = RxList.empty();
  List<Booking> filteredProducts = RxList.empty();
  List<Booking> filteredMerchant = RxList.empty();
  List<Booking> merchants = RxList.empty();
  List<Booking> bookingListMerchant = RxList();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    get();
  }

  submit({data}) async {
    var token = await authService.getToken();
    data["token"] = token;
    var userId = await authService.getUserID();
    data["merchantId"] = userId;
    isLoading.value = true;
    var request =
        http.MultipartRequest('POST', Uri.parse(ADD_AVAILABLE_BOOKING));
    request.fields.addAll(data);
    print(data);
    var response = await request.send();

    isLoading.value = false;
    var result = await response.stream.bytesToString();
    var decodedData = jsonDecode(result);
    var success = decodedData['success'];
    var message = decodedData['message'];

    if (success) {
      Get.back();
      Get.snackbar("Success", message,
          colorText: Colors.white, backgroundColor: Colors.green);
      await get();
    } else {
      Get.snackbar("Error", message,
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }

  toggle({data}) async {
    var token = await authService.getToken();
    data["token"] = token;
    var response = await http.post(Uri.parse(TOGGLE_DOCTOR), body: data);
    isLoading.value = false;
    var decodedResponse = await jsonDecode(response.body);
    if (decodedResponse["success"]) {
      Get.snackbar("Success", decodedResponse["message"]);
    } else {
      Get.snackbar("Failed", decodedResponse["message"]);
    }
  }

  Future<void> get() async {
    isLoading.value = true;
    var response = await http.get(
      Uri.parse(BOOKINGAPIGET),
    );
    isLoading.value = false;
    var decodedResponse = await jsonDecode(response.body);
    if (decodedResponse["success"]) {
      bookingList.clear();
      var doctors = await decodedResponse["data"];
      for (var doctor in doctors) {
        bookingList.add(Booking.fromJson(doctor));
      }
      Get.snackbar("Success", decodedResponse["message"],
          backgroundColor: Colors.white);
    } else {
      Get.snackbar("Failed", decodedResponse["message"],
          backgroundColor: Colors.white);
    }
  }

  // getMerchant() async {
  //   isLoading.value = true;
  //   var token = await authService.getToken();
  //   var data = {"token": token.toString()};

  //   var response = await http.post(Uri.parse(MERCAHNTGETAPI), body: data);
  //   isLoading.value = false;
  //   var decodedResponse = await jsonDecode(response.body);
  //   if (decodedResponse["success"]) {
  //     merchants = decodedResponse["data"]
  //         .map<Booking>((e) => Booking.fromJson(e))
  //         .toList();
  //     update();
  //   } else {
  //     if (decodedResponse["message"] == "Access denied") {
  //       Get.offAllNamed("/login");
  //     }
  //   }
  // }

  void filterCategory(String category) {
    filteredProducts.clear();
    filteredProducts = bookingList
        .where((element) =>
            element.doctorCategory!.toLowerCase() == category.toLowerCase())
        .toList();
    print(filteredProducts.length);
    update();
  }

  void filterMerchant(String merchant) {
    filteredMerchant.clear();
    filteredMerchant = bookingList
        .where((element) =>
            element.merchantName!.toLowerCase() == merchant.toLowerCase())
        .toList();
    print(filteredMerchant.length);
    update();
  }
}
