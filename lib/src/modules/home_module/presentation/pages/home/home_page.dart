import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:star_wars/src/consts/app_routes.dart';
import 'package:star_wars/src/modules/home_module/presentation/pages/home/home_controller.dart';
import 'package:star_wars/src/modules/home_module/presentation/widgets/loading_widet.dart';
import 'package:star_wars/src/shared/widgets/custom_text_field.dart';
import 'package:star_wars/src/shared/widgets/generic_app_bar.dart';
import 'package:star_wars/src/shared/widgets/not_found_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final IHomeController controller = Modular.get<IHomeController>();

  @override
  void initState() {
    controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GenericAppBar(title: "Star Wars"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomTextField(
              onChanged: (value) {
                controller.getPeopleByName(value);
              },
            ),
            Obx(
              () => controller.isLoading
                  ? const Expanded(child: Center(child: LoadingWidget()))
                  : controller.listIsEmpty
                      ? const NotFoundWidget()
                      : Expanded(
                          child: ListView.builder(
                              itemCount: controller.people.length,
                              itemBuilder: (context, index) => ListTile(
                                    onTap: () => Modular.to.pushNamed(
                                      AppRoutes.details,
                                      arguments: controller.people[index],
                                    ),
                                    title: Text(controller.people[index].name),
                                  )),
                        ),
            )
          ],
        ),
      ),
    );
  }
}
