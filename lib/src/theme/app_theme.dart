import 'package:flutter/material.dart';

class AppTheme {
  static final ValueNotifier<bool> _isDark = ValueNotifier(false);

  static const font = 'Starjedi';

  static ValueNotifier<bool> get isDark => _isDark;

  static void changeTheme() {
    AppTheme._isDark.value = !AppTheme._isDark.value;
  }

  static ThemeData get theme => isDark.value
      ? ThemeData(brightness: Brightness.dark, fontFamily: font)
      : ThemeData(
          brightness: Brightness.light,
          fontFamily: font,
        );
}
