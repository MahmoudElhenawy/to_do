import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:to_do_app/cubit/theme/theme_cubit.dart';
import 'package:to_do_app/cubit/user/user_cubit.dart';
import 'package:to_do_app/model/user_model.dart';
import 'package:to_do_app/widgets/custom_switch.dart';
import 'package:to_do_app/widgets/profile_info.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  Future<void> _pickImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      context.read<UserCubit>().updateUserImage(pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile', style: TextStyle(fontSize: 20)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<UserCubit, UserModel?>(
              builder: (context, user) {
                return Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: user?.imagePath != null
                          ? FileImage(File(user!.imagePath!))
                          : const AssetImage('assets/default_avatar.png')
                                as ImageProvider,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () => _pickImage(context),
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
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 12),

            BlocBuilder<UserCubit, UserModel?>(
              builder: (context, user) {
                return Column(
                  children: [
                    Text(
                      user?.username ?? "Guest",
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      user?.quote ?? "No motivation yet",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).iconTheme.color,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
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

            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/userDetails');
              },
              child: ProfileInfo(
                imagePath: 'assets/prof.svg',
                title: 'User Details',
                trailing: Icon(
                  Icons.arrow_forward_outlined,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            ),
            Divider(
              color: Theme.of(context).iconTheme.color,
              thickness: 1,
              height: 32,
            ),

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
            Divider(
              color: Theme.of(context).iconTheme.color,
              thickness: 1,
              height: 32,
            ),
            GestureDetector(
              onTap: () {
                context.read<UserCubit>().logout();
                Navigator.pushReplacementNamed(context, "/welcomeView");
              },
              child: ProfileInfo(
                imagePath: 'assets/logout.svg',
                title: 'Log Out',
                trailing: Icon(
                  Icons.arrow_forward_outlined,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
