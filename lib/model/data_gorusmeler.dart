// To parse this JSON data, do
//
//     final dataModelGorusmeler = dataModelGorusmelerFromJson(jsonString);

import 'dart:convert';

DataModelGorusmeler dataModelGorusmelerFromJson(String str) => DataModelGorusmeler.fromJson(json.decode(str));

String dataModelGorusmelerToJson(DataModelGorusmeler data) => json.encode(data.toJson());

class DataModelGorusmeler {
  DataModelGorusmeler({
    this.draw,
    this.recordsTotal,
    this.recordsFiltered,
    this.data,
    this.input,
  });

  int draw;
  int recordsTotal;
  int recordsFiltered;
  List<Datum> data;
  List<dynamic> input;

  factory DataModelGorusmeler.fromJson(Map<String, dynamic> json) => DataModelGorusmeler(
    draw: json["draw"],
    recordsTotal: json["recordsTotal"],
    recordsFiltered: json["recordsFiltered"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    input: List<dynamic>.from(json["input"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "draw": draw,
    "recordsTotal": recordsTotal,
    "recordsFiltered": recordsFiltered,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "input": List<dynamic>.from(input.map((x) => x)),
  };
}

class Datum {
  Datum({
    this.id,
    this.hizmet,
    this.musteriId,
    this.musteri,
    this.personel,
    this.kayitTarihi,
    this.durum,
    this.sonuc,
    this.trash,
  });

  String id;
  String hizmet;
  String musteriId;
  String musteri;
  String personel;
  String kayitTarihi;
  String durum;
  String sonuc;
  String trash;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    hizmet: json["Hizmet"] == null ? null : json["Hizmet"],
    musteriId: json["MusteriId"],
    musteri: json["Musteri"],
    personel: json["Personel"],
    kayitTarihi: json["KayitTarihi"],
    durum: json["Durum"],
    sonuc: json["Sonuc"],
    trash: json["trash"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "Hizmet": hizmet == null ? null : hizmet,
    "MusteriId": musteriId,
    "Musteri": musteri,
    "Personel": personel,
    "KayitTarihi": kayitTarihi,
    "Durum": durum,
    "Sonuc": sonuc,
    "trash": trash,
  };
}
