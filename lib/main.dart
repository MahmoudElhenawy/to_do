import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/cubit/task/task_cubit.dart';
import 'package:to_do_app/cubit/theme/theme_cubit.dart';
import 'package:to_do_app/cubit/user/user_cubit.dart';
import 'package:to_do_app/model/task_model.dart';
import 'package:to_do_app/model/user_model.dart';
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
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<TaskModel>('tasks');
  await Hive.openBox<UserModel>('userBox');

  final userBox = Hive.box<UserModel>('userBox');
  final hasUser = userBox.get('currentUser') != null;

  runApp(ToDo(hasUser: hasUser));
}

class ToDo extends StatelessWidget {
  const ToDo({super.key, required this.hasUser});
  final bool hasUser;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TaskCubit()),
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => UserCubit()..loadUser()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: hasUser ? "/tasks" : "/welcomeView",
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
