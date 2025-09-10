import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/custom_elevated_button.dart';
import 'package:to_do_app/widgets/custom_text_field.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Details')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CustomTextField(hintText: 'username', label: 'Username'),
            const SizedBox(height: 20),
            const CustomTextField(
              hintText: 'Motivation Quote',
              label: 'Motivation Quote',
              maxLines: 6,
            ),
            const Spacer(),
            CustomElevatedButton(text: 'Save Changes', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
