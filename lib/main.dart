import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/provider/task_provider.dart';
import 'package:to_do_app/views/add_task_view.dart';
import 'package:to_do_app/views/home_view.dart';
import 'package:to_do_app/views/welcame_view.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_) => TaskProvider(), child: ToDo()));
}

class ToDo extends StatelessWidget {
  const ToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => WelcomeView(),
        "/tsks": (context) => TasksView(),
        "/add": (context) => AddTask(),
      },
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.white,
          color: Colors.black,
          titleTextStyle: TextStyle(fontSize: 20),
        ),
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
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
