import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_todolist/common/common.dart';
import 'package:flutter_todolist/common/widget/scaffold/bottom_dialog_scaffold.dart';
import 'package:flutter_todolist/common/widget/w_round_container.dart';
import 'package:after_layout/after_layout.dart';

class WriteTodoDialog extends DialogWidget {
  WriteTodoDialog({super.key});

  @override
  DialogState<WriteTodoDialog> createState() => _WriteTodoDialogState();
}

class _WriteTodoDialogState extends DialogState<WriteTodoDialog> {
  DateTime _selectedDate = DateTime.now();
  final textController = TextEditingController();
  final node = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BottomDialogScaffold(
      body: RoundContainer(
        color: context.backgroundColor,
        child: Column(
          children: [
            Row(
              children: [
                '할일을 작성해주세요'.text.bold.size(20).make(),
                spacer,
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.calendar_month),
                ),
                height20,
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    focusNode: node,
                    decoration: InputDecoration(
                      hintText: '할일을 입력해주세요',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
