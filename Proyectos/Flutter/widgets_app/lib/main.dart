import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gifs_app/config/router/app_router.dart';
import 'package:gifs_app/config/theme/app_theme.dart';
import 'package:gifs_app/presentation/providers/theme_provider.dart';
void main() {
  runApp(
    const ProviderScope(
      child: MainApp()),

    );
}

class MainApp extends ConsumerWidget {


  
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {

  final int selectedColor=ref.watch(selectedColorProvider);
  final bool isDarkMode=ref.watch(isDarkModeProvider);

    return MaterialApp.router(
      title: 'Flutter Widgets',
      routerConfig: approuter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: selectedColor, isDarkMode: isDarkMode).getTheme(),
    );
  }
}
