import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/model/nav_bar_model.dart';
import 'package:to_do_app/views/completed_tasks_view.dart';
import 'package:to_do_app/views/home_view.dart';
import 'package:to_do_app/views/profile_view.dart';
import 'package:to_do_app/views/to_do_tasks_view.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int currentIndex = 0;
  List<Widget> widgets = [
    TasksView(),
    ToDoTasksView(),
    CompletedTasksView(),
    ProfileView(),
  ];
  BottomNavigationBarItem items(NavBarModel navbar) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        navbar.imagePath,
        colorFilter: ColorFilter.mode(
          currentIndex == navbar.index
              ? const Color(0xff15B86C)
              : Theme.of(context).iconTheme.color!,
          BlendMode.srcIn,
        ),
      ),
      label: navbar.label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgets[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,

        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        currentIndex: currentIndex,
        selectedItemColor: Color(0xff15B86C),
        items: [
          items(
            NavBarModel(index: 0, imagePath: 'assets/home.svg', label: 'Home'),
          ),
          items(
            NavBarModel(index: 1, imagePath: 'assets/todo.svg', label: 'To Do'),
          ),
          items(
            NavBarModel(
              index: 2,
              imagePath: 'assets/completed.svg',
              label: 'Completed',
            ),
          ),
          items(
            NavBarModel(
              index: 3,
              imagePath: 'assets/profiles.svg',
              label: 'Profile',
            ),
          ),
        ],
      ),
    );
  }
}
