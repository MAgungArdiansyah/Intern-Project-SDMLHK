import 'package:flutter/material.dart';
import 'package:sdmlhkv7/views/login_register/register.dart';




class ContentDetails extends StatelessWidget {
  const ContentDetails({Key? key}) : super(key: key);

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
            height: 30,
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
            'Aplikasi ini akan membantu anda mengupload berkas - berkas yang diperlukan untuk keperluan Seminar Program Beasiswa Karyasiswa Pusdiklat SDM LHK. Silahkan login terlebih dahulu sebelum anda menguoload berkas yang dibutuhkan, bila belum memiliki akun silahkan mendaftar terlebih dahulu.',
            style: TextStyle(fontSize: 21, height: 1.7),
            textAlign: TextAlign.justify,
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (contex) {
                  return RegisterPage();
                }));
              },
              child: Text(
                'DAFTAR',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ))
        ],
      ),
    );
  }
}
