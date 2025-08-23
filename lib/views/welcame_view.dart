import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/widgets/custom_app_bar.dart';

import 'package:to_do_app/widgets/custom_elevated_button.dart';
import 'package:to_do_app/widgets/custom_text_field.dart';

class WelcomeView extends StatelessWidget {
  WelcomeView({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 9),
                const CustomAppbar(),
                const SizedBox(height: 108),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome to Tasky',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(width: 8),
                    SvgPicture.asset('assets/hand.svg', width: 28, height: 28),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Your productivity journey starts here.',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: 24),
                SvgPicture.asset('assets/3.svg', width: 215, height: 205),
                const SizedBox(height: 28),

                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ).copyWith(top: 8.0, bottom: 24.0),
                  child: CustomTextField(
                    label: 'Full Name',
                    hintText: 'Enter your name',
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    bottom: 10.0,
                  ),
                  child: CustomElevatedButton(
                    text: "Let’s Get Started",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(
                          context,
                          '/tsks',
                          arguments: _nameController.text,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
