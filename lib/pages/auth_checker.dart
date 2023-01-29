import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:final_year_project/pages/admin/admin_home.dart';
import 'package:final_year_project/pages/merchant/merchant_home.dart';
import 'package:final_year_project/pages/login_page.dart';
import 'package:final_year_project/pages/user/home_page.dart';
import 'package:final_year_project/services/auth_service.dart';

import 'login_page.dart';

class AuthChecker extends StatefulWidget {
  const AuthChecker({super.key});

  @override
  State<AuthChecker> createState() => _AuthCheckerState();
}

class _AuthCheckerState extends State<AuthChecker> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkIfLoggedIn();
  }

  checkIfLoggedIn() async {
    AuthService authService = AuthService();
    var token = await authService.getToken();

    if (token != null) {
      var role = await authService.getRole();

      switch (role) {
        case 'merchant':
          Get.offAll(() => const MerchantHome());
          break;
        case 'admin':
          Get.offAll(() => const AdminHome());
          break;
        default:
          Get.offAll(() => HomePage());
      }
    } else {
      Get.offAll(LoginPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: CircularProgressIndicator(
        color: Colors.black,
      )),
    );
  }
}
