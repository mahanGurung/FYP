import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Color buttonColor;
  final Function? onPressed;
  final double height;
  final String label;
  final double width;
  const AppButton(
      {super.key,
      this.buttonColor = Colors.red,
      this.onPressed,
      this.height = 50,
      this.width = 100,
      this.label = "Click Me"});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed!(),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: const BorderRadius.all(Radius.circular(100))),
        child: Center(
            child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 24),
        )),
      ),
    );
  }
}
