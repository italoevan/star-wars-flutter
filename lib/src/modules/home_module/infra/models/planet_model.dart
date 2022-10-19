import 'package:star_wars/src/modules/home_module/domain/entities/planet_entity.dart';

class PlanetModel extends PlanetEntity {
  PlanetModel._(
      {required super.name, required super.terrain, required super.diameter});

  factory PlanetModel.fromMap(Map<String, dynamic> map) {
    return PlanetModel._(
      name: map['name'],
      terrain: map['terrain'],
      diameter: map['diameter'],
    );
  }
}
