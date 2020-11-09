import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jumbo_crm/sayfalar/anasayfa.dart';
import 'package:jumbo_crm/sayfalar/giris.dart';
import 'package:jumbo_crm/sayfalar/kayit.dart';

import 'menu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/',
      routes: {
        '/': (context) => Anasayfa(),
        '/uyeol': (context) => Kayit(),
        '/giris': (context) => Giris(),
        '/home': (context) => Home(),
      },

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}