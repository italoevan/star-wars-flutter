import 'package:get/get.dart';
import 'package:star_wars/src/modules/home_module/domain/entities/people_entity.dart';
import 'package:star_wars/src/modules/home_module/domain/usecases/get_people_by_name_usecase.dart';
import 'package:star_wars/src/modules/home_module/domain/usecases/get_people_list_usecase.dart';

abstract class IHomeController {
  List<PeopleEntity> get people;
  void getPeopleList();
  void getPeopleByName(String name);
  bool get isLoading;
  Future init();
}

class HomeController extends GetxController implements IHomeController {
  final IGetPeopleListUsecase getPeopleListUsecase;
  final IGetPeopleByNameUsecase getPeopleByNameUsecase;

  final _isLoading = true.obs;
  final _peopleList = <PeopleEntity>[].obs;

  @override
  bool get isLoading => _isLoading.value;

  @override
  List<PeopleEntity> get people => _peopleList.value;

  HomeController({
    required this.getPeopleListUsecase,
    required this.getPeopleByNameUsecase,
  });

  @override
  Future init() async {
    getPeopleList();
  }

  @override
  void getPeopleByName(String name) async {
    _isLoading.value = true;

    try {
      _peopleList.value = await getPeopleByNameUsecase(name);
    } catch (e) {
      _isLoading.value = false;
    }
    _isLoading.value = false;
  }

  @override
  void getPeopleList() async {
    _isLoading.value = true;

    try {
      _peopleList.value = await getPeopleListUsecase();
    } catch (e) {
      print(e);
      _isLoading.value = false;
    }
    _isLoading.value = false;
  }
}
