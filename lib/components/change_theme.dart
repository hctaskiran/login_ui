import 'package:flutter/material.dart';
import 'package:login_ui/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class ChangeTheme extends StatefulWidget {
  const ChangeTheme({
    Key? key,
  }) : super(key: key);

  @override 
  State<ChangeTheme> createState() => _ChangeThemeState();
}

class _ChangeThemeState extends State<ChangeTheme> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Switch.adaptive(
        value: themeProvider.isDarkMode,
        onChanged: (value) {
          final provider = Provider.of<ThemeProvider>(context, listen: false);
          setState(() {
            provider.toggleTheme(value);
          });
        });
  }
}
