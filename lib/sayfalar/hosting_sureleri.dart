import 'package:jumbo_crm/model/data_hosting.dart';
import 'package:jumbo_crm/services/service_hosting.dart';
import 'package:flutter/material.dart';

class HostingSureleri extends StatefulWidget {
  @override
  _HostingSureleriState createState() => _HostingSureleriState();
}

class _HostingSureleriState extends State<HostingSureleri> {
  ServiceHostingSuresi apiManager = ServiceHostingSuresi();
  Future<DataModeHostingSuresi> _future;

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
        title: Text("Hostin Bitme Süreleri(30 GÜN)"),
      ),
      body: _futureHostingSureleri(context),
    );
  }

  _futureHostingSureleri(BuildContext context) {
    return FutureBuilder<DataModeHostingSuresi>(
        future: _future,
        builder: (context, AsyncSnapshot<DataModeHostingSuresi> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.data.length,
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
                            Text(_data.domainAdi??"null"),
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
                                  Text("Kalan süre: "),
                                  Text(_data.kalanSure??"null")
                                ],
                              ),
                              Divider(),
                              Row(
                                children: [
                                  Text("Bitiş tarihi: "),
                                  Text(_data.bitisTarihi??"null")
                                ],
                              ),

                              Divider(),
                              Row(
                                children: [
                                  Text("Platform: "),
                                  Text(_data.platform??"null")
                                ],
                              ),

                              Divider(),
                              Row(
                                children: [
                                  Text("Hosting firması: "),
                                  Text(_data.hostingFirmasi??"null")
                                ],
                              ),

                              Divider(),
                              Row(
                                children: [
                                  Text("SSL: "),
                                  Text(_data.ssl??"null")
                                ],
                              ),

                              Divider(),
                              Row(
                                children: [
                                  Text("SSL tarihi: "),
                                  Text(_data.sslBitisTarihi??"null")
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
