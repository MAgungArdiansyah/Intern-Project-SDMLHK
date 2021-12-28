import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sdmlhkv7/models/user.dart';
import 'package:sdmlhkv7/services/database/database.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create user obj to recive information such uid, email or pass
  UserModels? _userFromFirebaseUser(User user) {
    return user != null ? UserModels(uid: user.uid) : null;
  }

  /*UserModels? _userFromFirebaseUser(User user){
    return user != null ? UserModels(uid: user.uid) : null;
  }*/

  // auth change user stream, get notoification is user sign in or not
  Stream<UserModels?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user!));
  }

  // sign in anon
  Future signAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


  // register
  Future register(String email, String password) async {
    try {
      UserCredential? result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
      
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign In email & pass
  Future signEmPass(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      
      return _userFromFirebaseUser(user!);
    } catch (e) {
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  String get currentuid {
    return _auth.currentUser!.uid.toString();
  }

  // add data
  /*Future addDataPegawai(int nip, String nama, String unitkerja) async {
    return await DatabaseServices(id: UserModels().getuid).updateUserData(nip, nama, unitkerja); 
  }*/
}

