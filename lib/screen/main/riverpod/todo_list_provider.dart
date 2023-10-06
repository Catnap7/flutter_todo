import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todolist/model/todo_model.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class TodoList extends StateNotifier<List<Todo>> {
  TodoList([List<Todo>? initialTodos]) : super(initialTodos ?? []);

  void add({required String title, required String todoImportant, DateTime? periodEnd}) {
    state = [
      ...state,
      Todo(
        id: _uuid.v4(),
        title: title,
        isCompleted: false,
        todoImportant: todoImportant,
        date: DateTime.now(),
        periodEnd: periodEnd,
      ),
    ];
  }

  void toggleComplete(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          Todo(
            id: todo.id,
            title: todo.title,
            isCompleted: !todo.isCompleted,
            todoImportant: todo.todoImportant,
            date: todo.date,
            periodEnd: todo.periodEnd,
          )
        else
          todo,
    ];
  }

  void edit({required String id, required String title}) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          Todo(
            id: todo.id,
            title: title,
            isCompleted: todo.isCompleted,
            todoImportant: todo.todoImportant,
            date: todo.date,
            periodEnd: todo.periodEnd,
          )
        else
          todo,
    ];
  }

  void delete(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }
}

final todoListProvider = StateNotifierProvider<TodoList, List<Todo>>((ref) {
  return TodoList( []);
});

enum Filter {
  none,
  completed,
  uncompleted,
}

final filterProvider = StateProvider((ref) => Filter.none);

final filteredTodoListProvider = Provider<List<Todo>>((ref) {
  final filter = ref.watch(filterProvider);
  final todoList = ref.watch(todoListProvider);

  switch (filter) {
    case Filter.none:
      return todoList;
    case Filter.completed:
      return todoList!.where((todo) => todo.isCompleted).toList();
    case Filter.uncompleted:
      return todoList!.where((todo) => !todo.isCompleted).toList();
    default:
      return todoList;
  }
});