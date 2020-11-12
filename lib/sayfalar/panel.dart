import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jumbo_crm/widgetlar/widgetlar.dart';


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
      appBar: AppBar( iconTheme: new IconThemeData(color: Colors.blue
      ),
        elevation: 0,backgroundColor: Colors.blue.withOpacity(0),
        title: Center(child: Text("JumboSoft",style: TextStyle(color: Colors.black),)),
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
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                  child: Text(
                    "Hoş Geldin, ",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(25)),
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        "Duyuru",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Center(
                        child: Text(
                      "Tasarlarken hissetmelisiniz",
                      style: TextStyle(color: Colors.white),
                    )),
                    Center(
                        child: Text(
                      "Müşterinin işi beğenmediği önemli değil",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Text(
                        "Önemli olan, müvekkilinize gurur duyduğunuz bir çalışma vermenizdir",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    )),
                    Center(
                        child: Text(
                      "Yaptıklarınıza saygı duyun",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                    Center(
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(),
                        SizedBox(
                          width: 5,
                        ),
                        Column(
                          children: [
                            Text(
                              "İlker Tiryakioğlu",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                "09 Temmuz 2020 17:40",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            )
                          ],
                        )
                      ],
                    ))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: Container(
                color: Colors.lightGreenAccent.withOpacity(0.4),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "İstatistikler",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 8.0),
                      child: GridView.count(
                          crossAxisSpacing: 30,
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          mainAxisSpacing: 30,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  //border: Border.all(color: Colors.grey,width: 5),

                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.green.withOpacity(0.3),
                                        blurRadius: 0,
                                        spreadRadius: 0.9,
                                        offset: Offset(2, 9))
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  textBaseline: TextBaseline.ideographic,
                                  children: [
                                    Icon(
                                      Icons.check,
                                      color: Colors.blueAccent,
                                      size: 50,
                                    ),
                                    Text(
                                      "Bugün  Adet",
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    Text(
                                      "Tamamlanan Görev",
                                      style: TextStyle(fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  //border: Border.all(color: Colors.grey,width: 5),

                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.green.withOpacity(0.3),
                                        blurRadius: 0,
                                        spreadRadius: 0.9,
                                        offset: Offset(2, 9))
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  textBaseline: TextBaseline.ideographic,
                                  children: [
                                    Icon(
                                      Icons.person_pin,
                                      color: Colors.blueAccent,
                                      size: 50,
                                    ),
                                    Text(
                                      "Toplam",
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    Text(
                                      "Kalan Göreviniz Var",
                                      style: TextStyle(fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  //border: Border.all(color: Colors.grey,width: 5),

                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.green.withOpacity(0.3),
                                        blurRadius: 0,
                                        spreadRadius: 0.9,
                                        offset: Offset(2, 9))
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  textBaseline: TextBaseline.ideographic,
                                  children: [
                                    Icon(
                                      Icons.dangerous,
                                      color: Colors.blueAccent,
                                      size: 50,
                                    ),
                                    Text(
                                      "Toplam  Adet",
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    Text(
                                      "Devam Eden Görev",
                                      style: TextStyle(fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  //border: Border.all(color: Colors.grey,width: 5),

                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.green.withOpacity(0.3),
                                        blurRadius: 0,
                                        offset: Offset(1, 5))
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  textBaseline: TextBaseline.ideographic,
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: Colors.blueAccent,
                                      size: 50,
                                    ),
                                    Text(
                                      "Toplam  Adet",
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    Text(
                                      "Tamamlanan Proje",
                                      style: TextStyle(fontSize: 20),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ]),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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
