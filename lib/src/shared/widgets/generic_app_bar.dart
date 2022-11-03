import 'package:dark_light_button/dark_light_button.dart';
import 'package:flutter/material.dart';
import 'package:star_wars/src/theme/app_theme.dart';

class GenericAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const GenericAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      actions: [
        DarlightButton(
          onChange: (v) {
            AppTheme.changeTheme();
          },
          type: Darlights.DarlightOne,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
