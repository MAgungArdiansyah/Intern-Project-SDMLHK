import 'package:flutter/material.dart';
import 'package:sdmlhkv7/models/user.dart';
import 'package:sdmlhkv7/services/auth/auth.dart';
import 'package:sdmlhkv7/services/database/database.dart';
import 'package:sdmlhkv7/views/home/home_view.dart';
import 'package:sdmlhkv7/views/ui_user/userHome.dart';
import 'package:sdmlhkv7/widgets/loading.dart';
import 'package:sdmlhkv7/widgets/popup.dart';


import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthServices _auth = AuthServices();
  DatabaseServices dbcon = DatabaseServices();
  final _checkemail = GlobalKey<FormState>();
  final _checkpass = GlobalKey<FormState>();
  final _checknip = GlobalKey<FormState>();
  final _checknama = GlobalKey<FormState>();
  final _checkuj = GlobalKey<FormState>();

  bool _isHidden = true;
  bool loading = false;

  String? uid;
  String email = '';
  String pass = '';
  String nip = '';
  String nama = '';
  String uj = '';
  String error = '';


  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthServices().user,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomeView();
          } else {
            return loading
                ? const Loading()
                : Scaffold(
                    backgroundColor: Colors.white,
                    body: Center(
                        child: Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 5, color: Color(0XFFBDBDBD)),
                          borderRadius: BorderRadius.circular(20)),
                      width: 500,
                      height: 800,
                      child: ListView(
                        children: [
                          Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.arrow_back_rounded))),
                          Image(
                            image: AssetImage('assets/images/logoklhk.png'),
                            width: 100,
                            height: 150,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                            child: Text(
                              'Selamat Datang',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 30),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
                            child: Text(
                              'Silahkan mendaftar untuk membuat akun anda',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 20),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 20, 50, 0),
                            width: 50,
                            child: Form(
                              key: _checknip,
                              child: TextFormField(
                                validator: (val) {
                                  dynamic valid = int.tryParse(val!) ?? 0;
                                  if (val.isEmpty) {
                                    return 'Silahkan masukan NIP anda';
                                  } else if (valid == 0) {
                                    return 'Pastikan anda memasukan NIP yang benar';
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (val) {
                                  setState(() => nip = val);
                                },
                                decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3,
                                            color: Colors.green.shade900)),
                                    labelText: 'NIP',
                                    labelStyle: TextStyle(
                                      color: Colors.grey,
                                    )),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 10, 50, 0),
                            child: Form(
                              key: _checknama,
                              child: TextFormField(
                                validator: (val) {
                                  dynamic valid = int.tryParse(val!) ?? 0;
                                  if (val.isEmpty) {
                                    return 'Silahkan masukan nama anda';
                                  } else if (valid != 0) {
                                    return 'Pastikan anda memasukan nama yang benar';
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (val) {
                                  setState(() => nama = val);
                                },
                                decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3,
                                            color: Colors.green.shade900)),
                                    labelText: 'Nama',
                                    labelStyle: TextStyle(
                                      color: Colors.grey,
                                    )),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 10, 50, 0),
                            child: Form(
                              key: _checkuj,
                              child: TextFormField(
                                validator: (val) => val!.isEmpty
                                    ? 'Silahkan masukan unit kerja anda'
                                    : null,
                                onChanged: (val) {
                                  setState(() => uj = val);
                                },
                                decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3,
                                            color: Colors.green.shade900)),
                                    labelText: 'Unit Kerja',
                                    labelStyle: TextStyle(
                                      color: Colors.grey,
                                    )),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 10, 50, 0),
                            child: Form(
                              key: _checkemail,
                              child: TextFormField(
                                validator: (val) => val!.isEmpty
                                    ? 'Silahkan masukan e-mail anda'
                                    : null,
                                onChanged: (val) {
                                  setState(() => email = val);
                                },
                                decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3,
                                            color: Colors.green.shade900)),
                                    labelText: 'E-mail',
                                    labelStyle: TextStyle(
                                      color: Colors.grey,
                                    )),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 10, 50, 0),
                            child: Form(
                              key: _checkpass,
                              child: TextFormField(
                                validator: (val) => val!.length < 6
                                    ? 'Password minimal 6 karakter'
                                    : null,
                                onChanged: (val) {
                                  setState(() => pass = val);
                                },
                                obscureText: _isHidden,
                                decoration: InputDecoration(
                                    suffix: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _isHidden = !_isHidden;
                                          });
                                        },
                                        icon: Icon(
                                          _isHidden
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: Colors.black,
                                        )),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3,
                                            color: Colors.green.shade900)),
                                    labelText: 'Password',
                                    labelStyle: TextStyle(
                                      color: Colors.grey,
                                    )),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 40, 50, 0),
                            height: 70,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.green[700]),
                              ),
                              onPressed: () async {
                                if (_checkpass.currentState!.validate() &&
                                    _checkemail.currentState!.validate() &&
                                    _checknip.currentState!.validate() &&
                                    _checknama.currentState!.validate() &&
                                    _checkuj.currentState!.validate()) {
                                  setState((){
                                    
                                    loading = true;
                                  });
                                  /*try {
                                    await Future.wait([
                                      _auth.register(email, pass),
                                      _dbCon.updateDataPegawai(int.parse(nip), nama, uj)
                                    ]);
                                  } catch (e) {
                                    setState(() {
                                      error =
                                          'Pastikan memasukan email dan password yang benar';
                                      loading = false;
                                    });
                                  }*/
                                  dynamic result =
                                      await _auth.register(email, pass);
                                  uid = result.uid;
                                 
                                  /*dynamic dbmake = await DatabaseServices()
                                      .updateUserData(uid,int.parse(nip), nama, uj);*/
                                  if (result == null) {
                                    setState(() {
                                      error =
                                          'Silahkan masukan e-mail dan password yang benar';
                                      loading = false;
                                    });
                                  }
                                  if (result != null) {
                                   
                                    return showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              title: Text(
                                                  'Pendaftaran Akun Berhasil'),
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    'Silahkan tekan OK lalu tunggu beberapa saat kemudian tekan kembali\nSekarang Anda bisa login'
                                                  ),
                                                ],
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () async {
                                                    await DatabaseServices().updateUserData(uid!, int.parse(nip), nama, uj).then((value) => Navigator.pop(context));
                                                    
                                                  },
                                                  child: const Text('OK',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color:
                                                              Colors.black54)),
                                                ),
                                              ],
                                            ));
                                  }
                                }
                              },
                              child: Center(
                                child: Text(
                                  'DAFTAR',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            padding: EdgeInsets.fromLTRB(20, 10, 50, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('Sudah mempunyai akun? Silahkan'),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (contex) =>
                                                  LoginPage()));
                                    },
                                    child: Text(
                                      'Login',
                                      style: TextStyle(color: Colors.green),
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              error,
                              style: TextStyle(color: Colors.red, fontSize: 14),
                            ),
                          )
                        ],
                      ),
                    )));
          }
        });
  }

  Future<void> newMethod(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Pendaftaran Akun Berhasil'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Silahkan Terkan OK'),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  child: const Text('OK',
                      style: TextStyle(fontSize: 18, color: Colors.black54)),
                ),
              ],
            ));
  }
}

/*
StreamBuilder(
        stream: AuthServices().user,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomeView();
          } else {
            return loading
                ? const Loading()
                : Scaffold(
                    backgroundColor: Colors.white,
                    body: Center(
                        child: Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 5, color: Color(0XFFBDBDBD)),
                          borderRadius: BorderRadius.circular(20)),
                      width: 500,
                      height: 800,
                      child: ListView(
                        children: [
                          Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.arrow_back_rounded))),
                          Image(
                            image: AssetImage('assets/images/logoklhk.png'),
                            width: 100,
                            height: 150,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                            child: Text(
                              'Selamat Datang',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 30),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
                            child: Text(
                              'Silahkan mendaftar untuk membuat akun anda',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 20),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 20, 50, 0),
                            width: 50,
                            child: Form(
                              key: _checknip,
                              child: TextFormField(
                                validator: (val) =>
                                    val!.isEmpty ? 'masukan NIP anda' : null,
                                onChanged: (val) {
                                  setState(() => nip = val);
                                },
                                decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3,
                                            color: Colors.green.shade900)),
                                    labelText: 'NIP',
                                    labelStyle: TextStyle(
                                      color: Colors.grey,
                                    )),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 10, 50, 0),
                            child: Form(
                              key: _checknama,
                              child: TextFormField(
                                validator: (val) =>
                                    val!.isEmpty ? 'masukan nama anda' : null,
                                onChanged: (val) {
                                  setState(() => nama = val);
                                },
                                decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3,
                                            color: Colors.green.shade900)),
                                    labelText: 'Nama',
                                    labelStyle: TextStyle(
                                      color: Colors.grey,
                                    )),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 10, 50, 0),
                            child: Form(
                              key: _checkuj,
                              child: TextFormField(
                                validator: (val) => val!.isEmpty
                                    ? 'masukan unit kerja anda'
                                    : null,
                                onChanged: (val) {
                                  setState(() => uj = val);
                                },
                                decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3,
                                            color: Colors.green.shade900)),
                                    labelText: 'Unit Kerja',
                                    labelStyle: TextStyle(
                                      color: Colors.grey,
                                    )),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 10, 50, 0),
                            child: Form(
                              key: _checkemail,
                              child: TextFormField(
                                validator: (val) =>
                                    val!.isEmpty ? 'Enter an email' : null,
                                onChanged: (val) {
                                  setState(() => email = val);
                                },
                                decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3,
                                            color: Colors.green.shade900)),
                                    labelText: 'E-mail',
                                    labelStyle: TextStyle(
                                      color: Colors.grey,
                                    )),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 10, 50, 0),
                            child: Form(
                              key: _checkpass,
                              child: TextFormField(
                                validator: (val) => val!.length < 6
                                    ? 'Password min 6 character'
                                    : null,
                                onChanged: (val) {
                                  setState(() => pass = val);
                                },
                                obscureText: _isHidden,
                                decoration: InputDecoration(
                                    suffix: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _isHidden = !_isHidden;
                                          });
                                        },
                                        icon: Icon(
                                          _isHidden
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.black,
                                        )),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3,
                                            color: Colors.green.shade900)),
                                    labelText: 'Password',
                                    labelStyle: TextStyle(
                                      color: Colors.grey,
                                    )),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 40, 50, 0),
                            height: 70,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.green[700]),
                              ),
                              onPressed: () async {
                                if (_checkpass.currentState!.validate() &&
                                    _checkemail.currentState!.validate() &&
                                    _checknip.currentState!.validate() &&
                                    _checknama.currentState!.validate() &&
                                    _checkuj.currentState!.validate()) {
                                  setState(() {
                                    loading = true;
                                  });
                                  dynamic result = await _auth.register(
                                      email, pass);
                                  if (result.uid == null) {
                                    setState(() {
                                      error =
                                          'please enter the valid emali and password';
                                      loading = false;
                                    });
                                  }
                                  if (result.uid != null) {
                                    return await showDialog(
                                        context: context,
                                        builder: (context) => const Popup(
                                            message:
                                                'Silahkan tekan OK untuk melanjutkan',
                                            namepop: 'Berhasil Mendaftar'));
                                  }
                                }
                              },
                              child: Center(
                                child: Text(
                                  'DAFTAR',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            padding: EdgeInsets.fromLTRB(20, 10, 50, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('Sudah mempunyai akun? Silahkan'),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (contex) =>
                                                  LoginPage()));
                                    },
                                    child: Text(
                                      'Login',
                                      style: TextStyle(color: Colors.green),
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              error,
                              style: TextStyle(color: Colors.red, fontSize: 14),
                            ),
                          )
                        ],
                      ),
                    )));
          }
        });

*/