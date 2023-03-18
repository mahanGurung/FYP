import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:final_year_project/utils/api.dart';

import '../models/doctor.dart';
import '../services/auth_service.dart';

class DoctorController extends GetxController {
  AuthService authService = AuthService();
  var isLoading = false.obs;
  List<Doctor> doctorList = RxList.empty();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    get();
  }

  submit({data, required File image}) async {
    var token = await authService.getToken();
    data["token"] = token;
    isLoading.value = true;
    var request = http.MultipartRequest('POST', Uri.parse(ADD_DOCTOR));
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
      Uri.parse(DOCTORGETAPI),
    );
    isLoading.value = false;
    var decodedResponse = await jsonDecode(response.body);
    if (decodedResponse["success"]) {
      doctorList.clear();
      var doctors = await decodedResponse["data"];
      for (var doctor in doctors) {
        doctorList.add(Doctor.fromJson(doctor));
      }
      Get.snackbar("Success", decodedResponse["message"],
          backgroundColor: Colors.white);
    } else {
      Get.snackbar("Failed", decodedResponse["message"],
          backgroundColor: Colors.white);
    }
  }
}
