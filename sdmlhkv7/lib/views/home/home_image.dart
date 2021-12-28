import 'package:flutter/material.dart';

class HomeImage extends StatelessWidget {
  const HomeImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      height: 650,
      width: 800,
      child: Image.asset(
        'assets/images/di.jpg',
        fit: BoxFit.fill,
      ),
    );
  }
}
