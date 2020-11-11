import 'package:jumbo_crm/model/data_onaylanan_projeler.dart';

import 'package:jumbo_crm/services/service_onaylanan_projeler.dart';
import 'package:flutter/material.dart';

class OnaylananProjeler extends StatefulWidget {
  OnaylananProjeler({Key key}) : super(key: key);

  @override
  _OnaylananProjelerState createState() => _OnaylananProjelerState();
}

class _OnaylananProjelerState extends State<OnaylananProjeler> {
  final ServiceOnaylananProjeler apiManager = ServiceOnaylananProjeler();
  Future<DataModelOnaylananProjeler> _future;

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
        title: Text("Onaylanan Projeler"),
      ),
      body: _futureOnaylananProjeler(context),
    );
  }

  _futureOnaylananProjeler(BuildContext context) {
    return FutureBuilder<DataModelOnaylananProjeler>(
        future: _future,
        builder: (context, AsyncSnapshot<DataModelOnaylananProjeler> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.data.length,
                shrinkWrap: false,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final _data = snapshot.data.data[index];

                  String sorumlu;
                  if(_data.projeSorumlusu.index==1){
                    sorumlu="Burak Emuce";
                  }
                  if(_data.projeSorumlusu.index==0){
                    sorumlu="İrem Erdoğan";
                  }
                  if(_data.projeSorumlusu.index==2){
                    sorumlu="İlker Tiryakioğlu";
                  }
                  if(_data.projeSorumlusu.index==3){
                    sorumlu="Burak Nasır";
                  }


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
                                  Text(sorumlu??"null")
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
                              Row(
                                children: [
                                  Text("Durum: "),
                                  Text(_data.durum??"null")
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
