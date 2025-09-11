import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/task_view_body.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: TaskViewBody());
  }
}
