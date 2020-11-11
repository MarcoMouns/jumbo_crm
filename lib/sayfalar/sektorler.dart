import 'package:jumbo_crm/model/data_sektorler.dart';
import 'package:jumbo_crm/services/service_sektorler.dart';
import 'package:flutter/material.dart';

class Sektorler extends StatefulWidget {
  @override
  _SektorlerState createState() => _SektorlerState();
}

class _SektorlerState extends State<Sektorler> {
  Future<List<SektorlerModel>> futureSektorler;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureSektorler = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        appBar: AppBar(
          title: Text("Sektorler"),
        ),
        body: FutureBuilder(
          future: futureSektorler,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.redAccent, width: 5)),
                          child: ExpansionTile(
                            title: Column(
                              children: [
                                Text(snapshot.data[index].name,
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
                                     // Text("ID: "),
                                     // Text(snapshot.data[index].id),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          )),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
