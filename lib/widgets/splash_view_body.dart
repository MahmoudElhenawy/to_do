import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({
    super.key,
    required Animation<double> fadeAnimation,
    required Animation<double> scaleAnimation,
  }) : _fadeAnimation = fadeAnimation,
       _scaleAnimation = scaleAnimation;

  final Animation<double> _fadeAnimation;
  final Animation<double> _scaleAnimation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.05, -0.05),
            radius: 2,
            colors: [Color(0xFF000000), Color(0xFF00695C)],
            stops: [0.1, 1.0],
          ),
        ),
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: SvgPicture.asset('assets/logo.svg', width: 87, height: 87),
            ),
          ),
        ),
      ),
    );
  }
}
