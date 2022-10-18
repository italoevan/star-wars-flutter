import 'package:flutter_modular/flutter_modular.dart';
import 'package:star_wars/src/modules/home_module/presentation/pages/home/home_page.dart';

class HomeModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: ((context, args) => const HomePage()),
        )
      ];
}
