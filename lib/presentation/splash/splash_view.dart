import 'dart:async';
import 'package:flutter/material.dart';
import 'package:social/app/styles/colros_manager.dart';
import 'package:social/presentation/home/home_view.dart';
import 'package:social/presentation/onboarding/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    // Navigate after 2 seconds
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const OnboardingView(),
        ), // or your onboarding/login screen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: ColorManager.blueWhiteGradient),
        child: SafeArea(
          child: Center(
            child: Image.asset(
              'assets/images/icon.png',
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                print('Error loading image: $error');
                return Container(
                  color: Colors.grey[300],
                  child: const Center(child: Text('Image not found')),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
