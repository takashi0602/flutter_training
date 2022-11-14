import 'package:flutter_training/ui/pages/first_page.dart';
import 'package:flutter_training/ui/pages/home_page.dart';
import 'package:go_router/go_router.dart';

class PagePath {
  static const String home = '/home';
  static const String first = '/first';
}

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: PagePath.home,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: PagePath.first,
      builder: (context, state) => const FirstPage(),
    ),
  ],
  initialLocation: PagePath.first,
);
