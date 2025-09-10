import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    super.key,
    required this.imagePath,
    required this.title,
    this.trailing,
  });

  final String imagePath;
  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(imagePath, width: 32, height: 32),
        const SizedBox(width: 16),
        Text(title, style: Theme.of(context).textTheme.displaySmall),
        const Spacer(),
        if (trailing != null) trailing!,
      ],
    );
  }
}
