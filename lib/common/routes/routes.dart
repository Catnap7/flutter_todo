import 'package:flutter_todolist/main.dart';
import 'package:flutter_todolist/screen/main/tab/home/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_todolist/common/routes/route_path.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: RoutePath.main,
      name: 'main',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
  initialLocation: RoutePath.main,
);