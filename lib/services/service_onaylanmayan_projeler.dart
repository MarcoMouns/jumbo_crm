import 'package:jumbo_crm/constants/api_constants.dart';
import 'package:jumbo_crm/model/data_onaylanmayan_projeler.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ServiceOnaylanmayanProjeler {
  Future<DataModelOnaylanmayanProjeler> fetchData() async {
    final http.Response response = await http.get(
        Uri.encodeFull(ApiConstants.ONAYLANMAYAN_PROJELER),
        headers: {"Authorization": "Bearer ${ApiConstants.TOKEN_VALUE}"});
    if (response.statusCode == 200) {
      final _jsonResponse =
          DataModelOnaylanmayanProjeler.fromJson(jsonDecode(response.body));
      return _jsonResponse;
    } else {
      throw Exception(
        "istek durumu başarısız oldu ${response.statusCode}",
      );
    }
  }
}
