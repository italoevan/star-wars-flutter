import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class IGetFilmDatasource {
  Future<Map<String, dynamic>> call(String uri);
}

class GetFilmDatasource implements IGetFilmDatasource {
  @override
  Future<Map<String, dynamic>> call(String uri) async {
    var response = await http.get(Uri.parse(uri));
    return json.decode(response.body);
  }
}
