import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:final_year_project/components/app_button.dart';

import '../controllers/authentication_contorler.dart';

class RegisterPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final loginController = Get.find<AuthenticationController>();
  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
              child: Text(
            "Register",
            style: TextStyle(fontSize: 24),
          )),
          const SizedBox(height: 20),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              hintText: "Enter your email",
              labelText: "Email",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              hintText: "Enter your Password",
              labelText: "Password",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          Obx(() => Container(
                child: loginController.loading.value
                    ? const CircularProgressIndicator()
                    : AppButton(
                        label: "Register",
                        width: Get.width,
                        onPressed: () {
                          loginController.register(
                              email: emailController.text,
                              password: passwordController.text);
                        },
                      ),
              )),
          const SizedBox(
            height: 20,
          ),
          const Text("ALREADY HAVE ACCOUNT?"),
          const SizedBox(
            height: 10,
          ),
          InkWell(
              onTap: () {
                Get.back();
              },
              child: const Text("LOGIN")),
        ],
      ),
    ));
  }
}
