import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class IGetStarshipDatasource {
  Future<Map<String,dynamic>> call(String uri);
}

class GetStarshipDatasource implements IGetStarshipDatasource {
  
  @override
  Future<Map<String, dynamic>> call(String uri) async{
    var response = await http.get(Uri.parse(uri));
    return  json.decode(response.body);
  }

}