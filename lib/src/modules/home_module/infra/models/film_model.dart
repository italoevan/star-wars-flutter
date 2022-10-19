import 'package:star_wars/src/modules/home_module/domain/entities/film_entity.dart';

class FilmModel extends FilmEntity {
  FilmModel._(
      {required super.title,
      required super.director,
      required super.date,
      required super.producer});

  factory FilmModel.fromMap(Map<String, dynamic> map) {
    return FilmModel._(
      title: map['title'],
      director: map['director'],
      date: map['release_date'],
      producer: map['producer'],
    );
  }
}
