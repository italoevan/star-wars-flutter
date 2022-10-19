import 'package:star_wars/src/modules/home_module/domain/entities/people_entity.dart';

class PeopleModel extends PeopleEntity {
  PeopleModel._(
      {required super.name,
      required super.gender,
      required super.birthYear,
      required super.planetEntity,
      required super.planetAddres,
      required super.starship});

  factory PeopleModel.fromMap(Map<String, dynamic> map) {
    return PeopleModel._(
        name: map['name'],
        gender: map['gender'],
        birthYear: map['birth_year'],
        planetAddres: map['homeworld'],
        planetEntity: null,
        starship: (map['starships'] as List).isNotEmpty
            ? map['starships'][0]
            : "None");
  }
}
