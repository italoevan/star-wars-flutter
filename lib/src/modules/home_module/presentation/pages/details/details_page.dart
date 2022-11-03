import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:star_wars/src/consts/app_routes.dart';
import 'package:star_wars/src/modules/home_module/infra/models/film_detail_model.dart';
import 'package:star_wars/src/modules/home_module/presentation/pages/details/details_controller.dart';
import 'package:star_wars/src/modules/home_module/presentation/widgets/loading_widet.dart';
import 'package:star_wars/src/modules/home_module/presentation/widgets/data_widget.dart';
import 'package:star_wars/src/shared/widgets/film_widget.dart';
import 'package:star_wars/src/shared/widgets/generic_app_bar.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final IDetailsController controller = Modular.get();

  @override
  void initState() {
    controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:const GenericAppBar(title: "Detalhes",),
        body: Obx(
          () => controller.isLoading
              ? const LoadingWidget()
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        DataWidget(
                            title: "Nome:", value: controller.peopleData.name),
                        DataWidget(
                            title: "Gênero",
                            value: controller.peopleData.gender),
                        DataWidget(
                            title: "Ano de aniversário",
                            value: controller.peopleData.birthYear),
                        DataWidget(
                            title: "Nome do planeta",
                            value: controller.peopleData.planetEntity!.name),
                        DataWidget(
                            title: "Terreno do Planeta",
                            value: controller.peopleData.planetEntity!.terrain),
                        DataWidget(
                            title: "Diâmetro do Planeta",
                            value:
                                controller.peopleData.planetEntity!.diameter),
                        DataWidget(
                            title: "Nome da nave",
                            value:
                                controller.peopleData.starship?.name ?? "None"),
                        const Divider(),
                        CarouselSlider.builder(
                          itemCount: controller.films.length,
                          itemBuilder: (context, index, realIndex) =>
                              FilmWidget(
                            filmEntity: controller.films[index],
                            onTap: () =>
                                Modular.to.pushNamed(AppRoutes.filmDetails,
                                    arguments: FilmDetailModel(
                                      filmEntity: controller.films[index],
                                      peopleName: controller.peopleData.name,
                                    )),
                          ),
                          options: CarouselOptions(
                              autoPlay: true,
                              viewportFraction: 0.35,
                              enableInfiniteScroll: false),
                        )
                      ],
                    ),
                  ),
                ),
        ));
  }
}
