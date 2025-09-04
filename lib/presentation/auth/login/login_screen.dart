import 'package:chatter/app/routing/routes.dart';
import 'package:chatter/app/styles/font_style.dart';
import 'package:chatter/presentation/auth/signup/widgets/custom_text_field.dart';
import 'package:chatter/presentation/auth/signup/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chatter/presentation/auth/cubit/cubit_logic.dart';
import 'package:chatter/presentation/auth/cubit/cubit_states.dart';
import 'package:chatter/data/models/requests/login_request_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isFormValid = false;

  void _checkFormValid() {
    setState(() {
      isFormValid =
          (emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty &&
          passwordController.text.length >= 6);
    });
  }

  @override
  void initState() {
    super.initState();
    emailController.addListener(_checkFormValid);
    passwordController.addListener(_checkFormValid);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text(
                'Login Successful!',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.failure.title ?? 'Login failed',
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF1877F2),
                  Color(0xFF1877F2),
                  Colors.white,
                  Colors.white,
                ],
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
                        child: Text('Login', style: FontStyles.titlePacifico),
                      ),
                      const SizedBox(height: 50),
                      Form(
                        key: _formKey,
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
                            state is AuthLoading
                                ? const CircularProgressIndicator()
                                : LoginButtons(
                                    buttonName: 'login',
                                    buttonColor: isFormValid
                                        ? Colors.blue
                                        : Colors.grey,
                                    onPressed: isFormValid
                                        ? () {
                                            if (_formKey.currentState
                                                    ?.validate() ??
                                                false) {
                                              final request = LoginRequestModel(
                                                username: emailController.text,
                                                password:
                                                    passwordController.text,
                                              );
                                              context
                                                  .read<AuthCubit>()
                                                  .loginUser(request);
                                            }
                                          }
                                        : null,
                                  ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.grey[300],
                            ),
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
                            child: Container(
                              height: 1,
                              color: Colors.grey[300],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'Roboto',
                          ),
                          children: [
                            TextSpan(
                              text: "Don't have an account? ",
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            WidgetSpan(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    RoutesNames.signUp,
                                  );
                                },
                                child: const Text(
                                  'Sign up.',
                                  style: TextStyle(
                                    color: Color(0xFF1877F2),
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
      },
    );
  }
}
