import 'package:final_year_project/pages/admin/category_page.dart';
import 'package:final_year_project/pages/admin/edit_category_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:final_year_project/components/card_button.dart';
import 'package:final_year_project/pages/admin/add_merchant.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Home"),
      ),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            Cardbutton(
              onTap: () {
                Get.bottomSheet(const CategoryPage());
              },
              lable: "Add Category",
            ),
            Cardbutton(
              lable: "Add Merchant",
              onTap: () {
                Get.bottomSheet(AddMerchant());
              },
            ),
            Cardbutton(
              lable: "Edit Category",
              onTap: () {
                Get.bottomSheet(const EditCategoryPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
