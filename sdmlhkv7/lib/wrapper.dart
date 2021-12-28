import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sdmlhkv7/models/user.dart';
import 'package:sdmlhkv7/views/home/home_view.dart';
import 'package:sdmlhkv7/views/login_register/register.dart';
import 'package:sdmlhkv7/views/ui_user/userHome.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // recive / access data from user from provider
    final user = Provider.of<UserModels?>(context);
    if (user == null) {
      return const HomeView();
    } else {
      return const UserHome();
    }
  }
}