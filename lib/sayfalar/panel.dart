import 'package:firebase_auth/firebase_auth.dart';
import 'package:jumbo_crm/sayfalar/devameden_projetipi.dart';
import 'package:jumbo_crm/sayfalar/gorusmeler.dart';
import 'package:jumbo_crm/sayfalar/hosting_sureleri.dart';
import 'package:jumbo_crm/sayfalar/hostinler.dart';
import 'package:jumbo_crm/sayfalar/onaylanan_projeler.dart';
import 'package:jumbo_crm/sayfalar/onaylanmayan_musteriler.dart.dart';
import 'package:jumbo_crm/sayfalar/onaylanmayan_projeler.dart';
import 'package:jumbo_crm/sayfalar/projebazli_demo.dart';
import 'package:jumbo_crm/sayfalar/projebazli_gorevler.dart';
import 'package:jumbo_crm/sayfalar/sektorbazli_demo.dart';
import 'package:jumbo_crm/sayfalar/tamamlanan_projetipi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jumbo_crm/widgetlar/widgetlar.dart';

//import 'login_sayfa.dart';

class Panel extends StatefulWidget {
  @override
  _PanelState createState() => _PanelState();
}

class _PanelState extends State<Panel> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      key: _scaffoldKey,
      //  backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        title: Text("Gösterge Paneli"),
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
      body: Center(
          child: Container(
        height: 125,
        width: 125,
        child: Center(child: Text("Dashboard")),
        color: Colors.pink,
      )),
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
