import 'package:go_router/go_router.dart';
import 'package:flutter_todolist/common/routes/route_path.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: RoutePath.main,
      name: 'main',
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: RoutePath.splash,
      name: 'splash',
      builder: (context, state) => const SplashPage(),
    ),
  ],
  initialLocation: RoutePath.splash,
);