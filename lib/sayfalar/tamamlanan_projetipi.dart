import 'package:jumbo_crm/model/data_tamamlanan_projetipi.dart';
import 'package:jumbo_crm/services/service_tamamlanan_projetipi.dart';
import 'package:flutter/material.dart';

class TamamlananProjeTipi extends StatefulWidget {
  TamamlananProjeTipi({Key key}) : super(key: key);

  @override
  _TamamlananProjeTipiState createState() => _TamamlananProjeTipiState();
}

class _TamamlananProjeTipiState extends State<TamamlananProjeTipi> {
  ServiceTamamlananProjeTipi apiManager = ServiceTamamlananProjeTipi();
  Future<DataModelTamamlananProjeTipi> _future;

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
        title: Text("Tamamlanan Projeler"),
      ),
      body: _futureTamamlananProjeTipi(context),
    );
  }

  _futureTamamlananProjeTipi(BuildContext context) {
    return FutureBuilder<DataModelTamamlananProjeTipi>(
        future: _future,
        builder:
            (context, AsyncSnapshot<DataModelTamamlananProjeTipi> snapshot) {
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
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
