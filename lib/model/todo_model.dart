import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_model.freezed.dart';

@freezed
sealed class Todo with _$Todo {
   factory Todo({
    required String title,
    bool isCompleted,
    DateTime? periodEnd,
    DateTime? date,
    String todoImportant,
}) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

}
