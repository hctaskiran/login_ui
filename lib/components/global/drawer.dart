import 'package:flutter/material.dart';
import 'package:login_ui/main.dart';
import 'package:login_ui/page/main/home_page.dart';
import 'package:login_ui/page/main/settings_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Column(
          children: [
            _listTile(context, Icons.home, 'Home',
                () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeView()))),
            _listTile(
                context,
                Icons.settings,
                'Settings',
                () =>
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SettingsPage()))),
            _listTile(context, Icons.logout, 'Logout', () => authService.signOut())
          ],
        ),
      ),
    );
  }

  Padding _listTile(BuildContext context, IconData icon, String title, Function()? onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: ListTile(title: Text(title), leading: Icon(icon), onTap: onTap),
    );
  }
}
