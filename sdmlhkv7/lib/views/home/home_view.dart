import 'package:flutter/material.dart';
import 'package:sdmlhkv7/widgets/centered_view.dart';
import 'package:sdmlhkv7/widgets/navigation_bar.dart';

import 'content_details.dart';
import 'home_image.dart';




class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CenteredView(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            NavBar(),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [ContentDetails(), HomeImage()],
            )),
          ],
        ),
      ),
    );
  }
}
