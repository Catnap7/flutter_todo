import 'package:flutter/material.dart';

 showSnackBar(BuildContext context, String message) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    ),
  );
}

String getImportantText(String important) {
  switch (important) {
    case 'less':
      return '낮음';
    case 'normal':
      return '보통';
    case 'very':
      return '높음';
    default:
      return '보통';
  }
}

String getDifferenceDate(DateTime date) {
  final now = DateTime.now();
  final difference = now.difference(date);
  final days = difference.inDays;
  final hours = difference.inHours;


  if (days > 0) {
    return 'D-$days';
  } else if (hours > 0) {
    return 'D-$hours';
  } else {
    return 'D-Day';
  }
}