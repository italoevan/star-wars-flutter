import 'package:star_wars/src/modules/home_module/domain/entities/planet_entity.dart';
import 'package:star_wars/src/modules/home_module/domain/repositories/home_repository.dart';

abstract class IGetPlanetInfoUsecase {
  Future<PlanetEntity> call(String uri);
}

class GetPlanetInfoUsecase implements IGetPlanetInfoUsecase {
  final IHomeRepository repository;

  GetPlanetInfoUsecase({required this.repository});

  @override
  Future<PlanetEntity> call(String uri) async {
    var response = await repository.getPlanetInfo(uri);
    return response;
  }
}
