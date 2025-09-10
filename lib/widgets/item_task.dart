import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubit/taskcubit/task_cubit.dart';
import 'package:to_do_app/model/task_model.dart';

class ItemTaskListView extends StatelessWidget {
  final List<TaskModel> tasks;
  const ItemTaskListView({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Container(
            width: double.infinity,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xff282828),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  value: task.isDone,
                  onChanged: (_) {
                    context.read<TaskCubit>().toggleTaskDone(index);
                  },
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        task.title,
                        style: Theme.of(context).textTheme.displaySmall
                            ?.copyWith(
                              fontSize: 18,
                              decoration: task.isDone
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              color: task.isDone
                                  ? const Color(0xffC6C6C6)
                                  : Colors.white,
                              decorationColor: const Color(0xffC6C6C6),
                            ),
                      ),
                      if (!task.isDone)
                        Text(
                          task.description,
                          style: Theme.of(context).textTheme.displaySmall
                              ?.copyWith(color: const Color(0xffC6C6C6)),
                        ),
                    ],
                  ),
                ),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'delete') {
                      context.read<TaskCubit>().deleteTask(index);
                    }
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(value: 'delete', child: Text('Delete')),
                  ],
                  icon: const Icon(Icons.more_vert, color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
