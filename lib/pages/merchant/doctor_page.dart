import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
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

class DoctorPage extends StatefulWidget {
  DoctorPage({super.key});
  final categoryController = Get.put(CategoryController());

  @override
  State<DoctorPage> createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();

  TextEditingController merchant = TextEditingController();

  DoctorController doctorController = Get.put(DoctorController());

  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  XFile? image;

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

  String? selectedCategories;
  List categoryItemListed = [];
  String? selectedMerchant;
  List merchantList = [];

  Future getAllCategory() async {
    var url = Uri.parse(CATEGORYGETAPI);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        categoryItemListed = jsonData;
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
    getAllCategory();
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
                  TextFormField(
                    controller: name,
                    decoration: const InputDecoration(
                      hintText: "Enter Doctor Name",
                      labelText: "Doctor Name",
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
                    controller: description,
                    decoration: const InputDecoration(
                      hintText: "Enter Doctor description",
                      labelText: "Doctor description",
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
                    controller: price,
                    decoration: const InputDecoration(
                      hintText: "Enter Doctor Appointment Price",
                      labelText: "Doctor Appointment Price",
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
                    height: 12.0,
                  ),
                  SizedBox(
                    height: 100,
                    width: 400,
                    child: DropdownButton(
                        isExpanded: true,
                        hint: const Text("Select Category"),
                        value: selectedCategories,
                        items: categoryItemListed.map((category) {
                          return DropdownMenuItem(
                              value: category['category_id'].toString(),
                              child: Text(category['name']));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCategories = value;
                          });
                        }),
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
                  //           categoryId = (categories.firstWhere((category) =>
                  //                   category['name'] == newValue)['category_id']
                  //               as int);
                  //           widget.categoryController.updateCityId(categoryId!);
                  //         });
                  //       }),
                  // ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () async {
                        image = await _picker.pickImage(
                            source: ImageSource.gallery);
                        setState(() {});
                      },
                      child: SizedBox(
                        height: 200,
                        width: 200,
                        child: image != null
                            ? Image.file(
                                File(image!.path),
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                "https://static.vecteezy.com/system/resources/thumbnails/004/141/669/small_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg"),
                      ),
                    ),
                  ),
                  Container(
                    child: doctorController.isLoading.value
                        ? const CircularProgressIndicator()
                        : AppButton(
                            label: "Add",
                            onPressed: () {
                              var isValid = _formKey.currentState!.validate();

                              if (image == null) {
                                errorMessage("File not provided");
                              }
                              if (isValid) {
                                var data = {
                                  'name': name.text,
                                  'description': description.text,
                                  'price': price.text,
                                  'category_id': selectedCategories!.toString(),
                                  'Merchant_ID': selectedMerchant!.toString(),
                                };
                                doctorController.submit(
                                    data: data, image: File(image!.path));
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
