import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:star_wars/src/modules/home_module/domain/entities/film_entity.dart';
import 'package:star_wars/src/modules/home_module/domain/entities/people_entity.dart';
import 'package:star_wars/src/modules/home_module/domain/usecases/get_films_usecase.dart';
import 'package:star_wars/src/modules/home_module/domain/usecases/get_planet_info_usecase.dart';
import 'package:star_wars/src/modules/home_module/domain/usecases/get_starship_name_usecase.dart';

abstract class IDetailsController {
  void init();
  PeopleEntity get peopleData;
  bool get isLoading;
  List<FilmEntity> get films;
}

class DetailsController extends GetxController implements IDetailsController {
  final IGetPlanetInfoUsecase iGetPlanetInfoUsecase;
  final IGetStarshipNameUsecase iGetStarshipNameUsecase;
  final IGetFilmsUsecase iGetFilmsUsecase;

  @override
  bool get isLoading => _isLoading.value;

  final _isLoading = true.obs;

  @override
  PeopleEntity peopleData = Modular.args.data;

  final List<FilmEntity> _films = [];

  @override
  List<FilmEntity> get films => _films;

  DetailsController({
    required this.iGetPlanetInfoUsecase,
    required this.iGetStarshipNameUsecase,
    required this.iGetFilmsUsecase,
  });

  @override
  void init() async {
    _isLoading.value = true;
    await _getPlanetInfo();
    await _getStarshipInfo();
    await _getFilms();
    _isLoading.value = false;
  }

  Future _getPlanetInfo() async {
    try {
      var response = await iGetPlanetInfoUsecase(peopleData.planetAddres);
      peopleData = peopleData.copyWith(planetEntity: response);
    } catch (e) {}
  }

  Future _getStarshipInfo() async {
    if (peopleData.starshipAddres == "None") {
      return;
    }
    var response = await iGetStarshipNameUsecase(peopleData.starshipAddres);
    peopleData = peopleData.copyWith(starship: response);
  }

  Future _getFilms() async {
    for (int i = 0; i < peopleData.filmListAddress.length; i++) {
      var url = peopleData.filmListAddress[i];
      var film = await iGetFilmsUsecase(url);

      _films.add(film);
    }

    peopleData = peopleData.copyWith(films: _films);
  }
}
