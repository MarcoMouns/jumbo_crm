import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jumbo_crm/menu.dart';

class Giris extends StatefulWidget {
  Giris({Key key}) : super(key: key);

  @override
  _GirisState createState() => _GirisState();
}

class _GirisState extends State<Giris> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _mailController = TextEditingController();
  final _sifreController = TextEditingController();
  final _adController = TextEditingController();
  final _soyadController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blueGrey,
      //   elevation: 0,
      // ),
      key: _scaffoldKey,
      body: Center(
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Stack(
                  children: [
                    Image(
                      image: AssetImage("assets/images/girisbackground.png"),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      fit: BoxFit.cover,
                    ),
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 120.0),
                          child: Container(
                            width: 200.0,
                            height: 80.0,
                            alignment: Alignment.center,
                            decoration: new BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/logocrm.png'),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 200),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20, bottom: 10),
                                  child: TextFormField(controller: _mailController,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) => EmailValidator
                                            .validate(value)
                                        ? null
                                        : 'Lütfen geçerli bir mail adresi girin.',
                                    decoration: InputDecoration(
                                        hintText: "Email",
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.blueAccent),
                                            borderRadius:
                                                BorderRadius.circular(25))),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20),
                                  child: TextFormField(controller: _sifreController,
                                    obscureText: true,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "Lütfen şifre girin";
                                      }
                                      if (value.length < 6) {
                                        return "Şifre en az 6 haneli olmalı";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Şifre",
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.blueAccent),
                                            borderRadius:
                                                BorderRadius.circular(25))),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 20.0, top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Şifremi unuttum?",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.blue),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 60),
                                  child: Container(
                                    height: height * 0.068,
                                    width: width * 0.9,
                                    margin: EdgeInsets.all(15),
                                    child: RaisedButton(
                                      onPressed: () {
                                        if (_formKey.currentState.validate()) {
                                          setState(() {
                                            _girisYap(context);
                                            isLoading = true;
                                          });
                                        }
                                      },
                                      padding: EdgeInsets.all(0.0),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(75.0)),
                                      child: Ink(
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Colors.blue,
                                                Colors.lightBlue,
                                                Colors.lightBlueAccent
                                              ],
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(28.0)),
                                        child: Container(
                                          constraints: BoxConstraints(
                                              maxWidth: width * 0.9,
                                              minHeight: height * 0.068),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Oturum aç",
                                            textAlign: TextAlign.center,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  void _showScaffold(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  void _girisYap(BuildContext context) async {
    await _auth
        .signInWithEmailAndPassword(
            email: _mailController.text, password: _sifreController.text)
        .then((oturumAcmisKullaniciAuthResoult) {
      var oturumAcmisKullanici = oturumAcmisKullaniciAuthResoult.user;

      if (oturumAcmisKullanici.emailVerified) {
        print("oturum açıldı");

        _showScaffold("Oturum AÇILDI");

        Navigator.of(context).pushNamedAndRemoveUntil(
            '/home', (Route<dynamic> route) => false);
      }
      if (!oturumAcmisKullanici.emailVerified) {
        setState(() {
          print("mail onaylı değil.");
          isLoading = false;
          _showScaffold("Lütfen mailinizi onaylayın");
          _auth.signOut();
        });
      }
    }).catchError((hata) {
      print(hata.toString());
      setState(() {
        _showScaffold("Mail veya Şifre hatalı");
        isLoading = false;
      });
    });
  }
}
