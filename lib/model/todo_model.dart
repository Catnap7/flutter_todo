import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = Uuid();

class Todo extends Equatable {
  final String id;
  final String desc;
  final bool completed;

  Todo({
    String? id,
    required this.desc,
    this.completed = false
  }): id = id ?? uuid.v4();

  @override
  List<Object?> get props => [id, desc, completed];

  // TODO의 인스턴스를 출력할때 읽을수있는 형태로 출력하도록 설정한다
  // print(stringfy(todos))뭐 이런식으로 사용하나봄
  @override
  bool get stringify => true;
}

enum Filter{
  all,
  active,
  completed,
}
