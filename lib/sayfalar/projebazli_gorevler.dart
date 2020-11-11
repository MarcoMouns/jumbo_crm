import 'package:jumbo_crm/model/data_projebazli_gorevler.dart';
import 'package:jumbo_crm/services/service_projebazli_gorevler.dart';
import 'package:flutter/material.dart';

class ProjeBazliGorevler extends StatefulWidget {
  ProjeBazliGorevler({Key key}) : super(key: key);

  @override
  _ProjeBazliGorevlerState createState() => _ProjeBazliGorevlerState();
}

class _ProjeBazliGorevlerState extends State<ProjeBazliGorevler> {
  ServiceProjeBazliGorev apiManager = ServiceProjeBazliGorev();
  Future<DataModelProjeBazliGorevler> _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = apiManager.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Proje Bazlı Görevler"),
      ),
      body: _futureProjeBazliGorevler(context),
    );
  }

  _futureProjeBazliGorevler(BuildContext context) {
    return FutureBuilder<DataModelProjeBazliGorevler>(
        future: _future,
        builder:
            (context, AsyncSnapshot<DataModelProjeBazliGorevler> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final _data = snapshot.data.data[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          border:
                              Border.all(color: Colors.redAccent, width: 5)),
                      child: ExpansionTile(
                        title: Column(
                          children: [
                            Text(_data.gorev),
                            Divider(
                              color: Colors.black,
                            )
                          ],
                        ),
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text("Görev adı: "),
                                  Text(_data.projeAdi)
                                ],
                              ),
                              Divider(),
                              Row(
                                children: [
                                  Text("Görev sorumlusu: "),
                                  Text(_data.gorevSorumlusuName)
                                ],
                              ),
                              Divider(),
                              Row(
                                children: [
                                  Text("Görev tarihi: "),
                                  Text(_data.gorevTarihi)
                                ],
                              ),
                              Divider(),
                              Row(
                                children: [
                                  Text("Görevi Ekleyen: "),
                                  Text(_data.gorevEkleyen)
                                ],
                              ),
                              Divider(),
                            ],
                          )
                        ],
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
  }
}
