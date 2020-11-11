import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Kayit extends StatefulWidget {
  Kayit({Key key}) : super(key: key);

  @override
  _KayitState createState() => _KayitState();
}

class _KayitState extends State<Kayit> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey1 = new GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = new GlobalKey<FormState>();

  final _scaffoldKey = GlobalKey<ScaffoldState>();
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
      key: _scaffoldKey,
      body: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : Stack(
                  children: [
                    Image(
                      image: AssetImage("assets/images/kayitbackground.png"),
                      width: width,
                      height: height,
                      fit: BoxFit.fill,
                    ),
                    SingleChildScrollView(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 30, left: 30),
                          child: Form(
                            key: _formKey2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 140),
                                  child: Image.asset(
                                      "assets/images/logokayit.png"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 90.0, bottom: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: TextFormField(
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                              decoration: InputDecoration(
                                                  fillColor: Colors.white10,
                                                  filled: false,
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                          borderSide: BorderSide(
                                                              color: Colors
                                                                  .white)),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                          borderSide: BorderSide(
                                                              color: Colors
                                                                  .white38)),
                                                  hintText: "Adı",
                                                  hintStyle: TextStyle(
                                                      color: Colors.white38),
                                                  focusColor: Colors.white),
                                            ),
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 4,
                                            ),
                                            child: TextFormField(
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                              decoration: InputDecoration(
                                                  fillColor: Colors.white10,
                                                  filled: false,
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                          borderSide: BorderSide(
                                                              color: Colors
                                                                  .white)),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                          borderSide: BorderSide(
                                                              color: Colors
                                                                  .white38)),
                                                  hintText: "Soyadı",
                                                  hintStyle: TextStyle(
                                                      color: Colors.white38),
                                                  focusColor: Colors.white),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10.0,
                                  ),
                                  child: TextFormField(
                                      controller: _mailController,
                                      keyboardType: TextInputType.emailAddress,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.white70),
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          suffixIcon: Icon(
                                            Icons.email,
                                            color: Colors.white70,
                                          ),
                                          fillColor: Colors.white10,
                                          filled: false,
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                  color: Colors.white)),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                color: Colors.white38,
                                              )),
                                          hintText: "Email",
                                          hintStyle:
                                              TextStyle(color: Colors.white38),
                                          focusColor: Colors.white),
                                      validator: (value) =>
                                          !EmailValidator.validate(value, true)
                                              ? "Lütfen geçerli bir email girin"
                                              : null),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 10.0,
                                  ),
                                  child: TextFormField(
                                    controller: _sifreController,
                                    obscureText: true,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white70),
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        suffixIcon: Icon(
                                          Icons.visibility_off,
                                          color: Colors.white70,
                                        ),
                                        fillColor: Colors.white10,
                                        filled: false,
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                                color: Colors.white)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                              color: Colors.white38,
                                            )),
                                        hintText: "Şifre",
                                        hintStyle:
                                            TextStyle(color: Colors.white38),
                                        focusColor: Colors.white),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "Lütfen şifre girin";
                                      }
                                      if (value.length < 6) {
                                        return "Şifre en az 6 haneli olmalı";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 50.0),
                                  child: RadioListTile(
                                    activeColor: Colors.white70,
                                    title: Text(
                                      "Kullanım Şartları ve Politikayı okudum, onayladım. ",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    groupValue: null,
                                    value: null,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 1),
                                  child: Container(
                                    height: height * 0.068,
                                    width: width * 0.9,
                                    margin: EdgeInsets.all(15),
                                    child: RaisedButton(
                                      onPressed: () {
                                        if (_formKey2.currentState.validate()) {
                                          setState(() {
                                            _uyeOl();
                                            isLoading = true;
                                            debugPrint("üye ol butonu");
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
                                                Colors.white,
                                                Colors.white
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
                                            "Kayıt ol",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.greenAccent,
                                                fontSize: 18),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
    );
  }

  void _uyeOl() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: _mailController.text,
        password: _sifreController.text,
      )
          .then((authReseult) {
        var firebaseUser = authReseult.user;
        if (firebaseUser != null) {
          firebaseUser.sendEmailVerification().then((value) {
            setState(() {
              isLoading = false;
              _showDialog("Maili Onayla",
                  "Mailinize onay linki gönderildi. Lütfen kontrol edin");
            });
          });
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('şifre zayıf.');
        setState(() {
          isLoading = false;
          _showScaffold("Bu mail zaten kullanılıyor!");
        });
      } else if (e.code == 'email-already-in-use') {
        setState(() {
          isLoading = false;
          _showScaffold("Bu mail zaten kullanılıyor!");
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void _showScaffold(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  void _showDialog(String title, String content) {
    // flutter defined function
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(title),
          content: Text(content),
          //content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Tamam"),
              onPressed: () {
                setState(() {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/', (Route<dynamic> route) => false);
                });
              },
            ),
          ],
        );
      },
    );
  }
}
/*
 validator: (value) =>
                                        !EmailValidator.validate(value, true)
                                            ? "Lütfen geçerli bir email girin"
                                            : null),
                                Padding(
 */
