import 'package:flutter/material.dart';


class UploadDetail extends StatefulWidget {
  const UploadDetail({Key? key}) : super(key: key);

  @override
  _UploadDetailState createState() => _UploadDetailState();
}

class _UploadDetailState extends State<UploadDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 5, color: Color(0XFFBDBDBD)),
                borderRadius: BorderRadius.circular(20),
              ),
              width: 1000,
              height: 800,
              
            ),
          ),
    );
  }
}
