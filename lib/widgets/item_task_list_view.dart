import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/provider/task_provider.dart';

class ItemTaskListView extends StatelessWidget {
  const ItemTaskListView({super.key, required this.taskProvider});

  final TaskProvider taskProvider;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: taskProvider.tasks.length,
      itemBuilder: (context, index) {
        final task = taskProvider.tasks[index];
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
                  onChanged: (value) {
                    context.read<TaskProvider>().toggleTaskDone(index);
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
                              decorationColor: Color(0xffC6C6C6),
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
              ],
            ),
          ),
        );
      },
    );
  }
}
