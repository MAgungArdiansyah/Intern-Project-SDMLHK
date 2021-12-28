import 'package:flutter/material.dart';
import 'package:sdmlhkv7/widgets/centered_view.dart';

import 'contentUser.dart';
import 'navBarUser.dart';
import 'userImage.dart';



class UserHome extends StatelessWidget {
  const UserHome({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CenteredView(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            NavbarUser(),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UserImage(),
                ContentUser()
              ],
            )),
          ],
        ),
      ),
    );
  }
}