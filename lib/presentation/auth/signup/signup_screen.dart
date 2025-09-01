import 'package:chatter/app/routing/routes.dart';
import 'package:chatter/app/shared_pref.dart';
import 'package:chatter/app/styles/font_style.dart';
import 'package:chatter/data/models/requests/register_request_model.dart';
import 'package:chatter/presentation/auth/cubit/cubit_logic.dart';
import 'package:chatter/presentation/auth/cubit/cubit_states.dart';
import 'package:chatter/presentation/auth/signup/widgets/already_have_acc_widget.dart';
import 'package:chatter/presentation/auth/signup/widgets/custom_text_field.dart';
import 'package:chatter/presentation/auth/signup/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  bool isFormValid = false;

  void _checkFormValid() {
    bool emailValid =
        emailController.text.isNotEmpty && emailController.text.contains('@');
    bool usernameValid = userNameController.text.isNotEmpty;
    bool passwordValid =
        passwordController.text.isNotEmpty &&
        passwordController.text.length >= 6;

    setState(() {
      isFormValid = emailValid && usernameValid && passwordValid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          SharedPref.saveToken(state.response.token);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text(
                'Registration Successful!',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
              margin: const EdgeInsets.all(16),
              duration: const Duration(seconds: 2),
            ),
          );
          Navigator.pushNamed(context, RoutesNames.login);
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.failure.message ?? 'Registration failed',
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
              margin: const EdgeInsets.all(16),
              duration: const Duration(seconds: 2),
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
                        child: Text('Sign Up', style: FontStyles.titlePacifico),
                      ),
                      const SizedBox(height: 50),
                      Form(
                        key: _formKey,
                        onChanged:
                            _checkFormValid, // تحقق من صحة الفورم عند أي تغيير
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
                              controller: userNameController,
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
                            const SizedBox(height: 45),
                            state is AuthLoading
                                ? const CircularProgressIndicator()
                                : LoginButtons(
                                    buttonName: 'Sign Up',
                                    buttonColor: isFormValid
                                        ? Colors.blue
                                        : Colors.red, // لون الزر حسب صحة الفورم
                                    onPressed: isFormValid
                                        ? () {
                                            final request = RegisterRequest(
                                              bio: emailController.text,
                                              username: userNameController.text,
                                              password: passwordController.text,
                                              title: 'New User',
                                            );
                                            context
                                                .read<AuthCubit>()
                                                .registerUser(request);
                                          }
                                        : null, // Disable if form invalid
                                  ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      AlreadyHaveAccWidget(),
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
