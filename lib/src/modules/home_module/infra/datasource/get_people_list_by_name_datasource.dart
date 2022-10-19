import 'dart:convert';

import 'package:http/http.dart';
import 'package:star_wars/src/consts/app_consts.dart';

abstract class IGetPeopleListByNameDatasource {
  Future<Map<String, dynamic>> call(String name);
}

class GetPeopleListByNameDatasource implements IGetPeopleListByNameDatasource {
  @override
  Future<Map<String, dynamic>> call(String name) async {
    var response = await get(Uri.parse(AppConsts.peopleByName(name)));
    return json.decode(response.body);
  }
}
