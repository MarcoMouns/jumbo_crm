
import 'package:flutter/material.dart';
import 'package:jumbo_crm/model/data_gorusmeler.dart';
import 'package:jumbo_crm/services/service_gorusmeler.dart';

class Gorusmeler extends StatefulWidget {
  Gorusmeler({Key key}) : super(key: key);

  @override
  _GorusmelerState createState() => _GorusmelerState();
}

class _GorusmelerState extends State<Gorusmeler> {
  Future<DataModelGorusmeler> _future;
  ServiceGorusmeler apiManager = ServiceGorusmeler();

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
        title: Text("Görüşmeler"),
      ),
      body: _futureGorusmeler(context),
    );
  }

  _futureGorusmeler(BuildContext context) {
    return FutureBuilder<DataModelGorusmeler>(
        future: _future,
        builder: (context, AsyncSnapshot<DataModelGorusmeler> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data.data.length,
                itemBuilder: (context, index) {
                  final _data = snapshot.data.data[index];
                  String durum;
                  if(_data.durum=="4"){
                    durum="Satış İptal";
                  }
                  if(_data.durum=="3"){
                    durum="Satış Gerçekleşti";
                  }
                  if(_data.durum=="2"){
                    durum="Satış Kaydedildi";
                  }
                  if(_data.durum=="1"){
                    durum="null";
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
                            Text(_data.musteri??"null"),
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
                                  Text("Hizmet: "),
                                  Text(_data.hizmet??"null")
                                ],
                              ),
                              Divider(),
                              Row(
                                children: [
                                  Text("Kayıt tarihi: "),
                                  Text(_data.kayitTarihi??"null")
                                ],
                              ),

                              Divider(),
                              Row(
                                children: [
                                  Text("Sonuç: "),
                                  Text(durum??"null")
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

        }
        );

  }
}
