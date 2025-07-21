import 'package:flutter/material.dart';
import 'views/login_screen.dart';
import 'themes/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wow Flutter App',
      theme: AppTheme.darkTheme,
      home: const LoginScreen(),
    );
  }
}
