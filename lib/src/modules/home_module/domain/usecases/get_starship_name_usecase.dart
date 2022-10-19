import 'package:star_wars/src/modules/home_module/domain/entities/starship_entity.dart';
import 'package:star_wars/src/modules/home_module/domain/repositories/home_repository.dart';

abstract class IGetStarshipNameUsecase {
  Future<Starship> call(String uri);
}

class GetStarshipNameUsecase implements IGetStarshipNameUsecase {

  final IHomeRepository homeRepository;

  GetStarshipNameUsecase({
    required this.homeRepository,
  });

  @override
  Future<Starship> call(String uri) async {
    var response = await homeRepository.getStarship(uri);
    return response;
  }
}
