import 'package:flutter_riverpod/flutter_riverpod.dart';

final todoListProvider = StateNotifierProvider<TodoList, List<Todo>>((ref) {
  return TodoList([
    Todo(
      id: '1',
      description: 'Buy food for da kitty',
      isCompleted: false,
    ),
    Todo(
      id: '2',
      description: 'Charge the phone',
      isCompleted: true,
    ),
    Todo(
      id: '3',
      description: 'Build a todo app',
      isCompleted: false,
    ),
  ]);
});