import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/cubit/theme/theme_cubit.dart';

class ListTileOfDetiles extends StatelessWidget {
  const ListTileOfDetiles({super.key, required this.username});

  final String username;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 32,
        height: 32,
        child: CircleAvatar(
          radius: 100,
          child: Image.asset('assets/Thumbnail.png'),
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
