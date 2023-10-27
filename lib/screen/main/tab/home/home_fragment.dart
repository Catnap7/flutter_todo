import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todolist/common/common.dart';
import 'package:flutter_todolist/common/util/utill.dart';
import 'package:flutter_todolist/screen/dialog/write_todo_dialog.dart';
import 'package:flutter_todolist/screen/main/riverpod/todo_list_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeFragment extends ConsumerStatefulWidget {
  const HomeFragment({super.key});

  @override
  ConsumerState<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends ConsumerState<HomeFragment> {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    _prefs.then((value) {
      final todoList = value.getStringList("todoList");
      if (todoList != null) {
        ref.read(todoListProvider.notifier).add();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredTodoList = ref.watch(filteredTodoListProvider);
    final filter = ref.watch(filterProvider);
    final completedTodoCount = ref.watch(completedTodoCountProvider);
    final uncompletedTodoCount = ref.watch(todoListProvider).length - completedTodoCount;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const WriteTodoDialog(),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                "진행중:$uncompletedTodoCount / 완료:$completedTodoCount".text.bodyText1(context).make(),
                DropdownButton(
                  value: filter,
                  onChanged: (value) =>
                      ref.read(filterProvider.notifier).state = value as Filter,
                  items: Filter.values.map((e) => DropdownMenuItem(
                            value: e,
                            child: e == Filter.uncompleted
                                ? "미완료".text.make()
                                : e == Filter.none
                                    ? "전체".text.make()
                                    : "완료".text.make(),
                          ))
                      .toList(),
                ),
              ],
            ),
            Card(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: filteredTodoList.length,
                    itemBuilder: (context, index) {
                      final todo = filteredTodoList[index];
                      return ListTile(
                        title: todo.title.text.make(),
                        subtitle:
                            todo.date == null ?
                            "중요도: ${getImportantText(todo.todoImportant)}"
                                .text
                                .make() : "중요도: ${getImportantText(todo.todoImportant)} / ${todo.date}"
                                .text
                                .make(),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  ref
                                      .read(todoListProvider.notifier)
                                      .toggleComplete(todo.id);
                                },
                                icon: Icon(
                                  todo.isCompleted
                                      ? Icons.check_box
                                      : Icons.check_box_outline_blank,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  // ref.read(todoListProvider.notifier).remove(todo);
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
