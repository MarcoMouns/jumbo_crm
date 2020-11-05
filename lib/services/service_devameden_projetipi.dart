import 'dart:convert';

import 'package:jumbo_crm/constants/api_constants.dart';
import 'package:jumbo_crm/model/data_devameden_projetipi.dart';
import 'package:http/http.dart' as http;

class ServiceDevamEdenProjeTipi {
  Future<DataModelDevamEdenProjeTipi> fetchData() async {
    final http.Response response = await http.get(
      Uri.encodeFull(ApiConstants.DEVAMEDEN_PROJETIPI),
      headers: {"Authorization": "Bearer ${ApiConstants.TOKEN_VALUE}"},
    );
    if (response.statusCode == 200) {
      //return dataModelDevamedenProjeTipiFromJson(response.body);
      final _jsonResponse =
          DataModelDevamEdenProjeTipi.fromJson(jsonDecode(response.body));
      return _jsonResponse;
    } else {
      throw Exception("istek durumu başarısız oldu${response.statusCode}");
    }
  }
}
