import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:star_wars/src/app_module.dart';
import 'package:star_wars/src/modules/app_widget.dart';

void main(List<String> args) {
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
