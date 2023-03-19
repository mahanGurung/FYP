import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:final_year_project/controllers/doctor_controller.dart';
import 'package:final_year_project/models/doctor.dart';

import '../../../utils/api.dart';

class BookingD extends StatelessWidget {
  DoctorController doctorController = Get.put(DoctorController());
  BookingD({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text("Bookings"),
        ),
        body: SingleChildScrollView(
          child: Obx(() => Column(
                children: doctorController.doctorList
                    .map((Doctor doctor) => DoctorCard(doctor))
                    .toList(),
              )),
        ));
  }

  Widget DoctorCard(Doctor doctor) {
    return Container(
        height: 450,
        width: 250,
        color: Color.fromARGB(255, 221, 187, 187),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network(baseUrl + doctor.image!),
              Text(doctor.name!),
              Text(doctor.category!),
              Text(doctor.description!),
              Text(doctor.price!),
              Text(doctor.approved == '0' ? "Not Approved" : "Approved")
            ],
          ),
        ));
  }
}

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:week_one_project/controllers/category_controller.dart';
// import 'package:week_one_project/models/category.dart';

// import '../../../utils/api.dart';

// class BookingD extends StatelessWidget {
//   CategoryController categoryController = Get.put(CategoryController());
//   BookingD({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.amber,
//           title: const Text("Bookings"),
//         ),
//         body: SingleChildScrollView(
//           child: Obx(() => Column(
//                 children: categoryController.categoryList
//                     .map((Categories category) => DoctorCard(category))
//                     .toList(),
//               )),
//         ));
//   }

//   Widget DoctorCard(Categories category) {
//     return Container(
//         height: 450,
//         width: 250,
//         color: Color.fromARGB(255, 221, 187, 187),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Text(category.id!),
//               Text(category.name!),
//             ],
//           ),
//         ));
//   }
// }
