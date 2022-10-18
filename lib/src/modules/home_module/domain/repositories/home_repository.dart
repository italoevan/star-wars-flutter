import 'package:star_wars/src/modules/home_module/domain/entities/people_entity.dart';

abstract class IHomeRepository {
  Future<List<PeopleEntity>> getPeopleList();
}
