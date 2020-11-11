import 'package:flutter/material.dart';
import 'package:jumbo_crm/services/service_devameden_projetipi.dart';
import 'package:jumbo_crm/model/data_devameden_projetipi.dart';

class DevamedenProjetipi extends StatefulWidget {
  DevamedenProjetipi({Key key}) : super(key: key);

  @override
  _DevamedenProjetipiState createState() => _DevamedenProjetipiState();
}

class _DevamedenProjetipiState extends State<DevamedenProjetipi> {
  Future<DataModelDevamEdenProjeTipi> _future;
  ServiceDevamEdenProjeTipi apiManager = ServiceDevamEdenProjeTipi();

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
        title: Text("Devam Eden Proje Tipi"),
      ),
      body: _futureDevamedenProjeTipi(context),
    );
  }

  _futureDevamedenProjeTipi(BuildContext context) {
    return FutureBuilder<DataModelDevamEdenProjeTipi>(
        future: _future,
        builder:
            (context, AsyncSnapshot<DataModelDevamEdenProjeTipi> snapshot) {
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
                            Text(_data.projeAdi??"null"),
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
                                  Text("Proje sorumlusu: "),
                                  Text(_data.projeSorumlusu??"null")
                                ],
                              ),
                              Divider(),
                              Row(
                                children: [
                                  Text("Başlangıç tarihi: "),
                                  Text(_data.baslangicTarihi??"null")
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
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
