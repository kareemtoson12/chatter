import 'package:flutter/material.dart';
import 'package:social/app/routing/routes.dart';
import 'package:social/presentation/auth/login/login_view.dart';
import 'package:social/presentation/auth/signup/signup_view.dart';
import 'package:social/presentation/home/home_view.dart';

import 'package:social/presentation/splash/splash_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splash:
      return MaterialPageRoute(builder: (_) => const SplashView());

    // home case

    case AppRoutes.home:
      return MaterialPageRoute(builder: (_) => const HomeView());
    case AppRoutes.login:
      return MaterialPageRoute(builder: (_) => const LoginView());
    case AppRoutes.signUp:
      return MaterialPageRoute(builder: (_) => const SignUpView());

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          backgroundColor: Colors.transparent,
          body: const Center(child: Text('Unknown Route')),
        ),
      );
  }
}
