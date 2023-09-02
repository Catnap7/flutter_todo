import 'package:flutter/material.dart';
import 'package:flutter_todolist/screen/dialog/d_write_todo.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 34.0,
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
        title: Text('할일', style: Theme.of(context).textTheme.bodyMedium),
      ),
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

          ],
        ),
      ),
    );
  }
}
