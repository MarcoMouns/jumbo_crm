import 'package:jumbo_crm/sayfalar/giris.dart';
import 'package:jumbo_crm/sayfalar/kayit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Anasayfa extends StatefulWidget {
  Anasayfa({Key key}) : super(key: key);

  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image(
            image: AssetImage("assets/images/Background.png"),
            width: width,
            height: height,
            fit: BoxFit.fill,
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 140.0),
                  child: Image.asset("assets/images/jumbo.png"),
                ),
                Image.asset("assets/images/jumbocrm.png"),
                Padding(
                  padding: const EdgeInsets.only(top: 350),
                  child: Container(
                    height: height * 0.06,
                    width: width * 0.85,
                    child: RaisedButton(
                      child: Text(
                        "Oturum aç",
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context,
                            '/giris');
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: InkWell(
                    child: Text(
                      "Kayıt ol",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 25,
                          color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context,
                          '/uyeol');
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Container(
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                print('goole: Olay yeri');
                              },
                              child: ClipOval(
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  color: Colors.white,
                                  child: Icon(
                                    FontAwesome.google,
                                    color: Colors.lightBlue,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 0),
                        child: Container(
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                print('facebook: Olay yeri');
                              },
                              child: ClipOval(
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  color: Colors.white,
                                  child: Icon(
                                    FontAwesome.facebook,
                                    color: Colors.lightBlue,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
