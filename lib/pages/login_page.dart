import 'package:flutter/material.dart';
import 'package:flutter/get.dart';
import 'package:final_year_project/components/app_button.dart';
import 'package:final_year_project/controllers/login_page_controller.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final loginController = Get.put(LoginController());
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Center(
              child: Text(
            "Login",
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
          AppButton(
            width: Get.width,
            onPressed: () {
              var data = {
                'email': emailController.text,
                'password': passwordController.text
              };
              print(data);
            },
          )
        ]),
      ),
    );
  }
}
