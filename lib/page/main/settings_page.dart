import 'package:flutter/material.dart';
import 'package:login_ui/components/change_theme.dart';
import 'package:login_ui/components/global/drawer.dart';
import 'package:login_ui/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? 'Dark' : 'Light';
    return Scaffold(
      appBar: AppBar(),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Row(
              children: [const ChangeTheme(), const SizedBox(width: 5), Text('Current Theme: $text')],
            ),
          ],
        ),
      ),
    );
  }
}
