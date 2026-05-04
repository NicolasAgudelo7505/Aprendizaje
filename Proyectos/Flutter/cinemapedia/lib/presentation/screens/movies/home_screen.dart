import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



class HomeScreen extends StatelessWidget {

  static const name='Home-screen';

  final Widget childView;

  const HomeScreen({super.key, required this.childView, required StatefulNavigationShell child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: childView,
      );
  }
}

