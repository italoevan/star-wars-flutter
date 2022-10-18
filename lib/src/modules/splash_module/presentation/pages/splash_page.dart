import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:star_wars/src/consts/app_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), _toHomePage);
    super.initState();
  }

  void _toHomePage(){
    Modular.to.pushReplacementNamed(AppRoutes.homeModule);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SafeArea(
        child: Column(
          children: [
            const Text(
              "   Star\n Wars Api",
              style: TextStyle(
                fontSize: 60,
                color: Colors.white,
              ),
            ),
            Image.asset("assets/images/young_yoda.png")
          ],
        ),
      ),
    );
  }
}
