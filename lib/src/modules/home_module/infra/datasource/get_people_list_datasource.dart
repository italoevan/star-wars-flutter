import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:star_wars/src/consts/app_consts.dart';

abstract class IGetPeopleListDatasource {
  Future<Map<String, dynamic>> call();
}

class GetPeopleListDatasource implements IGetPeopleListDatasource {
  @override
  Future<Map<String, dynamic>> call() async {
    var response = await http.get(Uri.parse(AppConsts.people));
    return json.decode(response.body);
  }
}
