import 'package:flutter/material.dart';
import 'package:final_year_project/models/category.dart';
import 'package:final_year_project/utils/api.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CategoryTile extends StatelessWidget {
  final Categories e;
  final Color categoryColor;
  final double imageRadius;
  const CategoryTile(
      {super.key,
      required this.e,
      this.categoryColor = Colors.grey,
      this.imageRadius = 90});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(9),
      decoration: BoxDecoration(
          color: categoryColor, borderRadius: BorderRadius.circular(10)),
      height: Get.height / 6,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          children: [
            Container(
              height: imageRadius,
              width: imageRadius,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: NetworkImage(baseUrl + e.image),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10)),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              e.name,
              style: const TextStyle(color: Colors.white, fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
