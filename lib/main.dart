import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:market_application/screens/home_page.dart';
import 'package:market_application/screens/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FirebaseOptions firebaseOptions = const FirebaseOptions(
    appId: '187718564827',
    apiKey: 'Technomarket',
    projectId: 'technomarket-37ee6',
    messagingSenderId: 'project-187718564827',
  );

  await Firebase.initializeApp(options: firebaseOptions);
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TECHNOMARKET',
        initialRoute: '/',
        routes: {
          '/': (context) => LoginPage(),
          '/homepage': (context) => HomePage(),
        },
        debugShowCheckedModeBanner: false);
  }
}
