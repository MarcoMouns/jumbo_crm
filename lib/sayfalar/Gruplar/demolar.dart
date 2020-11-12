import 'package:firebase_auth/firebase_auth.dart';
import 'package:jumbo_crm/sayfalar/hosting_sureleri.dart';
import 'package:jumbo_crm/sayfalar/hostinler.dart';

import 'package:jumbo_crm/sayfalar/onaylanan_musteriler.dart';

import 'package:jumbo_crm/sayfalar/onaylanmayan_musteriler.dart.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jumbo_crm/sayfalar/projebazli_demo.dart';
import 'package:jumbo_crm/sayfalar/sektorbazli_demo.dart';
import 'package:jumbo_crm/widgetlar/widgetlar.dart';

// ignore: must_be_immutable
class Demolar extends StatefulWidget {
  //CardIslem({this.islemler}) : super();
  Islemler islemler;

  @override
  _DemolarState createState() => _DemolarState();
}

class _DemolarState extends State<Demolar> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      key: _scaffoldKey,
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        title: Text("Demolar"),
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
                Card(elevation: 25,shadowColor: Colors.red,
                  child: ListTile(trailing: Icon(Icons.arrow_right,size: 50,),
                    title: Text("Proje Bazlı Demo"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProjeBazliDemo()));
                    },
                  ),
                ),SizedBox(height: 20,),
                Card(elevation: 25,shadowColor: Colors.red,
                  child: ListTile(trailing: Icon(Icons.arrow_right,size: 50,),
                    title: Text("Sektör Bazlı Demo"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SektorBazliDemo()));
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
