import 'package:star_wars/src/modules/home_module/domain/entities/people_entity.dart';
import 'package:star_wars/src/modules/home_module/domain/repositories/home_repository.dart';

class HomeRepository implements IHomeRepository {
  @override
  Future<List<PeopleEntity>> getPeopleList() {
    throw UnimplementedError();
  }
}
