import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/components/theme/dark.dart';
import 'package:login_ui/components/theme/light.dart';
import 'package:login_ui/firebase_options.dart';
import 'package:login_ui/page/auth/auth.dart';
import 'package:login_ui/page/auth/auth_service.dart';
import 'package:login_ui/provider/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

final authService = AuthService();

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            theme: CLight.lightTheme,
            darkTheme: CDark.darkTheme,
            home: const AuthPage(),
          );
        });
  }
}
