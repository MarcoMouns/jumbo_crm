import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../model/data_gorevler.dart';
import '../services/service_gorevler.dart';

class Gorevler extends StatefulWidget {
  @override
  _GorevlerState createState() => _GorevlerState();
}

class _GorevlerState extends State<Gorevler> {
  final ServiceGorevler apiManager = ServiceGorevler();
  Future<DataModelGorevler> _future;

  final ScrollController _scrollController = ScrollController();

  void _scrollToSelectedContent(
      bool isExpanded, double previousOffset, int index, GlobalKey myKey) {
    final keyContext = myKey.currentContext;
    if (keyContext != null) {
      // make sure that your widget is visible
      final box = keyContext.findRenderObject() as RenderBox;
      _scrollController.animateTo(
          isExpanded ? (box.size.height * index) : previousOffset,
          duration: Duration(milliseconds: 500),
          curve: Curves.linear);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = apiManager.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Görevler"),
      ),
      body: SingleChildScrollView(
        child: _futureGorevler(context),
      ),
    );
  }

  _futureGorevler(BuildContext context) {
    return FutureBuilder<DataModelGorevler>(
      future: _future,
      builder:
          (BuildContext context, AsyncSnapshot<DataModelGorevler> snapshot) {
        // print(snapshot.data.data[index].durum.toString());
        print(snapshot.connectionState.toString());
        print(snapshot.data.toString());

        if (snapshot.hasData) {
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: snapshot.data.data.length,
            itemBuilder: (BuildContext context, int index) {
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
                          Text(
                            _data.gorev,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Divider(
                            height: 20,
                            color: Colors.black,
                          )
                        ],
                      ),
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Text("Görev Sorumlusu: "),
                                Text(_data.gorevSorumlusuName)
                              ],
                            ),
                            Divider(),
                            Row(
                              children: [
                                Text("Görev Tarihi: "),
                                Text(_data.gorevTarihi)
                              ],
                            ),
                            Divider(),
                            Row(
                              children: [
                                Text("Görev Ekleyen: "),
                                Text(_data.gorevEkleyen),
                              ],
                            ),
                            Divider(),
                            Row(
                              children: [
                                Text("Proje Adı: "),
                                Text(_data.projeAdi)
                              ],
                            ),
                            Divider(),
                          ],
                        )
                      ],
                    )),
              );
            },
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
