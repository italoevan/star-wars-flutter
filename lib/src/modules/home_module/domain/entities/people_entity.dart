import 'package:star_wars/src/modules/home_module/domain/entities/film_entity.dart';
import 'package:star_wars/src/modules/home_module/domain/entities/planet_entity.dart';
import 'package:star_wars/src/modules/home_module/domain/entities/starship_entity.dart';

class PeopleEntity {
  final String name;
  final String gender;
  final String birthYear;
  final String planetAddres;
  final PlanetEntity? planetEntity;
  final String starshipAddres;
  final Starship? starship;
  final List<String> filmListAddress;
  final List<FilmEntity>? films;

  PeopleEntity(
      {required this.name,
      required this.gender,
      required this.birthYear,
      required this.planetAddres,
      required this.filmListAddress,
      this.planetEntity,
      this.starship,
      this.films,
      required this.starshipAddres});

  PeopleEntity copyWith({
    String? name,
    String? gender,
    String? birthYear,
    String? planetAddres,
    PlanetEntity? planetEntity,
    List<FilmEntity>? films,
    List<String>? filmListAddress,
    String? starshipAddress,
    Starship? starship,
  }) {
    return PeopleEntity(
        name: name ?? this.name,
        filmListAddress: filmListAddress ?? this.filmListAddress,
        gender: gender ?? this.gender,
        birthYear: birthYear ?? this.birthYear,
        planetEntity: planetEntity ?? this.planetEntity,
        planetAddres: planetAddres ?? this.planetAddres,
        starship: starship ?? this.starship,
        films: films ?? this.films,
        starshipAddres: starshipAddress ?? starshipAddres);
  }
}
