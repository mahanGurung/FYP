import 'package:final_year_project/models/merchant.dart';
import 'package:flutter/material.dart';
// import 'package:final_year_project/models/category.dart';
import 'package:final_year_project/utils/api.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../models/booking.dart';

class MerchantTile extends StatelessWidget {
  final Merchant e;
  final Color merchantColor;
  final double imageRadius;
  const MerchantTile(
      {super.key,
      required this.e,
      this.merchantColor = Colors.grey,
      this.imageRadius = 40});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(9),
      decoration: BoxDecoration(
          color: merchantColor, borderRadius: BorderRadius.circular(10)),
      height: Get.height / 6,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Container(
            //   height: imageRadius,
            //   width: imageRadius,
            //   decoration: BoxDecoration(
            //       color: Colors.white,
            //       image: DecorationImage(
            //           image: NetworkImage(baseUrl + e.image!),
            //           fit: BoxFit.cover),
            //       borderRadius: BorderRadius.circular(10)),
            // ),
            const SizedBox(
              width: 10,
            ),
            Text(
              e.username,
              style: const TextStyle(color: Colors.white, fontSize: 20),
              overflow: TextOverflow.fade,
            ),
          ],
        ),
      ),
    );
  }
}
