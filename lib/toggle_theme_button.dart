import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tipcalc/theme_provider.dart';

class ToggleThemeButton extends StatelessWidget {
  const ToggleThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<ThemeProvider>(context);

    return IconButton(
      onPressed: themeModel.toggleTheme,
      icon: (themeModel.isDarkTheme
          ? Icon(Icons.wb_sunny)
          : Icon(Icons.nightlight)),
    );
  }
}
