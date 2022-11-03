import 'package:flutter_modular/flutter_modular.dart';
import 'package:star_wars/src/modules/home_module/domain/usecases/get_films_usecase.dart';
import 'package:star_wars/src/modules/home_module/domain/usecases/get_people_by_name_usecase.dart';
import 'package:star_wars/src/modules/home_module/domain/usecases/get_people_list_usecase.dart';
import 'package:star_wars/src/modules/home_module/domain/usecases/get_planet_info_usecase.dart';
import 'package:star_wars/src/modules/home_module/domain/usecases/get_starship_name_usecase.dart';
import 'package:star_wars/src/modules/home_module/infra/datasource/get_film_datasource.dart';
import 'package:star_wars/src/modules/home_module/infra/datasource/get_people_list_by_name_datasource.dart';
import 'package:star_wars/src/modules/home_module/infra/datasource/get_people_list_datasource.dart';
import 'package:star_wars/src/modules/home_module/infra/datasource/get_planet_info_datasource.dart';
import 'package:star_wars/src/modules/home_module/infra/datasource/get_starship_datasource.dart';
import 'package:star_wars/src/modules/home_module/infra/repositories/home_repository_impl.dart';
import 'package:star_wars/src/modules/home_module/presentation/pages/details/details_controller.dart';
import 'package:star_wars/src/modules/home_module/presentation/pages/film_details/film_details_controller.dart';
import 'package:star_wars/src/modules/home_module/presentation/pages/home/home_controller.dart';
import 'package:star_wars/src/modules/home_module/presentation/pages/home/home_page.dart';

import 'domain/repositories/home_repository.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        ..._peopleListBinds(),
        ..._peopleListByNameBinds(),
        ..._detailsBinds(),
        Bind.factory<IHomeController>((i) => HomeController(
            getPeopleListUsecase: i(), getPeopleByNameUsecase: i())),
        Bind.factory<IFilmDetailsController>((i) => FilmDetailsController()),
        Bind.singleton<IHomeRepository>((i) => HomeRepository(
              iGetStarshipDatasource: i(),
              iGetPeopleListDatasource: i(),
              iGetFilmDatasource: i(),
              iGetPeopleListByName: i(),
              iGetPlanetInfoDatasource: i(),
            )),
      ];

  List<Bind> _peopleListBinds() {
    return [
      Bind.factory<IGetPeopleListDatasource>((i) => GetPeopleListDatasource()),
      Bind.factory<IGetPeopleListUsecase>(
          (i) => GetPeopleListUsecase(repository: i())),
    ];
  }

  List<Bind> _detailsBinds() {
    return [
      Bind.factory<IDetailsController>(
        (i) => DetailsController(
            iGetStarshipNameUsecase: i(),
            iGetPlanetInfoUsecase: i(),
            iGetFilmsUsecase: i()),
      ),
      Bind.factory<IGetPlanetInfoUsecase>(
          (i) => GetPlanetInfoUsecase(repository: i())),
      Bind.factory<IGetPlanetInfoDatasource>((i) => GetPlanetInfoDatasource()),
      Bind.factory<IGetStarshipNameUsecase>(
          (i) => GetStarshipNameUsecase(homeRepository: i())),
      Bind.factory<IGetStarshipDatasource>((i) => GetStarshipDatasource()),
      Bind.factory<IGetFilmDatasource>((i) => GetFilmDatasource()),
      Bind.factory((i) => GetFilmsUsecase(homeRepository: i()))
    ];
  }

  List<Bind> _peopleListByNameBinds() {
    return [
      Bind.factory<IGetPeopleByNameUsecase>(
          (i) => GetPeopleByNameUsecase(homeRepository: i())),
      Bind.factory<IGetPeopleListByNameDatasource>(
          (i) => GetPeopleListByNameDatasource()),
    ];
  }

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: ((context, args) => const HomePage()),
        ),
      ];
}
