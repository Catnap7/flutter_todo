import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_model.freezed.dart';
part 'todo_model.g.dart';

@freezed
sealed class Todo with _$Todo {
  factory Todo({
    required String id,
    required String title,
    required bool isCompleted,
    DateTime? periodEnd,
    DateTime? date,
    required String todoImportant,
}) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

}
