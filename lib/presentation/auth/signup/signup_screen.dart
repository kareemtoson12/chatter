import 'package:chatter/app/routing/routes.dart';
import 'package:chatter/app/styles/font_style.dart';
import 'package:chatter/presentation/auth/signup/widgets/custom_text_field.dart';
import 'package:chatter/presentation/auth/signup/widgets/login_button.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controllers
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1877F2),
              Color(0xFF1877F2),

              Colors.white,
              Colors.white,
            ], // white to blue
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Center(
                    child: Text('Sign Up', style: FontStyles.titlePacifico),
                  ),
                  const SizedBox(height: 50),
                  Form(
                    child: Column(
                      children: [
                        CustomTextField(
                          name: 'Email',
                          controller: emailController,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !value.contains('@')) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          name: 'UserName',
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

                        const SizedBox(height: 45),
                        LoginButtons(buttonName: 'Sign Up', onPressed: () {}),
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
                          text: "Already have an account? ",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: () {
                              // Handle sign up action
                              Navigator.pushNamed(context, RoutesNames.login);
                            },
                            child: const Text(
                              'Login ',
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
      ),
    );
  }
}
