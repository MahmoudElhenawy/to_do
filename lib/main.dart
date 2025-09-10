import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/cubit/taskcubit/task_cubit.dart';
import 'package:to_do_app/model/task_model.dart';
import 'package:to_do_app/views/add_task_view.dart';
import 'package:to_do_app/views/home_view.dart';
import 'package:to_do_app/views/splash_view.dart';
import 'package:to_do_app/views/welcame_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>('tasks');
  runApp(BlocProvider(create: (_) => TaskCubit(), child: const ToDo()));
}

class ToDo extends StatelessWidget {
  const ToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => SplashView(),
        "/welcomeView": (context) => WelcomeView(),
        "/tasks": (context) => TasksView(),
        "/add": (context) => AddTask(),
      },
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.white,
          color: Colors.black,
          titleTextStyle: TextStyle(fontSize: 20),
        ),
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w400,
            color: Color(0xffffffff),
          ),
          displayMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: Color(0xffFFFCFC),
          ),
          displaySmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xffFFFCFC),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff15B86C),
            foregroundColor: const Color(0xffFFFCFC),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xff15B86C),
          foregroundColor: Color(0xffFFFCFC),
        ),
      ),
    );
  }
}
