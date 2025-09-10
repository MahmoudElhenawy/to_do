import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/model/task_model.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial()) {
    _loadTasks();
  }

  final Box<TaskModel> taskBox = Hive.box<TaskModel>('tasks');

  void _loadTasks() {
    final tasks = taskBox.values.toList();
    emit(UpdatedTaskState(tasks));
  }

  void addTask(TaskModel task) {
    taskBox.add(task);
    final updatedTasks = taskBox.values.toList();
    emit(UpdatedTaskState(updatedTasks));
  }

  void deleteTask(int index) {
    final taskKey = taskBox.keyAt(index);
    taskBox.delete(taskKey);
    final updatedTasks = taskBox.values.toList();
    emit(UpdatedTaskState(updatedTasks));
  }

  /// تغيير حالة Done
  void toggleTaskDone(int index) {
    final taskKey = taskBox.keyAt(index);
    final currentTask = taskBox.get(taskKey);

    if (currentTask != null) {
      final updatedTask = currentTask.copyWith(isDone: !currentTask.isDone);
      taskBox.put(taskKey, updatedTask);
      emit(UpdatedTaskState(taskBox.values.toList()));
    }
  }
}
