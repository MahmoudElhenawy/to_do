import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/cubit/taskcubit/task_cubit.dart';
import 'package:to_do_app/cubit/theme/theme_cubit.dart';
import 'package:to_do_app/model/task_model.dart';
import 'package:to_do_app/theme/theme_data_dark.dart';
import 'package:to_do_app/theme/theme_data_white.dart';
import 'package:to_do_app/views/add_task_view.dart';
import 'package:to_do_app/views/splash_view.dart';
import 'package:to_do_app/views/user_detiles.dart';
import 'package:to_do_app/views/welcame_view.dart';
import 'package:to_do_app/widgets/custom_nav_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>('tasks');

  runApp(const ToDo());
}

class ToDo extends StatelessWidget {
  const ToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TaskCubit()),
        BlocProvider(create: (_) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: "/",
            routes: {
              "/": (context) => SplashView(),
              "/welcomeView": (context) => WelcomeView(),
              "/tasks": (context) => const CustomNavBar(),
              "/add": (context) => AddTask(),
              "/userDetails": (context) => UserDetails(),
            },
            themeMode: themeMode,
            theme: getThemeDataLight(),
            darkTheme: getThemeDataDark(),
          );
        },
      ),
    );
  }
}
