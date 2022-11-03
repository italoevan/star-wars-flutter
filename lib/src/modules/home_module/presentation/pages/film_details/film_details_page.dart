import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:star_wars/src/modules/home_module/presentation/pages/film_details/film_details_controller.dart';
import 'package:star_wars/src/modules/home_module/presentation/widgets/data_widget.dart';
import 'package:star_wars/src/shared/widgets/generic_app_bar.dart';

class FilmDetailsPage extends StatelessWidget {
  FilmDetailsPage({super.key});

  final FilmDetailsController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GenericAppBar(
        title: controller.filmEntity.peopleName,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            DataWidget(
                title: "Título", value: controller.filmEntity.filmEntity.title),
            DataWidget(
                title: "Diretor",
                value: controller.filmEntity.filmEntity.director),
            DataWidget(
                title: "Data", value: controller.filmEntity.filmEntity.date),
            DataWidget(
                title: "Produtores",
                value: controller.filmEntity.filmEntity.producer)
          ],
        ),
      ),
    );
  }
}
