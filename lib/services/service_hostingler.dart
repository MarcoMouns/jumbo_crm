import 'dart:convert';

import 'package:jumbo_crm/constants/api_constants.dart';
import 'package:jumbo_crm/model/data_hostingler.dart';
import 'package:http/http.dart' as http;

class ServiceHostingler {
  Future<DataModelHostingler> fetchData() async {
    final http.Response response = await http.get(
        Uri.encodeFull(ApiConstants.HOSTINGLER),
        headers: {"Authorization": "Bearer ${ApiConstants.TOKEN_VALUE}"});

    if (response.statusCode == 200) {
      final _jsonResponse =
          DataModelHostingler.fromJson(jsonDecode(response.body));
      return _jsonResponse;
    } else {
      throw Exception("istek durumu başarısız${response.statusCode}");
    }
  }
}
