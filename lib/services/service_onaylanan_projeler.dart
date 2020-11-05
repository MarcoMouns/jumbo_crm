import 'package:jumbo_crm/constants/api_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:jumbo_crm/model/data_onaylanan_projeler.dart';

class ServiceOnaylananProjeler {
  Future<DataModelOnaylananProjeler> fetchData() async {
    final http.Response response = await http.get(
        Uri.encodeFull(ApiConstants.ONAYLANAN_PROJELER),
        headers: {"Authorization": "Bearer ${ApiConstants.TOKEN_VALUE}"});
    if (response.statusCode == 200) {
      final _jsonResponse =
          DataModelOnaylananProjeler.fromJson(jsonDecode(response.body));
      return _jsonResponse;
    } else {
      throw Exception(
        "istek durumu başarısız oldu ${response.statusCode}",
      );
    }
  }
}
