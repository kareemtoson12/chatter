import 'package:flutter/material.dart';

import 'package:social/app/routing/routes.dart';
import 'package:social/app/routing/routing.dart';

class Chatter extends StatelessWidget {
  const Chatter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense App',
      initialRoute: AppRoutes.onboarding,
      onGenerateRoute: generateRoute,
    );
  }
}
