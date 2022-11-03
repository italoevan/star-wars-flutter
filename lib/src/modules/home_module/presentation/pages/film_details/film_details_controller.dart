import 'package:flutter_modular/flutter_modular.dart';
import 'package:star_wars/src/modules/home_module/domain/entities/film_entity.dart';
import 'package:star_wars/src/modules/home_module/infra/models/film_detail_model.dart';

abstract class IFilmDetailsController {
  FilmDetailModel get filmEntity;
}

class FilmDetailsController implements IFilmDetailsController {
  final FilmDetailModel _filmEntity = Modular.args.data;

  @override
  FilmDetailModel get filmEntity => _filmEntity;
}
