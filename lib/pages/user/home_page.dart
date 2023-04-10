import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:final_year_project/pages/auth_checker.dart';
import 'package:final_year_project/services/auth_service.dart';
import 'package:badges/badges.dart' as badges;
import '../../components/doctor_tile.dart';
import '../../controllers/cart_controller_doctor.dart';
import '../../controllers/doctor_controller.dart';
import '../../models/doctor.dart';
import '../cart_page_doctor.dart';

// class HomePage extends StatelessWidget {
//   AuthService authService = AuthService();
//   HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 10,
//         title: const Text("My chats"),
//         actions: [
//           IconButton(
//               onPressed: () async {
//                 await authService.removeToken();
//                 Get.to(const AuthChecker());
//               },
//               icon: const Icon(Icons.logout)),
//         ],
//       ),
//     );
//   }
// }

// import 'package:badges/badges.dart' as badges;
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// // import 'package:week_one_project/components/product_tile.dart';
// import 'package:week_one_project/components/doctor_tile.dart';

// import 'package:week_one_project/components/user_component.dart';
// // import 'package:week_one_project/controllers/cart_controller.dart';
// import 'package:week_one_project/controllers/cart_controller_doctor.dart';
// import 'package:week_one_project/controllers/doctor_controller.dart';
// // import 'package:week_one_project/controllers/product_controller.dart';
// import 'package:week_one_project/models/doctor.dart';
// // import 'package:week_one_project/models/product.dart';

// import 'package:week_one_project/pages/auth_checker.dart';
// // import 'package:week_one_project/pages/cart_page.dart';
// import 'package:week_one_project/services/auth_service.dart';

// import '../../cart_page_doctor.dart';

// ignore: must_be_immutable
// class HomePage extends StatelessWidget {
//   ProductController pc = Get.put(ProductController());
//   CartController cartController = Get.put(CartController());
//   AuthService authService = AuthService();
//   HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 10,
//         title: const Text("Ecom"),
//         actions: [
//           IconButton(
//               onPressed: () async {
//                 Get.to(() => CartPage());
//               },
//               icon: Obx(() => Container(
//                     child: badges.Badge(
//                         badgeContent: Text(
//                           cartController.cart.length.toString(),
//                           style: TextStyle(color: Colors.white),
//                         ),
//                         child: const Icon(Icons.shopping_bag)),
//                   ))),
//           IconButton(
//               onPressed: () async {
//                 await authService.removeToken();
//                 Get.to(const AuthChecker());
//               },
//               icon: const Icon(Icons.logout)),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           child: Obx(() => Wrap(
//                 children: pc.productList
//                     .map((Product p) => ProductTile(
//                           p: p,
//                           pc: pc,
//                           isAdmin: false,
//                         ))
//                     .toList(),
//               )),
//         ),
//       ),
//     );
//   }
// }

class HomePage extends StatelessWidget {
  DoctorController dc = Get.put(DoctorController());
  CartController cartController = Get.put(CartController());
  AuthService authService = AuthService();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: const Text("Ecom"),
        actions: [
          IconButton(
              onPressed: () async {
                Get.to(() => CartPage());
              },
              icon: Obx(() => Container(
                    child: badges.Badge(
                        badgeContent: Text(
                          cartController.cart.length.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                        child: const Icon(Icons.shopping_bag)),
                  ))),
          IconButton(
              onPressed: () async {
                await authService.removeToken();
                Get.to(const AuthChecker());
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Obx(() => Wrap(
                children: dc.doctorList
                    .map((Doctor d) => DoctorTile(
                          d: d,
                          dc: dc,
                          isAdmin: false,
                        ))
                    .toList(),
              )),
        ),
      ),
    );
  }
}
