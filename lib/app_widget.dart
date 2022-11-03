import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:star_wars/src/theme/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: AppTheme.isDark,
        builder: ((context, child) => MaterialApp.router(
              routeInformationParser: Modular.routeInformationParser,
              routerDelegate: Modular.routerDelegate,
              theme: AppTheme.theme,
            )));
  }
}
