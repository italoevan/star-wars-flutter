import 'package:flutter/material.dart';
import 'package:star_wars/src/shared/widgets/custom_text_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Star Wars"),
      ),
      body: Column(
        children: const [CustomTextField()],
      ),
    );
  }
}
