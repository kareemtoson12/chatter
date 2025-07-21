import 'package:flutter/material.dart';
import 'package:social/app/routing/routes.dart';
import 'package:social/presentation/home/home_view.dart';

import 'package:social/presentation/splash/splash_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splash:
      return MaterialPageRoute(builder: (_) => const SplashView());
    // home case

    case AppRoutes.home:
      return MaterialPageRoute(builder: (_) => const HomeView());

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          backgroundColor: Colors.transparent,
          body: const Center(child: Text('Unknown Route')),
        ),
      );
  }
}
