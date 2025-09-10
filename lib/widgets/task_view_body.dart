import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/cubit/task/task_cubit.dart';
import 'package:to_do_app/widgets/item_task.dart';

class TaskViewBody extends StatelessWidget {
  const TaskViewBody({super.key, required this.userName});
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushNamed('/add');
        },
        icon: const Icon(Icons.add),
        label: Text(
          'Add New Task',
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              ListTile(
                leading: SizedBox(
                  width: 32,
                  height: 32,
                  child: CircleAvatar(
                    radius: 100,
                    child: Image.asset('assets/Thumbnail.png'),
                  ),
                ),
                title: Text(
                  'Good Evening, $userName',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                subtitle: Text(
                  'One task at a time. One step closer.',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: Theme.of(context).cardColor,
                  ),
                ),
                trailing: SizedBox(
                  width: 32,
                  height: 32,
                  child: SvgPicture.asset('assets/Light.svg'),
                ),
              ),

              const SizedBox(height: 20),

              /// --- Greeting ---
              ListTile(
                title: Text(
                  'Yuhuu ,Your work Is',
                  style: Theme.of(
                    context,
                  ).textTheme.displayLarge?.copyWith(fontSize: 32),
                ),
                subtitle: Row(
                  children: [
                    Text(
                      'almost done !',
                      style: Theme.of(
                        context,
                      ).textTheme.displayLarge?.copyWith(fontSize: 32),
                    ),
                    const SizedBox(width: 8),
                    SvgPicture.asset('assets/hand.svg', width: 32, height: 32),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '  My Tasks',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// --- Task List ---
              Expanded(
                child: BlocBuilder<TaskCubit, TaskState>(
                  builder: (context, state) {
                    if (state.tasksList.isEmpty) {
                      return const Center(
                        child: Text('No tasks yet. Add one!'),
                      );
                    }
                    return ItemTaskListView(tasks: state.tasksList);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
