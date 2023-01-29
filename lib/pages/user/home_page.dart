import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:final_year_project/pages/auth_checker.dart';
import 'package:final_year_project/services/auth_service.dart';

class HomePage extends StatelessWidget {
  AuthService authService = AuthService();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: const Text("My chats"),
        actions: [
          IconButton(
              onPressed: () async {
                await authService.removeToken();
                Get.to(const AuthChecker());
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
    );
  }
}
