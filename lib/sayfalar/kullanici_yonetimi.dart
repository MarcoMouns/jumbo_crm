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
        title: Text("Proje Bazlı Demo"),
      ),
      body: FutureBuilder(
          future: fetchData(),
          builder: (context,  snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: 8,
                  // shrinkWrap: true,
                  itemBuilder: (context, index) {
                    //final _data = snapshot.data.name;
                    return InkWell(
                      onTap: () {},
                      child: Card(
                        child: ListTile(
                          title: Text(snapshot.data[index]["name"]?? ""),

                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          })
    );
  }
/*
  _futureKullaniciYonetimi(BuildContext context) {
    return FutureBuilder(
        future: fetchData(),
        builder: (context, AsyncSnapshot<DataModelKullaniciYonetimi> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: 3,
               // shrinkWrap: true,
                itemBuilder: (context, index) {
                  final _data = snapshot.data.name;
                  return InkWell(
                    onTap: () {},
                    child: Card(
                      child: ListTile(
                        title: Text(_data.length.toString()?? ""),

                      ),
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }*/
}
