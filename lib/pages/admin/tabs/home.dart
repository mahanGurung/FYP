import 'package:flutter/material.dart';
import 'package:final_year_project/components/card_button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Home"),
      ),
      body: Wrap(
        children: [
          Cardbutton(
            lable: "Add Merchant",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
