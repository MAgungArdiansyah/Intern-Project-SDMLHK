import 'package:flutter/material.dart';
import 'package:sdmlhkv7/services/auth/auth.dart';
import 'package:sdmlhkv7/views/ui_user/upload.dart';




class ContentUser extends StatefulWidget {
  const ContentUser({Key? key}) : super(key: key);

  @override
  State<ContentUser> createState() => _ContentUserState();
}

class _ContentUserState extends State<ContentUser> {
  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 850,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'SISTEM PEMBERKASAN',
            style: TextStyle(
                fontWeight: FontWeight.w800, fontSize: 60, height: 0.9),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Program Karyasiswa Pusdiklat SDM LHK',
            style: TextStyle(
                fontWeight: FontWeight.w800, fontSize: 40, height: 1.2),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'PERHATIAN',
            style: TextStyle(fontSize: 32, height: 1.7, fontWeight: FontWeight.bold),
            textAlign: TextAlign.justify,
          ),
          Text(
            'Mohon kirimkan file berkas anda dengan format .PDF',
            style: TextStyle(fontSize: 24, height: 1.7, fontWeight: FontWeight.bold),
            textAlign: TextAlign.justify,
          ),
          Text(
            'Nama File : JudulBerkas.pdf \n'
            'Contoh      : Sistem Pemberkasan.pdf',
            style: TextStyle(fontSize: 21, height: 1.7),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green)),
              onPressed: () {
                
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (contex) {
                  return UploadBerkas();
                }));
              },
              child: Text(
                'Upload Berkas',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ))
        ],
      ),
    );
  }
}
