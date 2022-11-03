import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingBouncingGrid.circle(),
    );
  }
}
