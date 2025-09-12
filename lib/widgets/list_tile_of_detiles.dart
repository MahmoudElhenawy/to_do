import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/cubit/theme/theme_cubit.dart';

class ListTileOfDetiles extends StatelessWidget {
  const ListTileOfDetiles({super.key, required this.username, this.imagePath});

  final String username;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 40,
        height: 40,
        child: CircleAvatar(
          radius: 100,
          backgroundImage: imagePath != null
              ? FileImage(File(imagePath!))
              : const AssetImage('assets/Thumbnail.png') as ImageProvider,
        ),
      ),
      title: Text(
        'Good Evening, $username',
        style: Theme.of(context).textTheme.displayMedium,
      ),
      subtitle: Text(
        'One task at a time. One step closer.',
        style: Theme.of(
          context,
        ).textTheme.displaySmall?.copyWith(color: Theme.of(context).cardColor),
      ),
      trailing: SizedBox(
        width: 32,
        height: 32,
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) {
            return SvgPicture.asset(
              themeMode == ThemeMode.dark
                  ? 'assets/Light.svg'
                  : 'assets/dark.svg',
            );
          },
        ),
      ),
    );
  }
}
