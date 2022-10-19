import 'package:star_wars/src/modules/home_module/domain/entities/people_entity.dart';
import 'package:star_wars/src/modules/home_module/infra/repositories/home_repository_impl.dart';

abstract class IGetPeopleListUsecase {
  Future<List<PeopleEntity>> call();
}

class GetPeopleListUsecase implements IGetPeopleListUsecase {
  final HomeRepository repository;

  const GetPeopleListUsecase({required this.repository});

  @override
  Future<List<PeopleEntity>> call() async {
    return await repository.getPeopleList();
  }
}
