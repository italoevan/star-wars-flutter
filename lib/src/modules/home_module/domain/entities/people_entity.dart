import 'package:star_wars/src/modules/home_module/domain/entities/planet_entity.dart';
import 'package:star_wars/src/modules/home_module/domain/entities/vehicle_entity.dart';

class PeopleEntity {
  final String name;
  final String gender;
  final String birthYear;
  final PlanetEntity planetEntity;
  final VehicleEntity vehicle;

  PeopleEntity(
      {required this.name,
      required this.gender,
      required this.birthYear,
      required this.planetEntity,
      required this.vehicle});
}
