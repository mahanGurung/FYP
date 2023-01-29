import 'package:flutter/material.dart';

class Cardbutton extends StatelessWidget {
  final String lable;
  final Function onTap;
  const Cardbutton({super.key,  this.lable= "lable", required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>onTap(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              boxShadow: [
                BoxShadow()
              ],
            ),
            child:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text(lable, textAlign: TextAlign.center, style: const TextStyle(color: Colors.yellow),)),
            ),
          ),
        ),
      );
  }
}