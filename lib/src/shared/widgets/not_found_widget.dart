import 'package:flutter/cupertino.dart';

class NotFoundWidget extends StatelessWidget {
  final double height;
  final double width;
  const NotFoundWidget({super.key, this.height = 200, this.width = 200});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/not_found.webp",
      height: height,
      width: width,
    );
  }
}
