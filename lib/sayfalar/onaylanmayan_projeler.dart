import 'package:jumbo_crm/model/data_onaylanmayan_projeler.dart';

import 'package:jumbo_crm/services/service_onaylanmayan_projeler.dart';
import 'package:flutter/material.dart';

class OnaylanmayanProjeler extends StatefulWidget {
  OnaylanmayanProjeler({Key key}) : super(key: key);

  @override
  _OnaylanmayanProjelerState createState() => _OnaylanmayanProjelerState();
}

class _OnaylanmayanProjelerState extends State<OnaylanmayanProjeler> {
  ServiceOnaylanmayanProjeler apiManager = ServiceOnaylanmayanProjeler();
  Future<DataModelOnaylanmayanProjeler> _future;

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
        title: Text("Onaylanmayan Projeler"),
      ),
      body: _futureOnaylanmayanPorjeler(context),
    );
  }

  _futureOnaylanmayanPorjeler(BuildContext context) {
    return FutureBuilder<DataModelOnaylanmayanProjeler>(
        future: _future,
        builder:
            (context, AsyncSnapshot<DataModelOnaylanmayanProjeler> snapshot) {
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
                           // Text(_data.yetkiliKisi ?? "null"),
                            Divider(
                              color: Colors.black,
                            )
                          ],
                        ),
                        children: [
                          Column(
                            children: [
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
