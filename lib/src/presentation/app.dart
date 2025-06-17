import 'package:anime_flix/core/constants/app_text.dart';
import 'package:anime_flix/core/constants/app_theme.dart';
import 'package:anime_flix/src/presentation/routes/routes.dart';
import 'package:flutter/material.dart';

class AnimeApp extends StatelessWidget {
  const AnimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = MediaQuery.platformBrightnessOf(context) == Brightness.dark;

    return MaterialApp.router(
      routerConfig: AppRoutes.router,
      title: AppText.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
    );
  }
}