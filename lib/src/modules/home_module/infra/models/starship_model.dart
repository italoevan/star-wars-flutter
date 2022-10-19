import 'package:star_wars/src/modules/home_module/domain/entities/starship_entity.dart';

class StarshipModel extends Starship {
  StarshipModel._({required super.name});

  factory StarshipModel.fromMap(Map<String,dynamic> map){
    return StarshipModel._(name: map['name']);
  }
}