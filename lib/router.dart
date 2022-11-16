import 'package:flutter/material.dart';
import 'package:flutter_training/ui/pages/first_page.dart';
import 'package:flutter_training/ui/pages/home_page.dart';
import 'package:go_router/go_router.dart';

part 'router.g.dart';

final GoRouter router = GoRouter(
  routes: $appRoutes,
  initialLocation: const FirstRoute().location,
);

@TypedGoRoute<HomeRoute>(
  path: '/home',
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context) => const HomePage();
}

@TypedGoRoute<FirstRoute>(
  path: '/first',
)
class FirstRoute extends GoRouteData {
  const FirstRoute();

  @override
  Widget build(BuildContext context) => const FirstPage();
}
