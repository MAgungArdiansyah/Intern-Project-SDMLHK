import 'package:flutter/material.dart';
import 'package:sdmlhkv7/services/auth/auth.dart';
import 'package:sdmlhkv7/views/home/home_view.dart';
import 'package:sdmlhkv7/widgets/logo.dart';


import 'kontakUser.dart';
import 'upload.dart';
import 'userHome.dart';



class NavbarUser extends StatefulWidget {
  const NavbarUser({ Key? key }) : super(key: key);

  @override
  _NavbarUserState createState() => _NavbarUserState();
}

class _NavbarUserState extends State<NavbarUser> {
  final AuthServices _auth = AuthServices();

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
                    return UserHome();
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
                    return UploadBerkas();
                  }));
                },
                child: Text(
                  'Upload Berkas',
                  style: TextStyle(fontSize: 18, color: Colors.black54)
                ),
              ), 
              SizedBox(
                width: 50,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (contex) {
                    return KontakUser();
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
                onPressed: () async {
                  await _auth.signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeView()));
                },
                child: Text(
                  'Logout',
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



