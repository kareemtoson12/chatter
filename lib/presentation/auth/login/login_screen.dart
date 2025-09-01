import 'package:chatter/app/routing/routes.dart';
import 'package:chatter/app/styles/font_style.dart';
import 'package:chatter/presentation/auth/signup/widgets/custom_text_field.dart';
import 'package:chatter/presentation/auth/signup/widgets/login_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controllers
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Center(child: Text('Login', style: FontStyles.titlePacifico)),
                const SizedBox(height: 50),
                Form(
                  child: Column(
                    children: [
                      CustomTextField(
                        name: 'userName',
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a userName';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        name: 'Password',
                        controller: passwordController,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 6) {
                            return 'Please enter a valid password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 25),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forget password?',
                          style: FontStyles.pacificoBlue15,
                        ),
                      ),
                      const SizedBox(height: 45),
                      LoginButtons(buttonName: 'login', onPressed: () {}),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                // OR divider
                Row(
                  children: [
                    Expanded(
                      child: Container(height: 1, color: Colors.grey[300]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'OR',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(height: 1, color: Colors.grey[300]),
                    ),
                  ],
                ),

                const SizedBox(height: 40), // Space after OR divider
                // Sign up text
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Roboto', // Default Flutter font
                    ),
                    children: [
                      TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RoutesNames.signUp);
                          },
                          child: const Text(
                            'Sign up.',
                            style: TextStyle(
                              color: Color(0xFF1877F2), // Facebook blue
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
