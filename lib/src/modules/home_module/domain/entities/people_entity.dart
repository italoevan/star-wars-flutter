import 'package:star_wars/src/modules/home_module/domain/entities/planet_entity.dart';
import 'package:star_wars/src/modules/home_module/domain/entities/starship_entity.dart';

class PeopleEntity {
  final String name;
  final String gender;
  final String birthYear;
  final String planetAddres;
  final PlanetEntity? planetEntity;
  final String starship;

  PeopleEntity(
      {required this.name,
      required this.gender,
      required this.birthYear,
      required this.planetAddres,
      this.planetEntity,
      required this.starship});
}
