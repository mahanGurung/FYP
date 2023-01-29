import 'package:flutter/material.dart';

class UserComponent extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String trailing;
  const UserComponent(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.trailing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        color: Color.fromARGB(255, 231, 229, 229),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Container(
              child: Image.network(image),
            ),
            title: Text(title),
            subtitle: Text(subtitle),
            trailing: Text(trailing),
          ),
        ),
      ),
    );
  }
}
