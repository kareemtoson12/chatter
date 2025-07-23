import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/app/theme_cubit.dart';
import 'package:social/app/routing/routes.dart';
import 'package:social/app/routing/routing.dart';

class Chatter extends StatelessWidget {
  const Chatter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Chatty',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: themeMode,
            initialRoute: AppRoutes.splash,
            onGenerateRoute: generateRoute,
          );
        },
      ),
    );
  }
}
