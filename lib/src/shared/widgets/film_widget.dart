import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:star_wars/src/modules/home_module/domain/entities/film_entity.dart';

class FilmWidget extends StatelessWidget {
  final FilmEntity filmEntity;
  final VoidCallback? onTap;

  const FilmWidget({
    super.key,
    this.onTap,
    required this.filmEntity,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            height: 80,
            width: 90,
            child: Image.asset("assets/images/film_image.jpg"),
          ),
          const SizedBox(
            height: 10,
          ),
          AutoSizeText(filmEntity.title),
        ],
      ),
    );
  }
}
