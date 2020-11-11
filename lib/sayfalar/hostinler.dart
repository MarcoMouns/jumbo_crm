import 'package:jumbo_crm/model/data_hostingler.dart';
import 'package:jumbo_crm/services/service_hostingler.dart';
import 'package:flutter/material.dart';

class Hostingler extends StatefulWidget {
  Hostingler({Key key}) : super(key: key);

  @override
  _HostinglerState createState() => _HostinglerState();
}

class _HostinglerState extends State<Hostingler> {
  ServiceHostingler apiManager = ServiceHostingler();
  Future<DataModelHostingler> _future;

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
        title: Text("Hostingler"),
      ),
      body: _futureHostingler(context),
    );
  }

  _futureHostingler(BuildContext context) {
    return FutureBuilder<DataModelHostingler>(
        future: _future,
        builder: (context, AsyncSnapshot<DataModelHostingler> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.data.length,
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
