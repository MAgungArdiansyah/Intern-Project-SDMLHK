import 'package:flutter/material.dart';
import 'package:sdmlhkv7/views/home/home_view.dart';
import 'package:sdmlhkv7/views/kontak/kontak.dart';
import 'package:sdmlhkv7/views/login_register/login.dart';


import 'logo.dart';



class NavBar extends StatefulWidget {
  const NavBar({ Key? key }) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Logo(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (contex) {
                    return HomeView();
                  }));
                },
                child: Text(
                  'Beranda',
                  style: TextStyle(fontSize: 18, color: Colors.black54)
                ),
              ),
              SizedBox(
                width: 50,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (contex) {
                    return Kontak();
                  }));
                },
                child: Text(
                  'Kontak',
                  style: TextStyle(fontSize: 18, color: Colors.black54)
                ),
              ),
               SizedBox(
                width: 80,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (contex) {
                    return LoginPage();
                  }));
                },
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 18, color: Colors.black54)
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
