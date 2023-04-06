import 'dart:io';

import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:final_year_project/components/app_button.dart';
import 'package:final_year_project/controllers/merchant_controller.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/messages.dart';

// class AddMerchant extends StatelessWidget {
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   final MerchantController merchantController = Get.put(MerchantController());
//   AddMerchant({super.key});
//   final ImagePicker _picker = ImagePicker();
//   XFile? image;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: Get.height / 2,
//       color: Colors.white,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             const Center(
//                 child: Text(
//               "Add Merchant",
//               style: TextStyle(fontSize: 20),
//             )),
//             TextFormField(
//               controller: usernameController,
//               decoration: const InputDecoration(
//                 hintText: "Enter merchant username",
//                 labelText: "Username",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             TextFormField(
//               controller: passwordController,
//               decoration: const InputDecoration(
//                 hintText: "Enter merchant password",
//                 labelText: "Password",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: InkWell(
//                 onTap: () async {
//                   image = await _picker.pickImage(source: ImageSource.gallery);
//                   setState(() {});
//                 },
//                 child: SizedBox(
//                   height: 200,
//                   width: 200,
//                   child: image != null
//                       ? Image.file(
//                           File(image!.path),
//                           fit: BoxFit.cover,
//                         )
//                       : Image.network(
//                           "https://static.vecteezy.com/system/resources/thumbnails/004/141/669/small_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg"),
//                 ),
//               ),
//             ),
//             Obx(() => Container(
//                   child: merchantController.loading.value
//                       ? const CircularProgressIndicator()
//                       : AppButton(
//                           onPressed: () {
//                             merchantController.register(
//                                 username: usernameController.text,
//                                 password: passwordController.text);
//                           },
//                           width: Get.width,
//                           label: "Add",
//                         ),
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }

class AddMerchant extends StatefulWidget {
  AddMerchant({super.key});

  @override
  State<AddMerchant> createState() => _AddMerchantState();
}

class _AddMerchantState extends State<AddMerchant> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  MerchantController merchantController = Get.put(MerchantController());

  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 2,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Center(
                  child: Text(
                "Add Merchant",
                style: TextStyle(fontSize: 20),
              )),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
                  hintText: "Enter merchant username",
                  labelText: "Username",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: "Enter merchant password",
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () async {
                    image =
                        await _picker.pickImage(source: ImageSource.gallery);
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
                child: merchantController.isLoading.value
                    ? const CircularProgressIndicator()
                    : AppButton(
                        onPressed: () {
                          if (image == null) {
                            errorMessage("File not provided");
                          }

                          var data = {
                            'username': usernameController.text,
                            'password': passwordController.text,
                          };
                          merchantController.submit(
                              data: data, image: File(image!.path));
                        },
                        width: Get.width,
                        label: "Add",
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
