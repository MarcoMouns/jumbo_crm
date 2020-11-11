import 'package:jumbo_crm/model/data_sektorbazli_demo.dart';
import 'package:jumbo_crm/services/service_sektorbazli_demo.dart';
import 'package:flutter/material.dart';

class SektorBazliDemo extends StatefulWidget {
  SektorBazliDemo({Key key}) : super(key: key);

  @override
  _SektorBazliDemoState createState() => _SektorBazliDemoState();
}

class _SektorBazliDemoState extends State<SektorBazliDemo> {
  ServiceSektorBazliDemoLinkleri apiManager = ServiceSektorBazliDemoLinkleri();
  Future<DataModelSektorBazliDemoLinkleri> _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = apiManager.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text("Sektöre Bazlı Demo"),
      ),
      body: _futureSektorBazliDemo(context),
    );
  }

  _futureSektorBazliDemo(BuildContext context) {
    return FutureBuilder<DataModelSektorBazliDemoLinkleri>(
        future: _future,
        builder: (context,
            AsyncSnapshot<DataModelSektorBazliDemoLinkleri> snapshot) {
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
                                  Text("Sektör: "),
                                  Text(_data.sektorId.toString()??"null")
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
