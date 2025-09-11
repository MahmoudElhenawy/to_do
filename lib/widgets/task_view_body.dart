import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/cubit/task/task_cubit.dart';
import 'package:to_do_app/cubit/user/user_cubit.dart';
import 'package:to_do_app/model/user_model.dart';
import 'package:to_do_app/widgets/item_task_list_view.dart';
import 'package:to_do_app/widgets/list_tile_of_detiles.dart';

class TaskViewBody extends StatelessWidget {
  const TaskViewBody({super.key});

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
          style: Theme.of(
            context,
          ).textTheme.displaySmall?.copyWith(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              BlocBuilder<UserCubit, UserModel?>(
                builder: (context, user) {
                  final username = user?.username ?? 'Guest';
                  return ListTileOfDetiles(username: username);
                },
              ),
              const SizedBox(height: 20),
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
