import 'package:jumbo_crm/constants/api_constants.dart';
import 'package:jumbo_crm/model/data_sektorbazli_demo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

  class ServiceSektorBazliDemoLinkleri {
  Future<DataModelSektorBazliDemoLinkleri> fetchData() async {
    final http.Response response = await http.get(
        Uri.encodeFull(ApiConstants.SEKTORBAZLIDEMO),
        headers: {"Authorization": "Bearer ${ApiConstants.TOKEN_VALUE}"});
    if (response.statusCode == 200) {
      final _jsonResponse =
      DataModelSektorBazliDemoLinkleri.fromJson(jsonDecode(response.body));
      return _jsonResponse;
    } else {
      throw Exception(
        "istek durumu başarısız oldu ${response.statusCode}",
      );
    }
  }
}
