import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:jumbo_crm/constants/api_constants.dart';
import 'package:jumbo_crm/model/data_gorevler.dart';
import 'package:jumbo_crm/model/data_kullanici_yonetimi.dart';
import 'package:jumbo_crm/model/data_projebazli_demo.dart';
import 'package:jumbo_crm/model/data_tamamlanan_projetipi.dart';
import 'package:jumbo_crm/services/service_gorevler.dart';
import 'package:jumbo_crm/services/service_kullanici_yonetimi.dart';
import 'package:jumbo_crm/services/service_projebazli_demo.dart';
import 'package:flutter/material.dart';
import 'package:jumbo_crm/services/service_tamamlanan_projetipi.dart';

class KullaniciYonetimi extends StatefulWidget {
  KullaniciYonetimi({Key key}) : super(key: key);

  @override
  _KullaniciYonetimiState createState() => _KullaniciYonetimiState();
}

class _KullaniciYonetimiState extends State<KullaniciYonetimi> {
  //ServiceKullaniciYonetimi apiManager = ServiceKullaniciYonetimi();
  Future<DataModelKullaniciYonetimi> _future;

  fetchData() async {
    final http.Response response = await http.get(
        Uri.encodeFull(ApiConstants.KULLANICIYONETIMI),
        headers: {"Authorization": "Bearer ${ApiConstants.TOKEN_VALUE}"});

    if (response.statusCode == 200) {
      var _jsonResponse = json.decode(response.body);
      return _jsonResponse;
    } else {
      throw Exception("istek durumu başarısız${response.statusCode}");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
    // _future = apiManager.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        appBar: AppBar(
          title: Text("Kullanıcı Yönetimi"),
        ),
        body: SingleChildScrollView(scrollDirection: Axis.vertical,
          child: FutureBuilder(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 8,
                      // shrinkWrap: true,
                      itemBuilder: (context, index) {
                    String a ="http://";
                        final _link = a + snapshot.data[index]["profil"].toString();
                        print("${a}");
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.redAccent, width: 5)),
                              child: ExpansionTile(
                                  title: Column(
                                    children: [
                                      Text(
                                        snapshot.data[index]["name"] ?? "null",
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      Divider(
                                        height: 20,
                                        color: Colors.black,
                                      )
                                    ],
                                  ),
                                  children: [
                              Column(children: [
                              Row(
                              children: [
                                  Text("Kullanıcı Adı: "),
                              Text(snapshot.data[index]["username"] ??
                                  "null")
                              ],
                            ),
                            Divider(),
                            Row(
                              children: [
                                Text("Telefon: "),
                                Text(snapshot.data[index]["telefon"] ??
                                    "null")
                              ],
                            ),
                            Divider(),
                            Row(
                              children: [
                                Text("Mail: "),
                                Text(snapshot.data[index]["email"] ??
                                    "null")
                              ],
                            ),
                            Divider(),
                            Row(
                              children: [
                                Text("Doğum Tarihi: "),
                                Text(snapshot.data[index]["dogumtarihi"] ??
                                    "null")
                              ],
                            ),
                            Divider(),
                            Row(
                              children: [
                                Text("Başlangıç Tarihi: "),
                                Text(snapshot.data[index]["baslangictarihi"] ??
                                    "null")
                              ],
                            ),
                            Divider(),
                            Row(
                              children: [
                                Text("Adres: "),
                                Expanded(
                                  child: Text(snapshot.data[index]["adres"] ??
                                      "null", maxLines: 3,
                                  ),
                                )
                              ],
                            ),
                            Divider(),
                            Row(
                                children: [
                                  Text("fotoğraf: "),
                                  Expanded(
                                    child: CircleAvatar(
                                        backgroundImage: (snapshot
                                            .data[index]["profil"] == null)
                                            ? AssetImage(
                                            'assets/images/avatar.png')
                                            : NetworkImage(snapshot
                                            .data[index]["profil"])
                                    ))
                                    ],
                                  ),

                                ])
                            ]),

                        //  title: Text(snapshot.data[index]["name"]?? ""),
                        )
                        ,
                        );
                      });
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ));
  }
}
/*

  {
        "id": "3",
        "ApiToken": "YKvEeSSKnxHCg7ErYZ1g4gl6JU20v7Os59nwYdifpRbNWr3uYnyLxjWzkFgq",
        "profil": "adminassets/media/users/ilker-tiryakioglu.jpg",
        "username": "ilker",
        "name": "Ilker Tiryakioğlu",
        "email": "info@essentebilisim.com",
        "telefon": "02623224112",
        "dogumtarihi": "07/19/1986",
        "adres": "Sanayi Mah. D-130 Karayolu Cad. No:117 (Kocaeli Tv Yanı)",
        "baslangictarihi": "10/09/2009",
        "Departman": "1",
        "Mood": "4",
        "password": "$2y$10$aU3GHXhWqNUrKMRwmUqIYuPq4qSxhzhabqLoCjLEH0v/VvjcBj/D.",
        "remember_token": "T1vXatMOx3g6p2JWoAncZJFV6jk4oLMxZ95sxpBCI2RO0MNLmb7AZUxYoav8",
        "LastLog": "2020-11-10 13:31:46",
        "LastLogOut": "2020-09-02 17:49:10",
        "rol": "1",
        "status": "1",
        "trash": "0"
    },

  */
