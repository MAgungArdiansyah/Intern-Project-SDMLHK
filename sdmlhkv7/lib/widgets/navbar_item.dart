import 'package:flutter/material.dart';

class NavbarItem extends StatelessWidget {
  final String title;
  const NavbarItem({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        title,
        style: TextStyle(fontSize: 18, color: Colors.black87),
      ),
    );
  }
}
