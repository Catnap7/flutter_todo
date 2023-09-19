import 'package:flutter/material.dart';
import 'package:flutter_todolist/common/routes/routes.dart';
import 'package:flutter_todolist/common/theme/text_theme.dart';
import 'package:flutter_todolist/screen/main/tab/home/s_home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Todo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        textTheme: CustomTextTheme.customTextTheme,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
