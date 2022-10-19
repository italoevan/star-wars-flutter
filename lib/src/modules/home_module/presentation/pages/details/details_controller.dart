import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:star_wars/src/modules/home_module/domain/entities/people_entity.dart';
import 'package:star_wars/src/modules/home_module/domain/entities/planet_entity.dart';
import 'package:star_wars/src/modules/home_module/domain/usecases/get_planet_info.dart';

abstract class IDetailsController {
  void init();
  PeopleEntity get peopleData;
  bool get isLoading;
}

class DetailsController extends GetxController implements IDetailsController {
  final IGetPlanetInfoUsecase iGetPlanetInfoUsecase;

  @override
  bool get isLoading => _isLoading.value;

  final _isLoading = true.obs;

  final PeopleEntity _entity = Modular.args.data;

  late final PlanetEntity _planetEntity;

  DetailsController({
    required this.iGetPlanetInfoUsecase,
  });

  @override
  PeopleEntity get peopleData => _entity;

  @override
  void init() async {
    _isLoading.value = true;
    try {
      _planetEntity = await iGetPlanetInfoUsecase(_entity.planetAddres);
    } catch (e) {}

    _isLoading.value = false;
  }
}
