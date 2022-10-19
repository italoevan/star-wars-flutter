import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:star_wars/src/modules/home_module/presentation/pages/details/details_controller.dart';
import 'package:star_wars/src/modules/home_module/presentation/widgets/loading_widet.dart';
import 'package:star_wars/src/modules/home_module/presentation/widgets/people_data_widget.dart';

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
        appBar: AppBar(title: const Text("Details")),
        body: Obx(
          () => controller.isLoading
              ? const LoadingWidget()
              : Column(
                  children: [
                    PeopleDataWidget(
                        title: "Nome:", value: controller.peopleData.name),
                    PeopleDataWidget(
                        title: "Gênero", value: controller.peopleData.gender),
                    PeopleDataWidget(
                        title: "Ano de aniversário",
                        value: controller.peopleData.birthYear)
                  ],
                ),
        ));
  }
}
