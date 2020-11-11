import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jumbo_crm/sayfalar/Gruplar/demolar.dart';
import 'package:jumbo_crm/sayfalar/Gruplar/hostingler.dart';
import 'package:jumbo_crm/sayfalar/Gruplar/musteriler.dart';
import 'package:jumbo_crm/sayfalar/Gruplar/projeler.dart';
import 'package:jumbo_crm/sayfalar/anasayfa.dart';
import 'package:jumbo_crm/sayfalar/devameden_projetipi.dart';
import 'package:jumbo_crm/sayfalar/giris.dart';
import 'package:jumbo_crm/sayfalar/gorevler.dart';
import 'package:jumbo_crm/sayfalar/gorusmeler.dart';
import 'package:jumbo_crm/sayfalar/hosting_sureleri.dart';
import 'package:jumbo_crm/sayfalar/hostinler.dart';
import 'package:jumbo_crm/sayfalar/kayit.dart';
import 'package:jumbo_crm/sayfalar/kullanici_yonetimi.dart';
import 'package:jumbo_crm/sayfalar/onaylanan_musteriler.dart';
import 'package:jumbo_crm/sayfalar/onaylanan_projeler.dart';
import 'package:jumbo_crm/sayfalar/onaylanmayan_musteriler.dart.dart';
import 'package:jumbo_crm/sayfalar/onaylanmayan_projeler.dart';
import 'package:jumbo_crm/sayfalar/panel.dart';
import 'package:jumbo_crm/sayfalar/sektorbazli_demo.dart';
import 'package:jumbo_crm/sayfalar/sektorler.dart';
import 'package:jumbo_crm/sayfalar/tamamlanan_projetipi.dart';

import 'menu.dart';
import 'sayfalar/Gruplar/gorevler_drawer.dart';
import 'sayfalar/projebazli_demo.dart';
import 'sayfalar/projebazli_gorevler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Anasayfa(),
        '/uyeol': (context) => Kayit(),
        '/giris': (context) => Giris(),
        '/home': (context) => Home(),
        '/devameden_projetipi': (context) => DevamedenProjetipi(),
        '/gorevler': (context) => Gorevler(),
        '/gorusmeler': (context) => Gorusmeler(),
        '/hosting_sureleri': (context) => HostingSureleri(),
        '/hostingler': (context) => Hosting(),
        '/kullanici_yonetimi': (context) => KullaniciYonetimi(),
        '/onaylanan_musteriler': (context) => OnaylananMusteri(),
        '/onaylanan_projeler': (context) => OnaylananProjeler(),
        '/onaylanmayan_musteriler': (context) => OnaylanmayanMusteriler(),
        '/onaylanmayan_projeler': (context) => OnaylanmayanProjeler(),
        '/projebazli_demo': (context) => ProjeBazliDemo(),
        '/projebazli_gorevler': (context) => ProjeBazliGorevler(),
        '/sektorbazli_demo': (context) => SektorBazliDemo(),
        '/sektorler': (context) => Sektorler(),
        '/tamamlanan_projetipi': (context) => TamamlananProjeTipi(),
        '/hostingler_liste': (context) => Hostingler(),
        '/demolar_liste': (context) => Demolar(),
        '/musteri_liste': (context) => Musteriler(),
        '/projeler_liste': (context) => Projeler(),
        '/gorevler_liste': (context) => GorevlerDrawer(),
        '/panel': (context) => Panel(),






      },

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}