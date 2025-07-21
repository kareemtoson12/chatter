import 'package:flutter/material.dart';
import 'package:social/app/routing/routes.dart';

import 'package:social/app/styles/fonts.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    //navigation after 2 sec
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Text('chatter', style: AppTextStyles.splashTitleStyle()),
        ),
      ),
    );
  }
}
