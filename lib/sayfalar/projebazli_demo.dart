
import 'package:jumbo_crm/model/data_projebazli_demo.dart';
import 'package:jumbo_crm/services/service_projebazli_demo.dart';
import 'package:flutter/material.dart';

class ProjeBazliDemo extends StatefulWidget {
  ProjeBazliDemo({Key key}) : super(key: key);

  @override
  _ProjeBazliDemoState createState() => _ProjeBazliDemoState();
}

class _ProjeBazliDemoState extends State<ProjeBazliDemo> {
  ServiceProjeBazliDemoLinkleri apiManager = ServiceProjeBazliDemoLinkleri();
  Future<DataModelProjeBazliDemoLinkleri> _future;

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
        title: Text("Proje Bazlı Demo"),
      ),
      body: _futureProjeBazliDemo(context),
    );
  }

  _futureProjeBazliDemo(BuildContext context) {
    return FutureBuilder<DataModelProjeBazliDemoLinkleri>(
        future: _future,
        builder: (context, AsyncSnapshot<DataModelProjeBazliDemoLinkleri> snapshot) {
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
                            Text(_data.demoUserId.toString()??"null"),
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
                                  Text("Tarih: "),
                                  Text(_data.tarih??"null")
                                ],
                              ),
                              Divider(),
                              Row(
                                children: [
                                  Text("Toplam: "),
                                  Text(_data.toplam.toString()??"null")
                                ],
                              ),

                              Divider(),
                              Row(
                                children: [
                                  Text("Url: "),
                                  Expanded(
                                    child: Text(_data.demoUrl ??
                                        "null", maxLines: 3,
                                    ),
                                  )

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
