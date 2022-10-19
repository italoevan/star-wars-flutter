import 'package:star_wars/src/modules/home_module/domain/entities/film_entity.dart';
import 'package:star_wars/src/modules/home_module/infra/repositories/home_repository_impl.dart';

abstract class IGetFilmsUsecase {
  Future<FilmEntity> call(String uri);
}

class GetFilmsUsecase implements IGetFilmsUsecase {
  final HomeRepository homeRepository;

  GetFilmsUsecase({required this.homeRepository});

  @override
  Future<FilmEntity> call(String uri) async{
    return await homeRepository.getFilm(uri);
  }
}
