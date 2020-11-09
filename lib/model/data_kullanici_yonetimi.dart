// To parse this JSON data, do
//
//     final dataModelKullaniciYonetimi = dataModelKullaniciYonetimiFromJson(jsonString);

import 'dart:convert';

DataModelKullaniciYonetimi dataModelKullaniciYonetimiFromJson(String str) => DataModelKullaniciYonetimi.fromJson(json.decode(str));

String dataModelKullaniciYonetimiToJson(DataModelKullaniciYonetimi data) => json.encode(data.toJson());

class DataModelKullaniciYonetimi {
  DataModelKullaniciYonetimi({
    this.id,
    this.apiToken,
    this.profil,
    this.username,
    this.name,
    this.email,
    this.telefon,
    this.dogumtarihi,
    this.adres,
    this.baslangictarihi,
    this.departman,
    this.mood,
    this.password,
    this.rememberToken,
    this.lastLog,
    this.lastLogOut,
    this.rol,
    this.status,
    this.trash,
  });

  String id;
  String apiToken;
  String profil;
  String username;
  String name;
  String email;
  String telefon;
  String dogumtarihi;
  String adres;
  String baslangictarihi;
  String departman;
  String mood;
  String password;
  String rememberToken;
  DateTime lastLog;
  DateTime lastLogOut;
  String rol;
  String status;
  String trash;

  factory DataModelKullaniciYonetimi.fromJson(Map<String, dynamic> json) => DataModelKullaniciYonetimi(
    id: json["id"],
    apiToken: json["ApiToken"],
    profil: json["profil"],
    username: json["username"],
    name: json["name"],
    email: json["email"],
    telefon: json["telefon"],
    dogumtarihi: json["dogumtarihi"],
    adres: json["adres"],
    baslangictarihi: json["baslangictarihi"],
    departman: json["Departman"],
    mood: json["Mood"],
    password: json["password"],
    rememberToken: json["remember_token"],
    lastLog: DateTime.parse(json["LastLog"]),
    lastLogOut: DateTime.parse(json["LastLogOut"]),
    rol: json["rol"],
    status: json["status"],
    trash: json["trash"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ApiToken": apiToken,
    "profil": profil,
    "username": username,
    "name": name,
    "email": email,
    "telefon": telefon,
    "dogumtarihi": dogumtarihi,
    "adres": adres,
    "baslangictarihi": baslangictarihi,
    "Departman": departman,
    "Mood": mood,
    "password": password,
    "remember_token": rememberToken,
    "LastLog": lastLog.toIso8601String(),
    "LastLogOut": lastLogOut.toIso8601String(),
    "rol": rol,
    "status": status,
    "trash": trash,
  };
}
