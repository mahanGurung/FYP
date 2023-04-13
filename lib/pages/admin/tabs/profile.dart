import 'package:final_year_project/controllers/profile_controller.dart';
import 'package:final_year_project/models/merchant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:final_year_project/components/app_button.dart';
import 'package:final_year_project/pages/auth_checker.dart';
import 'package:final_year_project/services/auth_service.dart';

class Profile extends StatelessWidget {
  final bool isMerchant;
  Profile({super.key, this.isMerchant = false});
  // final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isMerchant ? Colors.amber : Colors.black,
        title: const Text("Profile"),
      ),
      body: Column(
        children: [
          const Center(
              child: Icon(
            Icons.person,
            size: 200,
          )),
          // Center(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       profileController.profileList
          //           .map((Merchant profile) => ProfileCard(profile))
          //           .single
          //     ],
          //   ),
          // ),
          AppButton(
            label: "Logout",
            onPressed: () {
              AuthService authService = AuthService();
              authService.removeToken();
              Get.to(const AuthChecker());
            },
          )
        ],
      ),
    );
  }

  Widget ProfileCard(Merchant profile) {
    return Container(
        height: 450,
        width: 250,
        color: Color.fromARGB(255, 221, 187, 187),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text("Namw ${profile.username}"),
            ],
          ),
        ));
  }
}
