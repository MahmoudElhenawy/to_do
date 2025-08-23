import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/logo.svg', width: 42, height: 42),
        const SizedBox(width: 16),
        Text('Tasky', style: Theme.of(context).textTheme.displayLarge),
      ],
    );
  }
}
