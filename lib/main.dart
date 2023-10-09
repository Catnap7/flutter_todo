import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todolist/common/routes/routes.dart';
import 'package:flutter_todolist/common/theme/custom/custom_theme.dart';
import 'package:flutter_todolist/common/theme/theme_data.dart';
import 'package:flutter_todolist/screen/main/tab/home/home_screen.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Todo',
      debugShowCheckedModeBanner: false,
      theme: CustomThemeData.themeData,
      routerConfig: router,
    );
  }
}
