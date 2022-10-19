import 'package:star_wars/src/modules/home_module/domain/entities/film_entity.dart';
import 'package:star_wars/src/modules/home_module/domain/entities/people_entity.dart';
import 'package:star_wars/src/modules/home_module/domain/entities/planet_entity.dart';
import 'package:star_wars/src/modules/home_module/domain/entities/starship_entity.dart';
import 'package:star_wars/src/modules/home_module/domain/repositories/home_repository.dart';
import 'package:star_wars/src/modules/home_module/infra/datasource/get_film_datasource.dart';
import 'package:star_wars/src/modules/home_module/infra/datasource/get_people_list_by_name_datasource.dart';
import 'package:star_wars/src/modules/home_module/infra/datasource/get_people_list_datasource.dart';
import 'package:star_wars/src/modules/home_module/infra/datasource/get_planet_info_datasource.dart';
import 'package:star_wars/src/modules/home_module/infra/datasource/get_starship_datasource.dart';
import 'package:star_wars/src/modules/home_module/infra/models/film_model.dart';
import 'package:star_wars/src/modules/home_module/infra/models/people_model.dart';
import 'package:star_wars/src/modules/home_module/infra/models/planet_model.dart';
import 'package:star_wars/src/modules/home_module/infra/models/starship_model.dart';

class HomeRepository implements IHomeRepository {
  final IGetPeopleListDatasource iGetPeopleListDatasource;
  final IGetPeopleListByNameDatasource iGetPeopleListByName;
  final IGetPlanetInfoDatasource iGetPlanetInfoDatasource;
  final IGetStarshipDatasource iGetStarshipDatasource;
  final IGetFilmDatasource iGetFilmDatasource;

  HomeRepository({
    required this.iGetPeopleListDatasource,
    required this.iGetPeopleListByName,
    required this.iGetPlanetInfoDatasource,
    required this.iGetStarshipDatasource,
    required this.iGetFilmDatasource,
  });

  @override
  Future<List<PeopleEntity>> getPeopleList() async {
    var response = await iGetPeopleListDatasource();

    List<PeopleEntity> peopleList = response['results']
        .map<PeopleEntity>((v) => PeopleModel.fromMap(v))
        .toList();

    print(peopleList);

    return peopleList;
  }

  @override
  Future<List<PeopleEntity>> getByName(String name) async {
    var response = await iGetPeopleListByName(name);

    List<PeopleEntity> peopleList = response['results']
        .map<PeopleEntity>((v) => PeopleModel.fromMap(v))
        .toList();

    print(peopleList);

    return peopleList;
  }

  @override
  Future<PlanetEntity> getPlanetInfo(String uri) async {
    var response = await iGetPlanetInfoDatasource(uri);

    return PlanetModel.fromMap(response);
  }

  @override
  Future<Starship> getStarship(String uri) async {
    var response = await iGetStarshipDatasource(uri);

    return StarshipModel.fromMap(response);
  }

  @override
  Future<FilmEntity> getFilm(String uri) async {
    var response = await iGetFilmDatasource(uri);

    return FilmModel.fromMap(response);
  }
}
