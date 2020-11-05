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
                  return InkWell(
                    onTap: () {},
                    child: Card(
                      child: ListTile(
                        title: Text(_data.projeAdi),
                        subtitle: Text(_data.projeSorumlusu.toString()),
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
