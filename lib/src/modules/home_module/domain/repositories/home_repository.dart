import 'package:star_wars/src/modules/home_module/domain/entities/people_entity.dart';
import 'package:star_wars/src/modules/home_module/domain/entities/planet_entity.dart';

abstract class IHomeRepository {
  Future<List<PeopleEntity>> getPeopleList();
  Future<List<PeopleEntity>> getByName(String name);
  Future<PlanetEntity> getPlanetInfo(String uri);
}
