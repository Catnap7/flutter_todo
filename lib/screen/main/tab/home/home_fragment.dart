import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todolist/common/common.dart';
import 'package:flutter_todolist/screen/dialog/write_todo_dialog.dart';
import 'package:flutter_todolist/screen/main/riverpod/todo_list_provider.dart';

class HomeFragment extends ConsumerStatefulWidget {
  const HomeFragment({super.key});

  @override
  ConsumerState<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends ConsumerState<HomeFragment> {
  @override
  Widget build(BuildContext context) {
    final todoList = ref.watch(todoListProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => WriteTodoDialog(),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
                child: Column(
              children: [
                '오늘 할일'.text.bold.headline6(context).make(),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: todoList.length,
                  itemBuilder: (context, index) {
                    final todo = todoList[index];
                    return ListTile(
                      title: todo.title.text.make(),
                      subtitle: todo.title.text.make(),
                      trailing: IconButton(
                        onPressed: () {
                          // ref.read(todoListProvider.notifier).remove(todo);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    );
                  },
                ),
              ],
            )),
            Card(
                child: Column(
              children: [
                '예정'.text.bold.headline6(context).make(),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: todoList.length,
                  itemBuilder: (context, index) {
                    final todo = todoList[index];
                    return ListTile(
                      title: todo.title.text.make(),
                      subtitle: todo.title.text.make(),
                      trailing: IconButton(
                        onPressed: () {
                          // ref.read(todoListProvider.notifier).remove(todo);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    );
                  },
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
