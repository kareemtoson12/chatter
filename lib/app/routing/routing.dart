import 'package:chatter/app/di/di.dart';
import 'package:chatter/app/routing/routes.dart';
import 'package:chatter/domain/usecase/login_usecase.dart';
import 'package:chatter/presentation/auth/login/login_screen.dart';
import 'package:chatter/presentation/auth/signup/signup_screen.dart';
import 'package:chatter/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chatter/presentation/auth/cubit/cubit_logic.dart';
import 'package:chatter/domain/usecase/register_usecase.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutesNames.splash:
      return MaterialPageRoute(builder: (_) => const SplashScreen());
    case RoutesNames.signUp:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => AuthCubit(sl<RegisterUseCase>(), sl<LoginUsecase>()),
          child: const SignUpScreen(),
        ),
      );
    case RoutesNames.login:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => AuthCubit(sl<RegisterUseCase>(), sl<LoginUsecase>()),
          child: const LoginScreen(),
        ),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(child: Text('Unknown Route')),
        ),
      );
  }
}
