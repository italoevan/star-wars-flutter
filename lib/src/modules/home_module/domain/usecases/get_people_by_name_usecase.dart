import 'package:star_wars/src/modules/home_module/domain/entities/people_entity.dart';
import 'package:star_wars/src/modules/home_module/domain/repositories/home_repository.dart';

abstract class IGetPeopleByNameUsecase {
  Future<List<PeopleEntity>> call(String name);
}

class GetPeopleByNameUsecase implements IGetPeopleByNameUsecase {
  final IHomeRepository homeRepository;

  GetPeopleByNameUsecase({
    required this.homeRepository,
  });

  @override
  Future<List<PeopleEntity>> call(String name) async {
    return await homeRepository.getByName(name);
  }
}
