import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todolist/common/util/utill.dart';
import 'package:flutter_todolist/screen/main/riverpod/todo_list_provider.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarFragment extends ConsumerStatefulWidget {
  const CalendarFragment({super.key});

  @override
  ConsumerState<CalendarFragment> createState() => _CalendarFragmentState();
}

class _CalendarFragmentState extends ConsumerState<CalendarFragment> {
  late final ValueNotifier<List<CalendarEvent>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final kEvents = LinkedHashMap<DateTime, List<CalendarEvent>>(
    equals: isSameDay,
    hashCode: getHashCode,
  )..addAll(_kEventSource);

  @override
  void initState() {
    super.initState();
    _selectedEvents = ValueNotifier(_getEventsForDay(_focusedDay));
  }

  List<CalendarEvent> _getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        // _rangeStart = null; // Important to clean those
        // _rangeEnd = null;
        // _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });
      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  @override
  Widget build(BuildContext context) {

    // final filteredTodoList = ref.watch(filteredTodoListProvider);


    return Column(
      children: [
        TableCalendar(
          locale: 'ko_KR',
          firstDay: kFirstDay,
          lastDay: kLastDay,
          focusedDay: _focusedDay,
          calendarFormat: _calendarFormat,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          eventLoader: _getEventsForDay,
          onDaySelected: _onDaySelected,
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
        ),
        const SizedBox(height: 8.0),
        Expanded(
          child: ValueListenableBuilder<List<CalendarEvent>>(
            valueListenable: _selectedEvents,
            builder: (context, value, _) {
              return ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 4.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ListTile(
                      onTap: () => print('${value[index]}'),
                      title: Text('${value[index]}'),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
