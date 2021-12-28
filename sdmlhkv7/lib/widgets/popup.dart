import 'package:flutter/material.dart';
import 'package:sdmlhkv7/views/home/home_view.dart';

class Popup extends StatelessWidget {
  final String message;
  final String namepop;
  const Popup({ Key? key, required this.message, required this.namepop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
    title:  Text(namepop),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(message),
      ],
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeView()));
        },
        child: const Text(
          'OK',
          style: TextStyle(fontSize: 18, color: Colors.black54)
        ),
      ),
    ],
  );
  }
}