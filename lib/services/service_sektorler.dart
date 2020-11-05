import 'dart:convert';

import 'package:jumbo_crm/constants/api_constants.dart';
import 'package:jumbo_crm/model/data_sektorler.dart';
import 'package:http/http.dart' as http;

Future<List<SektorlerModel>> fetchData() async {
  final http.Response response = await http.get(
    Uri.encodeFull(ApiConstants.SEKTORLER),
    headers: {
      "Authorization": "Bearer ${ApiConstants.TOKEN_VALUE}",
    },
  );
  if (response.statusCode == 200) {
    return sektorlerModelFromJson(response.body);
  } else {
    throw Exception(
      "Request failed with status: ${response.statusCode}",
    );
  }
}
