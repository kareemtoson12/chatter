import 'package:flutter/material.dart';
import 'package:social/app/styles/colros_manager.dart';
import 'package:social/app/styles/fonts.dart';
import 'package:social/presentation/auth/login/widgets/login_button.dart';
import 'package:social/presentation/auth/login/widgets/text_feaild.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    //responsive
    int hight = MediaQuery.of(context).size.height.toInt();
    //int width = MediaQuery.of(context).size.width.toInt();
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(hight * 0.02),
          decoration: BoxDecoration(gradient: ColorManager.blueWhiteGradient),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: hight * 0.15),
              Center(
                child: Text('chatter', style: AppTextStyles.splashTitleStyle()),
              ),
              SizedBox(height: 40),
              TextFeaildWidget(),
              SizedBox(height: 40),
              LoginButton(),
              SizedBox(height: 100),
              Row(
                children: [
                  Expanded(
                    child: Divider(thickness: 1, color: Colors.grey.shade300),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'OR',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(thickness: 1, color: Colors.grey.shade300),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                    children: [
                      TextSpan(
                        text: 'Sign up.',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
