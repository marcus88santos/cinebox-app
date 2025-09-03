import 'package:cinebox_app/ui/core/themes/theme.dart';
import 'package:cinebox_app/ui/login/login_screen.dart';
import 'package:cinebox_app/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class CineboxMainApp extends StatelessWidget {
  const CineboxMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinebox',
      theme: AppTheme.theme,
      routes: {
        '/': (_) => const SplashScreen(),
        '/login': (_) => const LoginScreen(),
        },
    );
  }
}