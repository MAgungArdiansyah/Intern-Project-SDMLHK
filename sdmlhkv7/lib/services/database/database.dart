import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

/*class DBCon {
  final FirebaseAuth _authDB = FirebaseAuth.instance;

  DatabaseServices? userFromFire (User? user){
    return user != null ? DatabaseServices(id: user.uid) : null;
  }

  Stream<DatabaseServices?> get currentUser {
    return _authDB.authStateChanges().
      map((User? user) => userFromFire(user));
  }

  // add DataPegawai
  Future updateDataPegawai(int nip, String nama, String unitkerja) async {
    return DatabaseServices().updateUserData(nip, nama, unitkerja);
  }
  
}*/

class DatabaseServices {

  // colection reference
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('berkas');
  
  // Create document and locked at user.uid
  // berkas collection
  Future updateUserData(String id,int nip, String nama, String unitkerja) async {
    return await userCollection.doc(id).set(
      {
        'nip' : nip,
        'nama' : nama,
        'unitkerja' : unitkerja
      }
    ).then((value) => print('user add')).catchError((error) => print('Failed to add user $error'));

  }

  // tesis collection
  Future updateUserTesis(String id, String judul, int tahun, String prodi, String universitas, String url) async {
    return await userCollection.doc(id).collection('tesis').doc(id).set(
      {
        'judul' : judul,
        'tahun' : tahun,
        'prodi' : prodi,
        'universitas' : universitas,
        'url file' : url
      }
    );
  }
  Future updateUserDisertasi(String id, String judul, int tahun, String prodi, String universitas, String url) async {
    return await userCollection.doc(id).collection('disertasi').doc(id).set(
      {
        'judul' : judul,
        'tahun' : tahun,
        'prodi' : prodi,
        'universitas' : universitas,
        'url file' : url
      }
    );
  }
  Future updateUserPolicy(String id, String judul, int tahun, String url) async {
    return await userCollection.doc(id).collection('policybrief').doc(id).set(
      {
        'judul' : judul,
        'tahun' : tahun,
        'url file' : url
      }
    );
  }

  /*
  // disertasi collection
  Future updateUserDisertasi(String judul, int tahun, String universitas) async {
    return await userCollection.doc(uid).collection('disertasi').doc().set(
      {
        'judul' : judul,
        'tahun' : tahun,
        'universitas' : universitas
      }
    );
  }

  // policy brief collection
  Future updateUserPolicy(String judul, int tahun) async {
    return await userCollection.doc(uid).collection('policy_brief').doc().set(
      {
        'judul' : judul,
        'tahun' : tahun,
      }
    );
  }*/
}