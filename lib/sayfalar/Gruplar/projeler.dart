import 'package:firebase_auth/firebase_auth.dart';
import 'package:jumbo_crm/sayfalar/devameden_projetipi.dart';
import 'package:jumbo_crm/sayfalar/hosting_sureleri.dart';
import 'package:jumbo_crm/sayfalar/hostinler.dart';

import 'package:jumbo_crm/sayfalar/onaylanan_musteriler.dart';
import 'package:jumbo_crm/sayfalar/onaylanan_projeler.dart';

import 'package:jumbo_crm/sayfalar/onaylanmayan_musteriler.dart.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jumbo_crm/sayfalar/onaylanmayan_projeler.dart';
import 'package:jumbo_crm/sayfalar/tamamlanan_projetipi.dart';
import 'package:jumbo_crm/widgetlar/widgetlar.dart';

// ignore: must_be_immutable
class Projeler extends StatefulWidget {
  //CardIslem({this.islemler}) : super();
  Islemler islemler;

  @override
  _ProjelerState createState() => _ProjelerState();
}

class _ProjelerState extends State<Projeler> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      key: _scaffoldKey,
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        title: Text("Anasayfa"),
        actions: [
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Ayarlar', 'Hakkında', 'Çıkış'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Card(
                  child: ListTile(
                    title: Text("Onaylanan Müşteriler"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OnaylananProjeler()));
                    },
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text("Onaylanmayan Müşteriler"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OnaylanmayanProjeler()));
                    },
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text("Onaylanmayan Müşteriler"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TamamlananProjeTipi()));
                    },
                  ),
                ),
                Card(
                  child: ListTile(
                    title: Text("Onaylanmayan Müşteriler"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DevamedenProjetipi()));
                    },
                  ),
                )


              ],
            );
          }),
    );
  }

  void handleClick(String value) {
    switch (value) {
      case 'Ayarlar':
        {}
        break;
      case 'Hakkında':
        {}
        break;
      case 'Çıkış':
        {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Çıkış Yap"),
                  content: Text("Emin misiniz?"),
                  actions: [
                    FlatButton(
                      child: Text("Hayır"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    FlatButton(
                      child: Text("Evet"),
                      onPressed: () {
                        setState(() {
                          _auth.signOut();
                          print(_auth.currentUser.email);
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/', (Route<dynamic> route) => false);
                        });
                      },
                    )
                  ],
                );
              });
        }
        break;
    }
  }
}

class Islemler {
  final String title;
  final IconData icon;

  const Islemler({this.title, this.icon});
}

const List<Islemler> _islemler = const <Islemler>[
  const Islemler(
      title: 'Onaylanan Müşteriler', icon: Icons.add_circle_outline_outlined),
  const Islemler(title: 'Onaylanmayan Müşteriler', icon: Icons.eight_k_plus),
];

class CardIslem extends StatefulWidget {
  CardIslem({this.islemler}) : super();
  Islemler islemler;

  @override
  _CardIslemState createState() => _CardIslemState();
}

class _CardIslemState extends State<CardIslem> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          //  mainAxisSize: MainAxisSize.max,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              widget.islemler.icon,
              // size: 35,
            ),
            Text(
              widget.islemler.title,
            ),
          ],
        )
      ],
    );
  }
}
