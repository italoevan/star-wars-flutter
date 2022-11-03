import 'package:star_wars/src/modules/home_module/domain/entities/film_entity.dart';

class FilmDetailModel {
  final FilmEntity filmEntity;
  final String peopleName;

  FilmDetailModel({
    required this.filmEntity,
    required this.peopleName,
  });
}
