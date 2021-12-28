import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sdmlhkv7/services/auth/auth.dart';
import 'package:sdmlhkv7/views/home/home_view.dart';
import 'package:sdmlhkv7/views/ui_user/userHome.dart';
import 'package:sdmlhkv7/widgets/loading.dart';

import 'register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthServices _auth = AuthServices();
  bool _ishidden = true;
  bool loading = false;
  final _checkemail = GlobalKey<FormState>();
  final _checkpass = GlobalKey<FormState>();

  String email = '';
  String pass = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthServices().user,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const UserHome();
        } else {
          return loading ? const Loading() : Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 5, color: Color(0XFFBDBDBD)),
              borderRadius: BorderRadius.circular(20)),
          width: 500,
          height: 800,
          child: ListView(
            children: [
              Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (contex) {
                          return HomeView();
                        }));
                      },
                      icon: const Icon(Icons.arrow_back_rounded))),
              const Image(
                image: AssetImage('assets/images/logoklhk.png'),
                width: 100,
                height: 150,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: const Text(
                  'Selamat Datang',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
                child: const Text(
                  'Silahkan login dengan akun anda',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 40, 50, 0),
                child: Form(
                  key: _checkemail,
                  child: TextFormField(
                    validator: (val) =>
                        val!.isEmpty ? 'Silahkan masukan e-mail' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.green.shade900)),
                        labelText: 'E-mail',
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                        )),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 40, 50, 0),
                child: Form(
                  key: _checkpass,
                  child: TextFormField(
                    validator: (val) =>
                        val!.length < 6 ? 'Min 6 karakter' : null,
                    onChanged: (val) {
                      setState(() => pass = val);
                    },
                    decoration: InputDecoration(
                        suffix: IconButton(
                            onPressed: () {
                              setState(() {
                                _ishidden = !_ishidden;
                              });
                            },
                            icon: Icon(
                              _ishidden
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.black,
                            )),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.green.shade900)),
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                        )),
                    obscureText: _ishidden,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 60, 50, 0),
                height: 100,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.green[700]),
                  ),
                  onPressed: () async {
                    if (_checkpass.currentState!.validate() &&
                        _checkemail.currentState!.validate()) {
                      setState(() {
                        loading = true;
                      });
                      dynamic result = await _auth.signEmPass(email, pass);
                      if (result == null) {
                        setState(() {
                          error = 'Email atau Password yang anda masukan salah';
                          loading = false;
                        });
                      }
                    }
                    
                  },
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(fontWeight: FontWeight.bold, height: 0.5),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(20, 40, 50, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Belum mempunyai akun? Silahkan'),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (contex) {
                            return RegisterPage();
                          }));
                        },
                        child: Text(
                          'Daftar',
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
      },
    );
  }
}
