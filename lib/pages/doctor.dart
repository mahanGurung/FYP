import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:final_year_project/components/app_button.dart';
// import 'package:week_one_project/controllers/cart_controller.dart';
import 'package:final_year_project/controllers/cart_controller_doctor.dart';
import 'package:final_year_project/models/doctor.dart';
// import 'package:week_one_project/models/product.dart';
// import 'package:week_one_project/pages/increment_decrement.dart';
// import 'package:final_year_project/pages/increment_decrement_doctor.dart';
import 'package:final_year_project/utils/api.dart';

// class AdminProductPage extends StatelessWidget {
//   final Product product;
//   final CartController cc = Get.put(CartController());
//   AdminProductPage({super.key, required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Hero(
//             tag: 'image_' + product.image!,
//             child: Image.network(
//               baseUrl + product.image!,
//               height: 300,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Text(product.description!),
//           Text("Price: " + product.price!),
//           Spacer(),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: AppButton(
//               width: Get.width,
//               onPressed: () {
//                 Get.bottomSheet(IncrementDecrement(
//                   p: product,
//                 ));
//               },
//               label: "Add To Cart",
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class AdminProductPage extends StatelessWidget {
  final Doctor doctor;
  final CartController cc = Get.put(CartController());

  AdminProductPage({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Hero(
            tag: 'image_' + doctor.image!,
            child: Image.network(
              baseUrl + doctor.image!,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          Text(doctor.description!),
          Text("Price: " + doctor.price!),
          Spacer(),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppButton(
                label: "Add to Cart",
                width: Get.width,
                onPressed: () => cc.add(doctor: doctor),
              )
              // AppButton(
              //   width: Get.width,
              //   onPressed: () {
              //     Get.bottomSheet(IncrementDecrement(
              //       d: doctor,
              //     )
              //     );
              //   },
              //   label: "Add To Cart",
              // ),
              ),
        ],
      ),
    );
  }
}
