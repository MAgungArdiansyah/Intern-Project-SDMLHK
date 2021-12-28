import 'package:flutter/material.dart';

class UserImage extends StatelessWidget {
  const UserImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      height: 450,
      width: 800,
      child: Image.asset(
        'assets/images/welecome.jpg',
        fit: BoxFit.fill,
      ),
    );
  }
}
