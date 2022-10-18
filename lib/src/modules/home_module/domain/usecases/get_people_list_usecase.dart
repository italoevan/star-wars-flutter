import 'package:star_wars/src/modules/home_module/domain/entities/people_entity.dart';

abstract class IGetPeopleListUsecase {
  Future<List<PeopleEntity>> call();
}

class GetPeopleListUsecase implements IGetPeopleListUsecase {
  @override
  Future<List<PeopleEntity>> call() {
    throw UnimplementedError();
  }
}
