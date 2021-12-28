import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sdmlhkv7/models/user.dart';
import 'package:sdmlhkv7/services/auth/auth.dart';
import 'package:sdmlhkv7/views/home/home_view.dart';
import 'package:sdmlhkv7/views/ui_user/upload.dart';
import 'package:sdmlhkv7/views/ui_user/userHome.dart';
import 'package:sdmlhkv7/wrapper.dart';


Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /*
    This StreamProvider is listening where the user sign in or out
    */
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeView(),
      );
  }
}

/*
StreamProvider<UserModels?>.value( 
      catchError: (_,__) => null,
      value: AuthServices().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeView(),
      ),
    );

*/