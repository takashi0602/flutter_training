import 'package:flutter_training/ui/pages/first_page.dart';
import 'package:flutter_training/ui/pages/home_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/first',
      builder: (context, state) => const FirstPage(),
    ),
  ],
  initialLocation: '/first',
);
