import 'package:flutter/material.dart';
import 'package:sdmlhkv7/widgets/centered_view.dart';


import 'package:url_launcher/url_launcher.dart';

import 'navBarUser.dart';

class KontakUser extends StatelessWidget {
  const KontakUser({Key? key}) : super(key: key);

  void launchWA({required number, required massage}) async{
    String url = 'https://wa.me/$number?text=$massage';

    await canLaunch(url) ? launch(url) : print('can\'t launch WA');
  }

  @override
  Widget build(BuildContext context) {
    return CenteredView(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            NavbarUser(),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 5, color: Color(0XFFBDBDBD)),
                      borderRadius: BorderRadius.circular(20)),
                  width: 500,
                  height: 600,
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 80,
                      ),
                      Container(
                        child: Icon(
                          Icons.person,
                          color: Colors.green.shade400,
                          size: 150,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                        child: Text(
                          '                 PURWANTO',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
                        child: Text(
                          '                          Admin Karyasiswa',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 20),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(20, 20, 50, 0),
                          child: Text(
                            'What\'sApp : 08521-635-6214',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          )),
                      Container(
                        padding: EdgeInsets.fromLTRB(15, 60, 15, 0),
                        child: ElevatedButton(
                          onPressed: () {
                            launchWA(number: "6285216356214", massage: 'Permisi, saya');
                          },
                          child: Text(
                            'Hubungi',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(10, 40),
                            primary: Colors.green.shade400
                          ),
                          ),
                        ),
                  
                    ],
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  height: 650,
                  width: 800,
                  child: Image.asset(
                    'assets/images/cs.png',
                    fit: BoxFit.fill,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
