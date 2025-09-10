import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubit/taskcubit/task_cubit.dart';
import 'package:to_do_app/widgets/item_task.dart';

class ToDoTasksView extends StatelessWidget {
  const ToDoTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('To Do Tasks')),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 26.0, horizontal: 16),
          child: BlocBuilder<TaskCubit, TaskState>(
            builder: (context, state) {
              if (state is UpdatedTaskState) {
                final toDoList = state.tasksList
                    .where((task) => !task.isDone)
                    .toList();

                return ItemTaskListView(tasks: toDoList);
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
