import 'package:gifs_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';


// GoRouter configuration
final approuter = GoRouter(
  initialLocation:'' ,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/buttons',
      builder: (context, state) => const ButtonsScreen(),
    ),

    GoRoute(
      path: '/cards',
      builder: (context, state) => const Cards_screen(),
    ),
  ],
);