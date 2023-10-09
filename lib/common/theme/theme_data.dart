import 'package:flutter/material.dart';
import 'package:flutter_todolist/common/theme/constant/app_colors.dart';
import 'package:flutter_todolist/common/theme/custom/custom_font_weight.dart';
import 'package:flutter_todolist/common/theme/custom/custom_theme.dart';

class CustomThemeData {
  static ThemeData get themeData => ThemeData(
    useMaterial3: true,
    colorScheme: CustomTheme.colorScheme,
    fontFamily: 'Pretendard',
    textTheme: CustomTheme.textTheme,
    dividerTheme: const DividerThemeData(color: AppColors.outline),
    tabBarTheme: TabBarTheme(
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(color: AppColors.primary, width: 2),
      ),
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: CustomTheme.colorScheme.primary,
      labelStyle: CustomTheme.textTheme.titleSmall.semiBold,
      unselectedLabelColor: CustomTheme.colorScheme.contentSecondary,
      unselectedLabelStyle: CustomTheme.textTheme.titleSmall,
      overlayColor: MaterialStatePropertyAll<Color>(
        Colors.grey[300] ?? Colors.grey,
      ),
    ),
  );
}