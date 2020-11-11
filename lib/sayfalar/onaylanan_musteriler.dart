import 'package:jumbo_crm/model/data_onaylanan_musteriler.dart';
import 'package:jumbo_crm/services/service_onaylanan_musteriler.dart';
import 'package:flutter/material.dart';

class OnaylananMusteri extends StatefulWidget {
  OnaylananMusteri({Key key}) : super(key: key);

  @override
  _OnaylananMusteriState createState() => _OnaylananMusteriState();
}

class _OnaylananMusteriState extends State<OnaylananMusteri> {
  final ServiceOnaylananMusteriler apiManager = ServiceOnaylananMusteriler();
  Future<DataModelOnaylananMusteriler> _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = apiManager.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text("Onaylanan Müşteriler"),
      ),
      body: _futureMusteri(context),
    );
  }

  _futureMusteri(BuildContext context) {
    return FutureBuilder<DataModelOnaylananMusteriler>(
        future: _future,
        builder:
            (context, AsyncSnapshot<DataModelOnaylananMusteriler> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.data.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final _data = snapshot.data.data[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: Colors.redAccent, width: 5)),
                      child: ExpansionTile(
                        title: Column(
                          children: [
                            Text(_data.yetkiliKisi ?? "null"),
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
                                  Text("Firma adı: "),
                                  Text(_data.firmaAdi ?? "null")
                                ],
                              ),
                              Divider(),
                              Row(
                                children: [
                                  Text("Sektör: "),
                                  Text(_data.sektor ?? "null")
                                ],
                              ),
                              Divider(),
                              Row(
                                children: [
                                  Text("Telefon: "),
                                  Text(_data.telefon ?? "null")
                                ],
                              ),
                              Divider(),
                              Row(
                                children: [
                                  Text("Yetkili telefon: "),
                                  Text(_data.yetkiliTelefon ?? "null")
                                ],
                              ),
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
