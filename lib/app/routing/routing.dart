import 'package:chatter/app/routing/routes.dart';
import 'package:chatter/presentation/auth/login/login_screen.dart';
import 'package:chatter/presentation/auth/signup/signup_screen.dart';
import 'package:chatter/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutesNames.splash:
      return MaterialPageRoute(builder: (_) => const SplashScreen());
    case RoutesNames.signUp:
      return MaterialPageRoute(builder: (_) => const SignUpScreen());
    case RoutesNames.login:
      return MaterialPageRoute(builder: (_) => const LoginScreen());
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(child: Text('Unknown Route')),
        ),
      );
  }
}
