import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/model/task_model.dart';
import 'package:to_do_app/provider/task_provider.dart';
import 'package:to_do_app/widgets/custom_elevated_button.dart';
import 'package:to_do_app/widgets/custom_switch.dart';
import 'package:to_do_app/widgets/custom_text_field.dart';

class AddTask extends StatelessWidget {
  AddTask({super.key});
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController taskDescriptionController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Add Task')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      CustomTextField(
                        controller: taskNameController,
                        hintText: 'Finish UI design for login screen',
                        label: 'Task Name',
                      ),
                      const SizedBox(height: 28),
                      CustomTextField(
                        controller: taskDescriptionController,
                        maxLines: 6,
                        hintText:
                            'Finish onboarding UI and hand off to devs by Thursday.',
                        label: 'Task Description',
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            'High Priority',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          const Spacer(),
                          const CustomSwitch(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              CustomElevatedButton(
                text: 'add task',
                icon: Icons.add,
                onPressed: () {
                  final taskName = taskNameController.text;
                  final taskDescription = taskDescriptionController.text;

                  if (taskName.isNotEmpty && taskDescription.isNotEmpty) {
                    Provider.of<TaskProvider>(context, listen: false).addTask(
                      Task(description: taskDescription, title: taskName),
                    );
                    Navigator.pop(context);
                  }
                },
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
