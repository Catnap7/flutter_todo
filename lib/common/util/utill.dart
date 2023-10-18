import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

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

class CalendarEvent {
  final String title;

  const CalendarEvent(this.title);

  @override
  String toString() => title;
}



/*final _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
    key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
    value: (item) => List.generate(
        item % 4 + 1, (index) => CalendarEvent('Event $item | ${index + 1}')))
  ..addAll({
    kToday: [
      CalendarEvent('Today\'s Event 1'),
      CalendarEvent('Today\'s Event 2'),
    ],
  });*/



int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
