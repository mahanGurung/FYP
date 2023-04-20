import 'package:final_year_project/pages/auth_checker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalti/khalti.dart';
import 'controllers/authentication_contorler.dart';

// void main() {
//   runApp(GetMaterialApp(home: AuthChecker()));
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Khalti.init(
    publicKey: 'test_public_key_be535ed9b2cd4b7e98c1632cadafd962',
    enabledDebugging: false,
  );
  Get.put(AuthenticationController());
  runApp(const GetMaterialApp(
    home: AuthChecker(),
    debugShowCheckedModeBanner: false,
  ));
}
