import 'package:flutter/material.dart';
import 'package:star_wars/src/modules/home_module/domain/entities/film_entity.dart';

class FilmWidget extends StatelessWidget {
  final FilmEntity filmEntity;
  const FilmWidget({
    super.key,
    required this.filmEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(filmEntity.title),
        SizedBox(
          height: 80,
          width: 90,
          child: Image.asset("assets/images/film_image.jpg"),
        ),
      ],
    );
  }
}
