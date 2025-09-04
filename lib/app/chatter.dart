import 'package:chatter/app/routing/routing.dart';
import 'package:chatter/presentation/home/home_screen.dart';
import 'package:chatter/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class Chatter extends StatelessWidget {
  const Chatter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData(
        primaryColor: Colors.blue,
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.blue),
      ),
      //  onGenerateRoute: generateRoute,
    );
  }
}
