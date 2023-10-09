import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todolist/common/common.dart';
import 'package:flutter_todolist/common/util/utill.dart';
import 'package:flutter_todolist/common/widget/round_container_widget.dart';
import 'package:flutter_todolist/screen/main/riverpod/todo_list_provider.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

class WriteTodoDialog extends ConsumerStatefulWidget {
  const WriteTodoDialog({super.key});

  @override
  ConsumerState<WriteTodoDialog> createState() => _WriteTodoDialogState();
}

class _WriteTodoDialogState extends ConsumerState<WriteTodoDialog> {
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: RoundContainer(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: 20,
        ),
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
                    hintText: '다이소가서 치약 구매하기',
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
              CustomRadioButton(
                buttonLables: const [
                  '매우',
                  '보통',
                  '조금',
                ],
                buttonValues: const [
                  'very',
                  'normal',
                  'less',
                ],
                radioButtonValue: (value) {
                  print(value);
                },
                defaultSelected: 'normal',
                buttonTextStyle: ButtonTextStyle(
                  selectedColor: Colors.white,
                  unSelectedColor: Colors.black,
                  textStyle: TextStyle(fontSize: 16),
                ),
                width: 100,
                elevation: 0,
                enableShape: true,
                customShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                horizontal: true,
                enableButtonWrap: true,
                wrapAlignment: WrapAlignment.start,
                unSelectedBorderColor: Colors.black,
                unSelectedColor: Colors.white,
                selectedBorderColor: Colors.black,
                selectedColor: Colors.deepOrangeAccent.shade200,
                padding: 0,
                spacing: 0,
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
              isDate
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
                      ],
                    )
                  : Container(),
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
                              initialDate: _selectedDate ?? _selectedDate!,
                              firstDate: DateTime(2022),
                              lastDate: DateTime(2024),
                            );
                            if (result != null &&
                                result.isAfter(_selectedDate!) &&
                                isPeriod) {
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
              Positioned(
                bottom: 0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      if (textController.text.trim().isEmpty) {
                        showSnackBar(context, '할일을 입력해주세요.');
                        return;
                      }
                      ref.read(todoListProvider.notifier).add(
                          title: textController.text,
                          todoImportant: 'less',
                          periodEnd: _selectedDate!);
                      showSnackBar(context, '저장되었습니다.');
                      Navigator.pop(context);
                    },
                    child: Text('저장'),
                  ),
                ),
              ).p(20),
            ],
          ).p(16),
        ),
      ),
    ).p(20);
  }
}
