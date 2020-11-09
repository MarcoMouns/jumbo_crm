import 'dart:convert';

import 'package:jumbo_crm/constants/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:jumbo_crm/model/data_kullanici_yonetimi.dart';

class ServiceKullaniciYonetimi {
  Future<DataModelKullaniciYonetimi> fetchData() async {
    final http.Response response = await http.get(
        Uri.encodeFull(ApiConstants.HOSTINGLER),
        headers: {"Authorization": "Bearer ${ApiConstants.TOKEN_VALUE}"});

    if (response.statusCode == 200) {
      final _jsonResponse =
      DataModelKullaniciYonetimi.fromJson(jsonDecode(response.body));
      return _jsonResponse;
    } else {
      throw Exception("istek durumu başarısız${response.statusCode}");
    }
  }
}
