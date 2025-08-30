import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends Equatable {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final bool isDone;

  const TaskModel({
    required this.title,
    required this.description,
    this.isDone = false,
  });

  TaskModel copyWith({String? title, String? description, bool? isDone}) {
    return TaskModel(
      title: title ?? this.title,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  List<Object?> get props => [title, description, isDone];
}
