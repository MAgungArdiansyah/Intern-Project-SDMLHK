import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 250,
      child: Image.asset(
        'assets/images/logoklhk.png',
        fit: BoxFit.fill,
      ),
    );
  }
}
