import 'dart:convert';
import 'dart:io';
// import 'package:flutter/foundation.dart';
import 'package:final_year_project/controllers/booking_controller.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:final_year_project/components/app_button.dart';
import 'package:final_year_project/controllers/category_controller.dart';
import 'package:final_year_project/controllers/doctor_controller.dart';
import 'package:final_year_project/models/category.dart';
import 'package:final_year_project/utils/messages.dart';

import '../../utils/api.dart';

class BookingPage extends StatefulWidget {
  BookingPage({super.key});
  final categoryController = Get.put(CategoryController());

  @override
  State<BookingPage> createState() => _DoctorPageState();
}

class _DoctorPageState extends State<BookingPage> {
  TextEditingController is_daily = TextEditingController();
  TextEditingController show_on_weekends = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController merchant = TextEditingController();

  BookingController bookingController = Get.put(BookingController());

  final _formKey = GlobalKey<FormState>();
  // final ImagePicker _picker = ImagePicker();
  // XFile? image;

  // List categories = [];
  // String? selectedCategory = "";
  // int? categoryId;

  // @override
  // void initState() {
  //   super.initState();
  //   _getCategories();
  // }

  // List<Categories> categoryList = RxList.empty();
  // var isLoading = false.obs;

  // Future _getCategories() async {
  //   try {
  //     isLoading.value = true;

  //     var response = await http.get(Uri.parse(CATEGORYGETAPI));
  //     isLoading.value = false;
  //     if (response.statusCode == 200) {
  //       var decodedResponse = json.decode(response.body);
  //       if (decodedResponse["success"]) {
  //         categoryList.clear();
  //         var categoriess = await decodedResponse["data"];
  //         for (var category in categoriess) {
  //           categoryList.add(Categories.fromJson(category));
  //           setState(() {
  //             categories = categoryList;
  //           });
  //         }
  //         Get.snackbar("Success", decodedResponse["message"],
  //             backgroundColor: Colors.white);
  //       } else {
  //         Get.snackbar("Failed", decodedResponse["message"],
  //             backgroundColor: Colors.white);
  //       }
  //     }
  //   } catch (e) {
  //     // ignore: avoid_print
  //     print("Error: $e");
  //   }
  // }

  String? selectedDoctor;
  List selectedItemListed = [];
  String? selectedMerchant;
  List merchantList = [];

  Future getAllDoctors() async {
    var url = Uri.parse(DOCTORIDGETAPI);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        selectedItemListed = jsonData;
      });
    }
  }

  Future getAllMerchant() async {
    var url = Uri.parse(GETMERCHANTAPI);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        merchantList = jsonData;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getAllDoctors();
    getAllMerchant();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(builder: (controller) {
      return Container(
        height: Get.height,
        color: Colors.white,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    "Doctor",
                    style: TextStyle(fontSize: 30),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 100,
                    width: 400,
                    child: DropdownButton(
                        isExpanded: true,
                        hint: const Text("Select doctor"),
                        value: selectedDoctor,
                        items: selectedItemListed.map((doctor) {
                          return DropdownMenuItem(
                              value: doctor['Id'].toString(),
                              child: Text(doctor['name']));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedDoctor = value;
                          });
                        }),
                  ),
                  TextFormField(
                    controller: is_daily,
                    decoration: const InputDecoration(
                      hintText: "Enter if doctor is available daily",
                      labelText: "Enter if doctor is available daily",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Field cannot be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: show_on_weekends,
                    decoration: const InputDecoration(
                      hintText: "Enter if doctor is available in weekends",
                      labelText: "Enter if doctor is available in weekends",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Field cannot be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: quantity,
                    decoration: const InputDecoration(
                      hintText: "Token quantity",
                      labelText: "Token quantity",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Field cannot be empty";
                      }
                      if (value is! int) {
                        return "Field cannot be alphabetical";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),

                  SizedBox(
                    height: 100,
                    width: 400,
                    child: DropdownButton(
                        isExpanded: true,
                        hint: const Text("Select merchant"),
                        value: selectedMerchant,
                        items: merchantList.map((merchant) {
                          return DropdownMenuItem(
                              value: merchant['Merchant_ID'].toString(),
                              child: Text(merchant['merchantName']));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedMerchant = value;
                          });
                        }),
                  ),

                  // SizedBox(
                  //   height: 100,
                  //   width: 400,
                  //   child: DropdownButton<String>(
                  //       value: selectedCategory,
                  //       items: [
                  //         const DropdownMenuItem(
                  //           value: "",
                  //           child: Text(
                  //             "Select Category",
                  //           ),
                  //         ),
                  //         ...categories.map<DropdownMenuItem<String>>((datas) {
                  //           return DropdownMenuItem(
                  //             value: datas['name'],
                  //             child: Text(datas['name']),
                  //           );
                  //         }).toList(),
                  //       ],
                  //       onChanged: (newValue) {
                  //         setState(() {
                  //           selectedCategory = newValue;
                  //           categoryId = (categories.firstWhere((doctor) =>
                  //                   category['name'] == newValue)['category_id']
                  //               as int);
                  //           widget.categoryController.updateCityId(categoryId!);
                  //         });
                  //       }),
                  // ),

                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: InkWell(
                  //     onTap: () async {
                  //       image = await _picker.pickImage(
                  //           source: ImageSource.gallery);
                  //       setState(() {});
                  //     },
                  //     child: SizedBox(
                  //       height: 200,
                  //       width: 200,
                  //       child: image != null
                  //           ? Image.file(
                  //               File(image!.path),
                  //               fit: BoxFit.cover,
                  //             )
                  //           : Image.network(
                  //               "https://static.vecteezy.com/system/resources/thumbnails/004/141/669/small_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg"),
                  //     ),
                  //   ),
                  // ),
                  Container(
                    child: bookingController.isLoading.value
                        ? const CircularProgressIndicator()
                        : AppButton(
                            label: "Add",
                            onPressed: () {
                              var isValid = _formKey.currentState!.validate();

                              // if (image == null) {
                              //   errorMessage("File not provided");
                              // }
                              if (isValid) {
                                var data = {
                                  'doctor_id': selectedDoctor!.toString(),
                                  'is_daily': is_daily.text,
                                  'show_on_weekends': show_on_weekends.text,
                                  'quantity': quantity.toString(),
                                  'merchant_id': selectedMerchant!.toString(),
                                };
                                bookingController.submit(data: data);
                                // , image: File(image!.path)
                              }
                            },
                            width: Get.width,
                          ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
