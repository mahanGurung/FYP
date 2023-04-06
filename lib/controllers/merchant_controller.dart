import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:final_year_project/models/merchant.dart';
import 'package:final_year_project/utils/api.dart';

import '../services/auth_service.dart';

class MerchantController extends GetxController {
  AuthService authService = AuthService();
  var loading = false.obs;
  var isLoading = false.obs;
  List<Merchant> merchantsList = RxList.empty();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    get();
  }

  Future<void> register(
      {required String username,
      required String password,
      required File image}) async {
    var data = {'username': username, 'password': password, 'image': image};
    loading.value = true;
    var response = await http.post(Uri.parse(MERCAHNTADDAPI), body: data);
    loading.value = false;
    var decodedResponse = await jsonDecode(response.body);
    if (decodedResponse["success"]) {
      Get.back();
      Get.snackbar("Success", decodedResponse["message"],
          backgroundColor: Colors.white);
    } else {
      Get.snackbar("Failed", decodedResponse["message"],
          backgroundColor: Colors.white);
    }
  }

  submit({data, required File image}) async {
    var token = await authService.getToken();
    data["token"] = token;
    isLoading.value = true;
    var request = http.MultipartRequest('POST', Uri.parse(MERCAHNTADDAPI));
    request.fields.addAll(data);
    request.files.add(await http.MultipartFile.fromPath('image', image.path));
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

  Future<void> get() async {
    loading.value = true;
    var response = await http.get(
      Uri.parse(MERCAHNTGETAPI),
    );
    loading.value = false;
    var decodedResponse = await jsonDecode(response.body);
    if (decodedResponse["success"]) {
      var merchants = await decodedResponse["data"];
      for (var merchant in merchants) {
        merchantsList.add(Merchant.fromJson(merchant));
      }
      print(merchantsList);

      Get.snackbar("Success", decodedResponse["message"],
          backgroundColor: Colors.white);
      update(['merchants']);
    } else {
      Get.snackbar("Failed", decodedResponse["message"],
          backgroundColor: Colors.white);
    }
  }
}
