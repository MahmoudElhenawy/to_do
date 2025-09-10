import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubit/user/user_cubit.dart';
import 'package:to_do_app/model/user_model.dart';
import 'package:to_do_app/widgets/custom_elevated_button.dart';
import 'package:to_do_app/widgets/custom_text_field.dart';

class UserDetails extends StatelessWidget {
  UserDetails({super.key});

  final usernameController = TextEditingController();
  final quoteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Details')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            CustomTextField(
              controller: usernameController,
              hintText: 'username',
              label: 'Username',
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: quoteController,
              hintText: 'Motivation Quote',
              label: 'Motivation Quote',
              maxLines: 6,
            ),
            const Spacer(),
            CustomElevatedButton(
              text: 'Save Changes',
              onPressed: () {
                final user = UserModel(
                  username: usernameController.text,
                  quote: quoteController.text,
                );
                context.read<UserCubit>().saveUser(user);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
