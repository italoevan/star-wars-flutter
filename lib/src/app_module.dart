import 'package:flutter_modular/flutter_modular.dart';
import 'package:star_wars/src/consts/app_routes.dart';
import 'package:star_wars/src/modules/home_module/home_module.dart';
import 'package:star_wars/src/modules/home_module/presentation/pages/details/details_page.dart';
import 'package:star_wars/src/modules/home_module/presentation/pages/film_details/film_details_page.dart';
import 'package:star_wars/src/modules/splash_module/presentation/pages/splash_page.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const SplashPage(),
        ),
        ChildRoute(AppRoutes.details,
            child: (context, arg) => const DetailsPage()),
        ChildRoute(AppRoutes.filmDetails,
            child: (context, arg) =>  FilmDetailsPage()),
        ModuleRoute(AppRoutes.homeModule, module: HomeModule())
      ];
}
