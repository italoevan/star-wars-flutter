import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class IGetPlanetInfoDatasource {
  Future<Map<String, dynamic>> call(String uri);
}

class GetPlanetInfoDatasource implements IGetPlanetInfoDatasource {
  @override
  Future<Map<String, dynamic>> call(String uri) async {
    var response = await http.get(Uri.parse(uri));
    return json.decode(response.body);
  }
}
