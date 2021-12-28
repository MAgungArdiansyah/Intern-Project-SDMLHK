import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sdmlhkv7/services/auth/auth.dart';
import 'package:sdmlhkv7/services/database/database.dart';
import 'package:sdmlhkv7/services/storage/storage.dart';
import 'package:sdmlhkv7/widgets/centered_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'navBarUser.dart';

class UploadBerkas extends StatefulWidget {
  const UploadBerkas({Key? key}) : super(key: key);

  @override
  _UploadBerkasState createState() => _UploadBerkasState();
}

class _UploadBerkasState extends State<UploadBerkas> {
  final AuthServices _auth = AuthServices();
  final _checkjudultesis = GlobalKey<FormState>();
  final _checktahuntesis = GlobalKey<FormState>();
  final _checkproditesis = GlobalKey<FormState>();
  final _checkunivtesis = GlobalKey<FormState>();
  final _checkjuduldisertasi = GlobalKey<FormState>();
  final _checktahundisertasi = GlobalKey<FormState>();
  final _checkprodidisertasi = GlobalKey<FormState>();
  final _checkunivdisertasi = GlobalKey<FormState>();
  final _checkjudulpolicy = GlobalKey<FormState>();
  final _checktahunpolicy = GlobalKey<FormState>();

  String judul = '';
  String tahun = '';
  String prodi = '';
  String universitas = '';
  String error = '';
  Uint8List? cekfileBytes;
  String? cekfilename;
  UploadTask? task;
  String? downloadlink;
  //double? _progress;
  String? notif;
  String? uid;
  String? destenationd;

  @override
  Widget build(BuildContext context) {
    //final filename = file != null ? (file!.path) : 'file kosong';

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
              // Tesis Upload Section+
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 5, color: Color(0XFFBDBDBD)),
                    borderRadius: BorderRadius.circular(20)),
                width: 550,
                height: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Container(
                      width: 355,
                      height: 150,
                      child: Image.asset(
                        'assets/images/tesis.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green)),
                        onPressed: () {
                          Alert(
                              context: context,
                              title: 'Upload Berkas Tesis',
                              content: Container(
                                width: 500,
                                height: 500,
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Form(
                                      key: _checkjudultesis,
                                      child: TextFormField(
                                        validator: (val) => val!.isEmpty
                                            ? 'Silahkan masukan judul tesis anda'
                                            : null,
                                        onChanged: (val) {
                                          setState(() => judul = val);
                                        },
                                        decoration: InputDecoration(
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 3,
                                                    color:
                                                        Colors.green.shade900)),
                                            labelText: 'Judul',
                                            labelStyle: TextStyle(
                                              color: Colors.grey,
                                            )),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Form(
                                      key: _checktahuntesis,
                                      child: TextFormField(
                                        validator: (val) {
                                          dynamic valid =
                                              int.tryParse(val!) ?? 0;
                                          if (val.isEmpty) {
                                            return 'Silahkan masukan tahun pembuatan tesis anda';
                                          } else if (valid == 0) {
                                            return 'Pastikan anda memasukan tahun yang benar';
                                          } else {
                                            return null;
                                          }
                                        },
                                        onChanged: (val) {
                                          setState(() {
                                            tahun = val;
                                          });
                                        },
                                        decoration: InputDecoration(
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 3,
                                                    color:
                                                        Colors.green.shade900)),
                                            labelText: 'Tahun',
                                            labelStyle: TextStyle(
                                              color: Colors.grey,
                                            )),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Form(
                                      key: _checkproditesis,
                                      child: TextFormField(
                                        validator: (val) {
                                          dynamic valid =
                                              int.tryParse(val!) ?? 0;
                                          if (val.isEmpty) {
                                            return 'Silahkan masukan prodi anda';
                                          } else if (valid != 0) {
                                            return 'Pastikan anda memasukan nama prodi dengan benar';
                                          } else {
                                            return null;
                                          }
                                        },
                                        onChanged: (val) => setState(() {
                                          prodi = val;
                                        }),
                                        decoration: InputDecoration(
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 3,
                                                    color:
                                                        Colors.green.shade900)),
                                            labelText: 'Prodi',
                                            labelStyle: TextStyle(
                                              color: Colors.grey,
                                            )),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Form(
                                      key: _checkunivtesis,
                                      child: TextFormField(
                                        validator: (val) {
                                          dynamic valid =
                                              int.tryParse(val!) ?? 0;
                                          if (val.isEmpty) {
                                            return 'Silahkan masukan prodi anda';
                                          } else if (valid != 0) {
                                            return 'Pastikan anda memasukan nama prodi dengan benar';
                                          } else {
                                            return null;
                                          }
                                        },
                                        onChanged: (val) {
                                          setState(() {
                                            universitas = val;
                                          });
                                        },
                                        decoration: InputDecoration(
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 3,
                                                    color:
                                                        Colors.green.shade900)),
                                            labelText: 'Universitas',
                                            labelStyle: TextStyle(
                                              color: Colors.grey,
                                            )),
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 60, 50, 0),
                                      width: 200,
                                      height: 100,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.green[700]),
                                        ),
                                        onPressed: () async {
                                          dynamic result = await selectfile();
                                        },
                                        child: const Text(
                                          'Pilih File',
                                          style: TextStyle(
                                              fontSize: 20, height: 1.0),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    //task != null ? Text('ini lho') : buildUploadStatus(task),
                                  ],
                                ),
                              ),
                              closeIcon: const Icon(
                                Icons.clear_sharp,
                                color: Colors.green,
                              ),
                              buttons: [
                                DialogButton(
                                  color: Colors.green,
                                  onPressed: () async {
                                    if (_checkjudultesis.currentState!.validate() &&
                                        _checktahuntesis.currentState!
                                            .validate() &&
                                        _checkproditesis.currentState!
                                            .validate() &&
                                        _checkunivtesis.currentState!
                                            .validate()) {
                                      Alert(
                                        context: context,
                                        type: AlertType.info,
                                        title:
                                            "File sedang di cek atau di upload",
                                        desc:
                                            'Proses ini akan memakan waktu, bila sudah akan muncul notifikasi. Silahkan klik OK untuk melanjutkan',
                                        buttons: [
                                          DialogButton(
                                            child: Text(
                                              "OK",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            width: 120,
                                          )
                                        ],
                                      ).show();
                                      await uploadfiletesis();
                                      if (notif != null) {
                                        print('sukses');
                                        Alert(
                                          context: context,
                                          type: AlertType.success,
                                          title: "File Berhasil Di Upload",
                                          desc: 'Silahkan klik OK lalu SAVE',
                                          buttons: [
                                            DialogButton(
                                              child: Text(
                                                "OK",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              width: 120,
                                            )
                                          ],
                                        ).show();
                                      } else {
                                        Alert(
                                          context: context,
                                          type: AlertType.error,
                                          title: "Gagal Upload",
                                          desc:
                                              "Pastikan anda sudah memilih file terlebih dahulu",
                                          buttons: [
                                            DialogButton(
                                              child: Text(
                                                "OK",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              width: 120,
                                            )
                                          ],
                                        ).show();
                                      }
                                    } else {
                                      Alert(
                                        context: context,
                                        type: AlertType.error,
                                        title: "Gagal Upload",
                                        desc:
                                            "Pastikan anda sudah mengisi form terlebih dahulu",
                                        buttons: [
                                          DialogButton(
                                            child: Text(
                                              "OK",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            width: 120,
                                          )
                                        ],
                                      ).show();
                                    }
                                  },
                                  child: Text(
                                    "UPLOAD",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                                DialogButton(
                                  onPressed: () async {
                                    if (_checkjudultesis.currentState!.validate() &&
                                        _checktahuntesis.currentState!
                                            .validate() &&
                                        _checkproditesis.currentState!
                                            .validate() &&
                                        _checkunivtesis.currentState!
                                            .validate() &&
                                        notif != null &&
                                        downloadlink != null) {
                                      uid = _auth.currentuid;
                                      await DatabaseServices()
                                          .updateUserTesis(
                                              uid!,
                                              judul,
                                              int.parse(tahun),
                                              prodi,
                                              universitas,
                                              downloadlink!)
                                          .whenComplete(
                                              () => Navigator.pop(context));
                                      print('berhasil berjalan sampai sini');
                                    } else {
                                      Alert(
                                        context: context,
                                        type: AlertType.error,
                                        title: "Gagal Upload",
                                        desc:
                                            "Pastikan anda sudah mengisi form dan mengupload file terlebih dahulu",
                                        buttons: [
                                          DialogButton(
                                            child: Text(
                                              "OK",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            width: 120,
                                          )
                                        ],
                                      ).show();
                                    }
                                  },
                                  child: Text(
                                    "SAVE",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                )
                              ]).show();
                        },
                        child: Text(
                          'Upload Tesis',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ))
                  ],
                ),
              ),
              //////////////////////////////////////////////////////////////////////////////////////////////////////
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 5, color: Color(0XFFBDBDBD)),
                    borderRadius: BorderRadius.circular(20)),
                width: 550,
                height: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Container(
                      width: 355,
                      height: 150,
                      child: Image.asset(
                        'assets/images/disertasi.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green)),
                        onPressed: () {
                          Alert(
                              context: context,
                              title: 'Upload Berkas Disertasi',
                              content: Container(
                                width: 500,
                                height: 500,
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Form(
                                      key: _checkjuduldisertasi,
                                      child: TextFormField(
                                        validator: (val) => val!.isEmpty
                                            ? 'Silahkan masukan judul disertasi anda'
                                            : null,
                                        onChanged: (val) {
                                          setState(() => judul = val);
                                        },
                                        decoration: InputDecoration(
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 3,
                                                    color:
                                                        Colors.green.shade900)),
                                            labelText: 'Judul',
                                            labelStyle: TextStyle(
                                              color: Colors.grey,
                                            )),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Form(
                                      key: _checktahundisertasi,
                                      child: TextFormField(
                                        validator: (val) {
                                          dynamic valid =
                                              int.tryParse(val!) ?? 0;
                                          if (val.isEmpty) {
                                            return 'Silahkan masukan tahun pembuatan tesis anda';
                                          } else if (valid == 0) {
                                            return 'Pastikan anda memasukan tahun yang benar';
                                          } else {
                                            return null;
                                          }
                                        },
                                        onChanged: (val) {
                                          setState(() {
                                            tahun = val;
                                          });
                                        },
                                        decoration: InputDecoration(
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 3,
                                                    color:
                                                        Colors.green.shade900)),
                                            labelText: 'Tahun',
                                            labelStyle: TextStyle(
                                              color: Colors.grey,
                                            )),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Form(
                                      key: _checkprodidisertasi,
                                      child: TextFormField(
                                        validator: (val) {
                                          dynamic valid =
                                              int.tryParse(val!) ?? 0;
                                          if (val.isEmpty) {
                                            return 'Silahkan masukan prodi anda';
                                          } else if (valid != 0) {
                                            return 'Pastikan anda memasukan nama prodi dengan benar';
                                          } else {
                                            return null;
                                          }
                                        },
                                        onChanged: (val) => setState(() {
                                          prodi = val;
                                        }),
                                        decoration: InputDecoration(
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 3,
                                                    color:
                                                        Colors.green.shade900)),
                                            labelText: 'Prodi',
                                            labelStyle: TextStyle(
                                              color: Colors.grey,
                                            )),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Form(
                                      key: _checkunivdisertasi,
                                      child: TextFormField(
                                        validator: (val) {
                                          dynamic valid =
                                              int.tryParse(val!) ?? 0;
                                          if (val.isEmpty) {
                                            return 'Silahkan masukan prodi anda';
                                          } else if (valid != 0) {
                                            return 'Pastikan anda memasukan nama prodi dengan benar';
                                          } else {
                                            return null;
                                          }
                                        },
                                        onChanged: (val) {
                                          setState(() {
                                            universitas = val;
                                          });
                                        },
                                        decoration: InputDecoration(
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 3,
                                                    color:
                                                        Colors.green.shade900)),
                                            labelText: 'Universitas',
                                            labelStyle: TextStyle(
                                              color: Colors.grey,
                                            )),
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 60, 50, 0),
                                      width: 200,
                                      height: 100,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.green[700]),
                                        ),
                                        onPressed: () async {
                                          dynamic result = await selectfile();
                                        },
                                        child: const Text(
                                          'Pilih File',
                                          style: TextStyle(
                                              fontSize: 20, height: 1.0),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    //task != null ? Text('ini lho') : buildUploadStatus(task),
                                  ],
                                ),
                              ),
                              closeIcon: const Icon(
                                Icons.clear_sharp,
                                color: Colors.green,
                              ),
                              buttons: [
                                DialogButton(
                                  color: Colors.green,
                                  onPressed: () async {
                                    /*Alert(
                                      context: context,
                                      type: AlertType.info,
                                      title:
                                          "File sedang di cek atau di upload",
                                      desc:
                                          'Proses ini akan memakan waktu, bila sudah akan muncul notifikasi. Silahkan klik OK untuk melanjutkan',
                                      buttons: [
                                        DialogButton(
                                          child: Text(
                                            "OK",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          width: 120,
                                        )
                                      ],
                                    ).show();*/
                                    if (_checkjuduldisertasi.currentState!.validate() &&
                                        _checktahundisertasi.currentState!
                                            .validate() &&
                                        _checkprodidisertasi.currentState!
                                            .validate() &&
                                        _checkunivdisertasi.currentState!
                                            .validate()) {
                                      Alert(
                                        context: context,
                                        type: AlertType.info,
                                        title:
                                            "File sedang di cek atau di upload",
                                        desc:
                                            'Proses ini akan memakan waktu, bila sudah akan muncul notifikasi. Silahkan klik OK untuk melanjutkan',
                                        buttons: [
                                          DialogButton(
                                            child: Text(
                                              "OK",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            width: 120,
                                          )
                                        ],
                                      ).show();
                                      await uploadfiledisertasi();
                                      if (notif != null) {
                                        print('sukses');
                                        Alert(
                                          context: context,
                                          type: AlertType.success,
                                          title: "File Berhasil Di Upload",
                                          desc: 'Silahkan klik OK lalu SAVE',
                                          buttons: [
                                            DialogButton(
                                              child: Text(
                                                "OK",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              width: 120,
                                            )
                                          ],
                                        ).show();
                                      } else {
                                        Alert(
                                          context: context,
                                          type: AlertType.error,
                                          title: "Gagal Upload",
                                          desc:
                                              "Pastikan anda sudah memilih file terlebih dahulu",
                                          buttons: [
                                            DialogButton(
                                              child: Text(
                                                "OK",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              width: 120,
                                            )
                                          ],
                                        ).show();
                                      }
                                    } else {
                                      Alert(
                                        context: context,
                                        type: AlertType.error,
                                        title: "Gagal Upload",
                                        desc:
                                            "Pastikan anda sudah mengisi form terlebih dahulu",
                                        buttons: [
                                          DialogButton(
                                            child: Text(
                                              "OK",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            width: 120,
                                          )
                                        ],
                                      ).show();
                                    }
                                    //await uploadfiledisertasi();
                                    /*if (notif != null) {
                                      print('sukses');
                                      Alert(
                                        context: context,
                                        type: AlertType.success,
                                        title: "File Berhasil Di Upload",
                                        desc: 'Silahkan klik OK lalu SAVE',
                                        buttons: [
                                          DialogButton(
                                            child: Text(
                                              "OK",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            width: 120,
                                          )
                                        ],
                                      ).show();
                                    } else {
                                      Alert(
                                        context: context,
                                        type: AlertType.error,
                                        title: "Gagal Upload",
                                        desc:
                                            "Pastikan anda sudah memilih file terlebih dahulu",
                                        buttons: [
                                          DialogButton(
                                            child: Text(
                                              "OK",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            width: 120,
                                          )
                                        ],
                                      ).show();
                                    }*/
                                  },
                                  child: Text(
                                    "UPLOAD",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                                DialogButton(
                                  onPressed: () async {
                                    if (_checkjuduldisertasi.currentState!.validate() &&
                                        _checktahundisertasi.currentState!
                                            .validate() &&
                                        _checkprodidisertasi.currentState!
                                            .validate() &&
                                        _checkunivdisertasi.currentState!
                                            .validate() &&
                                        notif != null &&
                                        downloadlink != null) {
                                      uid = _auth.currentuid;
                                      await DatabaseServices()
                                          .updateUserDisertasi(
                                              uid!,
                                              judul,
                                              int.parse(tahun),
                                              prodi,
                                              universitas,
                                              downloadlink!)
                                          .whenComplete(
                                              () => Navigator.pop(context))
                                          .then((value) {
                                        cekfilename = null;
                                        cekfileBytes = null;
                                        notif = null;
                                        downloadlink = null;
                                        destenationd = null;
                                      });
                                      print(cekfileBytes);
                                      print(cekfilename);
                                      print(notif);
                                      print(downloadlink);
                                      print('berhasil berjalan sampai sini');
                                    } else {
                                      Alert(
                                        context: context,
                                        type: AlertType.error,
                                        title: "Gagal Upload",
                                        desc:
                                            "Pastikan anda sudah mengisi form dan mengupload file terlebih dahulu",
                                        buttons: [
                                          DialogButton(
                                            child: Text(
                                              "OK",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            width: 120,
                                          )
                                        ],
                                      ).show();
                                    }
                                  },
                                  child: Text(
                                    "SAVE",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                )
                              ]).show();
                        },
                        child: Text(
                          'Upload Disertasi',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ))
                  ],
                  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 5, color: Color(0XFFBDBDBD)),
                    borderRadius: BorderRadius.circular(20)),
                width: 550,
                height: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Container(
                      width: 355,
                      height: 150,
                      child: Image.asset(
                        'assets/images/policy brief2.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green)),
                        onPressed: () {
                          Alert(
                              context: context,
                              title: 'Upload Berkas Policy Brief',
                              content: Container(
                                width: 500,
                                height: 500,
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Form(
                                      key: _checkjudulpolicy,
                                      child: TextFormField(
                                        validator: (val) => val!.isEmpty
                                            ? 'Silahkan masukan judul policy brief anda'
                                            : null,
                                        onChanged: (val) {
                                          setState(() => judul = val);
                                        },
                                        decoration: InputDecoration(
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 3,
                                                    color:
                                                        Colors.green.shade900)),
                                            labelText: 'Judul',
                                            labelStyle: TextStyle(
                                              color: Colors.grey,
                                            )),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Form(
                                      key: _checktahunpolicy,
                                      child: TextFormField(
                                        validator: (val) {
                                          dynamic valid =
                                              int.tryParse(val!) ?? 0;
                                          if (val.isEmpty) {
                                            return 'Silahkan masukan tahun pembuatan policy brief anda';
                                          } else if (valid == 0) {
                                            return 'Pastikan anda memasukan tahun yang benar';
                                          } else {
                                            return null;
                                          }
                                        },
                                        onChanged: (val) {
                                          setState(() {
                                            tahun = val;
                                          });
                                        },
                                        decoration: InputDecoration(
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 3,
                                                    color:
                                                        Colors.green.shade900)),
                                            labelText: 'Tahun',
                                            labelStyle: TextStyle(
                                              color: Colors.grey,
                                            )),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 60, 50, 0),
                                      width: 200,
                                      height: 100,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.green[700]),
                                        ),
                                        onPressed: () async {
                                          dynamic result = await selectfile();
                                        },
                                        child: const Text(
                                          'Pilih File',
                                          style: TextStyle(
                                              fontSize: 20, height: 1.0),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    //task != null ? Text('ini lho') : buildUploadStatus(task),
                                  ],
                                ),
                              ),
                              closeIcon: const Icon(
                                Icons.clear_sharp,
                                color: Colors.green,
                              ),
                              buttons: [
                                DialogButton(
                                  color: Colors.green,
                                  onPressed: () async {
                                     if (_checkjudulpolicy.currentState!.validate() &&
                                        _checktahunpolicy.currentState!
                                            .validate()) {
                                      Alert(
                                        context: context,
                                        type: AlertType.info,
                                        title:
                                            "File sedang di cek atau di upload",
                                        desc:
                                            'Proses ini akan memakan waktu, bila sudah akan muncul notifikasi. Silahkan klik OK untuk melanjutkan',
                                        buttons: [
                                          DialogButton(
                                            child: Text(
                                              "OK",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            width: 120,
                                          )
                                        ],
                                      ).show();
                                      await uploadfilepolicy();
                                      if (notif != null) {
                                        print('sukses');
                                        Alert(
                                          context: context,
                                          type: AlertType.success,
                                          title: "File Berhasil Di Upload",
                                          desc: 'Silahkan klik OK lalu SAVE',
                                          buttons: [
                                            DialogButton(
                                              child: Text(
                                                "OK",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              width: 120,
                                            )
                                          ],
                                        ).show();
                                      } else {
                                        Alert(
                                          context: context,
                                          type: AlertType.error,
                                          title: "Gagal Upload",
                                          desc:
                                              "Pastikan anda sudah memilih file terlebih dahulu",
                                          buttons: [
                                            DialogButton(
                                              child: Text(
                                                "OK",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              width: 120,
                                            )
                                          ],
                                        ).show();
                                      }
                                    } else {
                                      Alert(
                                        context: context,
                                        type: AlertType.error,
                                        title: "Gagal Upload",
                                        desc:
                                            "Pastikan anda sudah mengisi form terlebih dahulu",
                                        buttons: [
                                          DialogButton(
                                            child: Text(
                                              "OK",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            width: 120,
                                          )
                                        ],
                                      ).show();
                                    }
                                    
                                  },
                                  child: Text(
                                    "UPLOAD",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                                DialogButton(
                                  onPressed: () async {
                                    if (_checkjudulpolicy.currentState!.validate() &&
                                        _checktahunpolicy.currentState!
                                            .validate() &&
                                        notif != null &&
                                        downloadlink != null) {
                                      uid = _auth.currentuid;
                                      await DatabaseServices()
                                          .updateUserPolicy(uid!, judul,
                                              int.parse(tahun), downloadlink!)
                                          .whenComplete(
                                              () => Navigator.pop(context));
                                      print('berhasil berjalan sampai sini');
                                    } else {
                                      Alert(
                                        context: context,
                                        type: AlertType.error,
                                        title: "Gagal Upload",
                                        desc:
                                            "Pastikan anda sudah mengisi form dan mengupload file terlebih dahulu",
                                        buttons: [
                                          DialogButton(
                                            child: Text(
                                              "OK",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            width: 120,
                                          )
                                        ],
                                      ).show();
                                    }
                                  },
                                  child: Text(
                                    "SAVE",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                )
                              ]).show();
                        },
                        child: Text(
                          'Upload Policy Brief',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ))
                  ],
                ),
              ),
            ],
          )),
        ],
      ),
    ));
  }

  Future selectfile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['pdf']);

    if (result?.files.first != null) {
      var fileBytes = result?.files.first.bytes;
      var filename = result?.files.first.name;

      cekfileBytes = fileBytes;
      cekfilename = filename;

      // upload file
      //await _storage.ref('uploads/$filename').putData(fileBytes!);
    } else {
      return null;
    }
  }

  Future uploadfiletesis() async {
    if (cekfilename == null) return;

    String uid = _auth.currentuid;

    final destinationD = 'Tesis/$uid/$cekfilename';

    task = FirebaseSto.uploadfile(destinationD, cekfileBytes);
    setState(() {});

    if (task == null) return;

    final snapshoot = await task!.whenComplete(() {
      return notif = 'Upload Berhasil';
    });
    final urlDownload = await snapshoot.ref.getDownloadURL();
    downloadlink = urlDownload;
  }

  Future uploadfiledisertasi() async {
    if (cekfilename == null) return;

    String uid = _auth.currentuid;

    destenationd = 'Disertasi/$uid/$cekfilename';

    task = FirebaseSto.uploadfile(destenationd!, cekfileBytes);
    setState(() {});

    if (task == null) return;

    final snapshoot = await task!.whenComplete(() {
      return notif = 'Upload Berhasil';
    });
    final urlDownload = await snapshoot.ref.getDownloadURL();
    downloadlink = urlDownload;
  }

  Future uploadfilepolicy() async {
    if (cekfilename == null) return;

    String uid = _auth.currentuid;

    final destination = 'PolicyBrief/$uid/$cekfilename';

    task = FirebaseSto.uploadfile(destination, cekfileBytes);
    setState(() {});

    if (task == null) return;

    final snapshoot = await task!.whenComplete(() {
      return notif = 'Upload Berhasil';
    });
    final urlDownload = await snapshoot.ref.getDownloadURL();
    downloadlink = urlDownload;
  }

  /*Widget buildUploadStatus(UploadTask? task) {
    return StreamBuilder<TaskSnapshot>(
      stream: task?.snapshotEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print('berhasil');
          final snap = snapshot.data!;
          final progress = snap.bytesTransferred / snap.totalBytes;
          
          return Text(
            '$progress',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          );

        }else {
          print('gagal');
          return Container();
        }
      }
    );
  }*/

  /*Widget buildUploadStatus() {
    task!.snapshotEvents.listen((event) {
      setState(() {
        _progress =
            event.bytesTransferred.toDouble() / event.totalBytes.toDouble();
        print(_progress.toString());
      });
      if (event.state == TaskState.success) {
        _progress = null;
      }
    }).onError((error) {
      return null;
    });

    return Text((_progress! * 100).toStringAsFixed(2));
  }*/

  /*_openPopup(context) {
    Alert(
        context: context,
        title: 'Upload Berkas Tesis',
        content: Container(
          width: 800,
          height: 500,
          child: Column(
            children: const <Widget>[
              Form(
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_circle),
                    labelText: 'Username',
                  ),
                ),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  labelText: 'Password',
                ),
              ),
            ],
          ),
        ),
        closeIcon: const Icon(
          Icons.arrow_back,
          color: Colors.green,
        ),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "UPLOAD",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          DialogButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "SAVE",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

  Center alternative() {
    return Center(
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 5, color: Color(0XFFBDBDBD)),
                borderRadius: BorderRadius.circular(20)),
            width: 900,
            height: 600,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 40, 50, 0),
                      child: Form(
                        key: _checkjudultesis,
                        child: TextFormField(
                          validator: (val) => val!.isEmpty
                              ? 'Silahkan masukan judul tesis anda'
                              : null,
                          onChanged: (val) {
                            setState(() => judul = val);
                          },
                          decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 3, color: Colors.green.shade900)),
                              labelText: 'Judul Tesis',
                              labelStyle: const TextStyle(
                                color: Colors.grey,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
                Text('Upload Side')
              ],
            )));
  }*/

}
