import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubit/task/task_cubit.dart';
import 'package:to_do_app/widgets/item_task_list_view.dart';

class CompletedTasksView extends StatelessWidget {
  const CompletedTasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Completed Tasks')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 26.0, horizontal: 16),
        child: BlocBuilder<TaskCubit, TaskState>(
          builder: (context, state) {
            final completedTasks = state.tasksList
                .where((task) => task.isDone == true)
                .toList();

            if (completedTasks.isEmpty) {
              return const Center(
                child: Text(
                  "No completed tasks yet",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              );
            }

            return ItemTaskListView(tasks: completedTasks);
          },
        ),
      ),
    );
  }
}
