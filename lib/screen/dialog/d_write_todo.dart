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

  final DateTime now = DateTime.now();
  DateTime? _selectedDate = DateTime.now();
  DateTime? _selectedEndPeriod;
  final textController = TextEditingController();
  final node = FocusNode();

  // 기간 설정 여부
  bool isPeriod = false;
  // 구체적인 날짜 설정 여부
  bool isDate = false;

  @override
  Widget build(BuildContext context) {
    return BottomDialogScaffold(
      body: RoundContainer(
        color: context.backgroundColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  '할일을 작성해주세요'.text.bold.headline6(context).make(),
                  spacer,
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.calendar_month),
                  ),
                  height20,
                ],
              ),
              TextFormField(
                  controller: textController,
                  focusNode: node,
                  maxLength: 100,
                  decoration: InputDecoration(
                    hintText: '다이소가서 물건 사기 (세제, 치약 등)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "제품명을 입력해주세요.";
                    }
                    return null;
                  }),
              '얼마나 중요한 일 인가요?'.text.bold.headline6(context).make(),
              const SizedBox(height: 8),
              SizedBox(
                height: 50,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isPeriod = !isPeriod;
                          });
                        },
                        child: Text('조금'),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('적당히'),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('매우'),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('절대 까먹어서는 안됨'),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ),
              ),
              SwitchListTile.adaptive(
                contentPadding: EdgeInsets.zero,
                title: '날짜 설정'.text.bold.headline6(context).make(),
                value: isDate,
                onChanged: (value) {
                  setState(() {
                    isDate = value;
                  });
                },
              ),
              isDate ?
              Row(
                children: [
                  IconButton(
                    onPressed: () async {
                      final result = await showDatePicker(
                        context: context,
                        initialDate: now,
                        firstDate: DateTime(2022),
                        lastDate: DateTime(2024),
                      );
                      if (result != null) {
                        setState(() {
                          _selectedDate = result;
                        });
                      }
                    },
                    icon: Icon(Icons.calendar_today),
                  ),
                  Text(_selectedDate.toString().split(' ')[0]),
                ],
              ) : Container(),

              SwitchListTile.adaptive(
                contentPadding: EdgeInsets.zero,
                title: '기간 설정'.text.bold.headline6(context).make(),
                value: isPeriod,
                onChanged: (value) {
                  setState(() {
                    isPeriod = value;
                  });
                },
              ),
              isPeriod
                  ? Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            final result = await showDatePicker(
                              context: context,
                              initialDate: now,
                              firstDate: DateTime(2022),
                              lastDate: DateTime(2024),
                            );
                            if (result != null) {
                              setState(() {
                                _selectedDate = result;
                              });
                            }
                          },
                          icon: Icon(Icons.calendar_today),
                        ),
                        Text(_selectedDate.toString().split(' ')[0]),
                        SizedBox(
                          width: 8,
                        ),
                        '~'.text.bodyText1(context).make(),
                        IconButton(
                          onPressed: () async {
                            final result = await showDatePicker(
                              context: context,
                              initialDate: _selectedDate ?? _selectedDate! ,
                              firstDate: DateTime(2022),
                              lastDate: DateTime(2024),
                            );
                            if (result != null && result.isAfter(_selectedDate!) && isPeriod) {
                              setState(() {
                                _selectedDate = result;
                              });
                            }
                          },
                          icon: Icon(Icons.calendar_today),
                        ),
                        Text(_selectedDate.toString().split(' ')[0]),
                        SizedBox(
                          width: 8,
                        ),
                        '까지'.text.bodyText1(context).make(),
                      ],
                    )
                  : Container(),
            ],
          ).p(16),
        ),
      ),
    );
  }
}
