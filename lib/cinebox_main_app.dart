import 'package:cinebox_app/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

fu-class CineboxMainApp extends StatelessWidget {
  const CineboxMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinebox',
      routes: {
        '/': (_) => const SplashScreen()},
    );
  }
}