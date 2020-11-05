import 'package:flutter/material.dart';
import '../model/data_gorevler.dart';
import '../services/service_gorevler.dart';

class Gorevler extends StatefulWidget {
  @override
  _GorevlerState createState() => _GorevlerState();
}

class _GorevlerState extends State<Gorevler> {
  final ServiceGorevler apiManager = ServiceGorevler();
  Future<DataModelGorevler> _future;
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
        backgroundColor: Colors.cyan,
        title: Text("görevler"),
      ),
      body: _futureGorevler(context),
    );
  }

  _futureGorevler(BuildContext context) {
    return FutureBuilder<DataModelGorevler>(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<DataModelGorevler> snapshot) {
        // print(snapshot.data.data[index].durum.toString());
        print(snapshot.connectionState.toString());
        print(snapshot.data.toString());

        if (snapshot.hasData) {
          return GestureDetector(
            onTap: () {},
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data.data.length,
              itemBuilder: (BuildContext context, int index) {
                final _data = snapshot.data.data[index];

                return InkWell(
                  onTap: () {
                    debugPrint("gdfg");
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(
                        _data.gorev,
                      ),
                      subtitle: Text(
                        _data.durum,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
