import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
// import 'package:week_one_project/components/app_button.dart';
// import 'package:week_one_project/components/product_tile.dart';
// import 'package:week_one_project/controllers/cart_controller.dart';
// import 'package:week_one_project/controllers/cart_controller_doctor.dart';
// import 'package:week_one_project/models/product.dart';
// import 'package:week_one_project/models/doctor.dart';
// import 'package:week_one_project/payment/khalti.dart';

import '../components/app_button.dart';
import '../controllers/cart_controller_doctor.dart';
import '../models/doctor.dart';
import '../payment/khalti.dart';
import '../utils/api.dart';

// class CartPage extends StatelessWidget {
//   CartController cartController = Get.put(CartController());
//   CartPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Cart Page"),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Wrap(
//                 children: cartController.cart.values
//                     .map((e) => cartTile(
//                           p: Product.fromJson(jsonDecode(e)),
//                         ))
//                     .toList()),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Obx(() => AppButton(
//                   onPressed: () {
//                     Get.to(() => KhaltiExampleApp());
//                   },
//                   width: Get.width,
//                   label: "Pay " + cartController.totalCosting.toString(),
//                 )),
//           )
//         ],
//       ),
//     );
//   }

//   Widget cartTile({required Product p}) {
//     return Container(
//         width: Get.width,
//         height: (Get.width / 3),
//         decoration: const BoxDecoration(
//           color: Colors.white,
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: const BorderRadius.all(Radius.circular(20.0)),
//               border: Border.all(color: Colors.black, width: 0.5),
//               boxShadow: [BoxShadow()],
//             ),
//             child: Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Hero(
//                     tag: 'image_' + p.image!,
//                     child: Container(
//                       width: 120,
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius:
//                               const BorderRadius.all(Radius.circular(20.0)),
//                           image: DecorationImage(
//                               fit: BoxFit.fill,
//                               image: NetworkImage(
//                                 baseUrl + p.image!,
//                               )),
//                           boxShadow: [BoxShadow()]),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                     child:
//                         Text(p.description!, style: TextStyle(fontSize: 15))),
//                 Expanded(
//                     child: Text(p.quantity.toString(),
//                         style: TextStyle(fontSize: 20))),
//                 Expanded(
//                   child: Text(
//                     (int.parse(p.quantity.toString()) *
//                             double.parse(p.price.toString()))
//                         .toString(),
//                     style: TextStyle(fontSize: 20),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ));
//   }
// }

class CartPage extends StatelessWidget {
  CartController cartController = Get.put(CartController());
  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Page"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Wrap(
                children: cartController.cart.values
                    .map((e) => cartTile(
                          d: Doctor.fromJson(jsonDecode(e)),
                        ))
                    .toList()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() => AppButton(
                  onPressed: () {
                    Get.to(() => KhaltiExampleApp());
                  },
                  width: Get.width,
                  label: "Pay " + cartController.totalCosting.toString(),
                )),
          )
        ],
      ),
    );
  }

  Widget cartTile({required Doctor d}) {
    return Container(
        width: Get.width,
        height: (Get.width / 3),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              border: Border.all(color: Colors.black, width: 0.5),
              boxShadow: [BoxShadow()],
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Hero(
                    tag: 'image_' + d.image!,
                    child: Container(
                      width: 120,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                baseUrl + d.image!,
                              )),
                          boxShadow: [BoxShadow()]),
                    ),
                  ),
                ),
                Expanded(
                    child:
                        Text(d.description!, style: TextStyle(fontSize: 15))),
                Expanded(
                    child: Text(d.quantity.toString(),
                        style: TextStyle(fontSize: 20))),
                Expanded(
                  child: Text(
                    (int.parse(d.quantity.toString()) *
                            double.parse(d.price.toString()))
                        .toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
