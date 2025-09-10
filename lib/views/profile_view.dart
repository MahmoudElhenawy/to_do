import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubit/theme/theme_cubit.dart';
import 'package:to_do_app/widgets/custom_switch.dart';
import 'package:to_do_app/widgets/profile_info.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile', style: TextStyle(fontSize: 20)),
      ),
      body: SingleChildScrollView(
        // 👈 علشان يمنع الـ overflow
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/Thumbnail.png'),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 17,
                    backgroundColor: const Color(0xff181818),
                    child: Image.asset(
                      'assets/camera.png',
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'mahmoud elhenawy',
              style: Theme.of(
                context,
              ).textTheme.displayLarge?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 4),
            Text(
              'One task at a time. One step closer.',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.white70),
            ),
            const SizedBox(height: 32),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Profile Info',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            const SizedBox(height: 20),

            // Profile Items
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/userDetails');
              },
              child: ProfileInfo(
                imagePath: 'assets/prof.svg',
                title: 'User Details',
                trailing: const Icon(
                  Icons.arrow_forward_outlined,
                  color: Colors.white,
                ),
              ),
            ),
            const Divider(color: Colors.white54, thickness: 1, height: 32),

            ProfileInfo(
              imagePath: 'assets/Leading element.svg',
              title: 'Dark Mode',
              trailing: CustomSwitch(
                value: context.watch<ThemeCubit>().state == ThemeMode.dark,
                onChanged: (_) {
                  context.read<ThemeCubit>().toggleTheme();
                },
              ),
            ),
            const Divider(color: Colors.white54, thickness: 1, height: 32),

            ProfileInfo(
              imagePath: 'assets/logout.svg',
              title: 'Log Out',
              trailing: const Icon(
                Icons.arrow_forward_outlined,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
